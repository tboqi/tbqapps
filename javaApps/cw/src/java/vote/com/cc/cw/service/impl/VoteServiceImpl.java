package com.cc.cw.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.dao.ChannelDAO;
import com.cc.cw.dao.MemberDAO;
import com.cc.cw.dao.SessionValDAO;
import com.cc.cw.dao.SimpleArticleDAO;
import com.cc.cw.dao.VoteDAO;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.Vote;
import com.cc.cw.service.VoteService;

public class VoteServiceImpl implements VoteService{
	protected final Log log = LogFactory.getLog(getClass());
	private VoteDAO dao;
	
	private SimpleArticleDAO articleDAO;
	private ChannelDAO channelDAO;
	private MemberDAO memberDAO;
	private SessionValDAO sessionValDAO;
	
	public MemberDAO getMemberDAO() {
		return memberDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	public VoteDAO getDao() {
		return dao;
	}

	public void setDao(VoteDAO dao) {
		this.dao = dao;
	}

	public Vote get(int id) {
		return dao.get(id);
	}

	public boolean delete(int id) {
		return dao.remove(id) > 0;
	}

	public int update(Vote vote) {
		return dao.update(vote);
	}
	
	public int voteArticle(Vote vote){
		//首先判断此用户是否对这个资源投票v
		Vote isVoted = dao.isExistForArticle(vote.getVoteMember(),vote.getResourceId(),vote.getResourceType());
		if(vote.getVoteMember().length()>20){
			if(isVoted != null){
				//update
				isVoted.setVoteNumber(isVoted.getVoteNumber()+1);
				dao.update(isVoted);
			}else{
				dao.add(vote);
			}
			sessionValDAO.incVotes(vote.getVoteMember(), -1);
		}else{
			Member m = memberDAO.get(Integer.parseInt(vote.getVoteMember()));
			if(m.getPrivilege()>0){
				memberDAO.updatePrivilege(m.getId(), m.getPrivilege()-1);
			}else{
				return 0;
			}
			
			if(isVoted != null){
//				update
				isVoted.setVoteNumber(isVoted.getVoteNumber()+1);
				dao.update(isVoted);
			}else{
				dao.add(vote);
			}
			
		}
		updateResourceVoteCount(vote.getResourceId(),vote.getResourceType() , vote.getVoteCategory());
		return 1;
	}
	
	public int vote(Vote vote){
		//首先判断此用户是否对这个资源投票v
		boolean isVoted = dao.isExist(vote.getMemberId(),vote.getResourceId(),vote.getResourceType());
		if(isVoted){
			return 3;
		}else{
			Member member = memberDAO.get(vote.getMemberId());
			if(member != null){
				if(member.getPrivilege() >= vote.getVoteNumber()){
					//更新会员票数
					memberDAO.updatePrivilege(member.getId() , member.getPrivilege() - vote.getVoteNumber());
					//更新被投票资源的票数
					updateResourceVoteCount(vote.getResourceId(),vote.getResourceType() , vote.getVoteCategory());
					int result = dao.add(vote);
					if(result > 0)
						return 1;
					else 
						return 0;
				}else{
					log.info("privilege error");
					return 2;
				}
			}else{
				log.info("member is null");
			}
				return 0;
		}
	}
	
	public List<Vote> getVoteListByDate(int resourceId,String type,String beginDate,String endDate){
		return dao.getVoteListByDate(resourceId,type,beginDate , endDate);
	}

	
	
	/**
	 * 根据传入的资源类型，投票类型，更新被投票资源的票数
	 * @param resourceType
	 * @param voteCategory
	 * @return
	 */
	private boolean updateResourceVoteCount(int resourceId,String resourceType , String voteCategory){
		if("Article".equals(resourceType))
			return articleDAO.updateVoteCount(resourceId,voteCategory) > 0;//更新article表中投票数，要判断投票类型
		else if("Channel".equals(resourceType))
			return channelDAO.updateVoteCount(resourceId,voteCategory) > 0;//更新channel表中投票数，要判断投票类型
		else{ 
			log.debug("没有合适的资源类型");
			return false;
		}
	}
	
	/**
	 *处理所有已经评论过的文章
	 *1.首先找出所有二次投票、并已经到结束日期的文章
	 *2.更新这些文章的status = 3
	 *3.计算出最终结果(a.支持方票多,b.反对方票多.c.双方打平)
	 *
	 *4.将查出的每一个文章的id，和结果(支持多还是反对多，)找到应了的memberId,和点数
	 *5.将member的票数更新
	 * @return
	 */
	public void voteFinishProcess(){
		List<SimpleArticle>  articleList = articleDAO.getAllVoteFinishSimpleArticle();//1.找出所有二次投票、并已经到结束日期的文章
		log.info("artidle.size() --> " + articleList.size());
		if(articleList == null || articleList.size() == 0)
			return ;
		
		for(SimpleArticle sa : articleList){
			articleDAO.updateState(sa.getId(),3);			//2.更新这些文章的status = 3
			
			String category; 					//得到最终结果，支持多还是反对多
			int sVoteCount = getSupportVoteCountByArticleId(sa.getId());
			int unsVoteCount = getUnSupportVoteCountByArticleId(sa.getId());
			log.info("support ->"+sVoteCount);
			log.info("unspport ->"+unsVoteCount);
			if(sVoteCount > unsVoteCount ){
				category = "Support";
				sa.setVoteResultType(1);
				articleDAO.updateVoteResultType(sa.getId(),1);
			}
			else if(sVoteCount < unsVoteCount){
				category = "UnSupport";
				sa.setVoteResultType(2);
				articleDAO.updateVoteResultType(sa.getId(),2);
			}
			else{
				category = null;
				articleDAO.updateVoteResultType(sa.getId(),3);
			}
				
			log.info("获胜方 "+category);
			
			//获得所有投过票的用户
			List<Vote> voteList = dao.getByArticleId(sa.getId());
			
			if(category == null){ 	//双方打平
				for(Vote vote : voteList){
					Member member = memberDAO.get(vote.getMemberId());
					int pValue = vote.getVoteNumber();
					log.info("pValue-> " + pValue);
					if(member == null)continue;
					member.setPrivilege(member.getPrivilege() + pValue);
					memberDAO.update(member);
				}
				continue ;
			}else{					//分出胜负
				double totalWinNum = 0;
				double totalLoseNum = 0;
				for(Vote vote : voteList){
					if(vote.getVoteCategory().equals(category)){//赢
						totalWinNum = totalWinNum + vote.getVoteNumber();    //获得赢了的用户投的总票数
						log.info("win ->"+totalWinNum);
					}else{//输
						totalLoseNum = totalLoseNum + vote.getVoteNumber();//获得输了的用户投的总票数
						log.info("lose ->"+totalLoseNum);
					}
				}
				log.info("总获胜票数 " + totalWinNum);
				log.info("总失败票数 " + totalLoseNum);
				
				double avgNum; //平均值
				if(totalWinNum != 0){
					avgNum = (totalWinNum + totalLoseNum) / totalWinNum;
					avgNum = Double.parseDouble(new java.text.DecimalFormat("0.000").format(avgNum));
				}else
					avgNum = 1;
				log.info("平均值　"+avgNum);
				for(Vote v: voteList){//给分
					if(v.getVoteCategory().equals(category)){         
						Member m = memberDAO.get(v.getMemberId());
						
						double value = ((double)v.getVoteNumber())*avgNum;//根据此会员投票数*平均数，得到此会员的收益
						log.debug(((double)v.getVoteNumber()) + "*" + avgNum + " = "+value);
						
						int integerValue = (int)value;//此会员这次获得的票数整数部分
						double decimalValue = value - integerValue; //此会员获得的票数小数部分
						log.debug("整数值为" + integerValue);
						log.debug("小数值为" + decimalValue);
						
						//会员历史票数小数部分和这次获得的小数部分相加，前提是取小数前3位并乘1000
						int privilegeDecimalValue = m.getPrivilegeDecimalValue() + (int)(decimalValue  * 1000);
						log.debug(privilegeDecimalValue +" <========");
						//如果这个值超过10000，则将会员的整数票数+1
						if(privilegeDecimalValue >= 1000){
							m.setPrivilege(m.getPrivilege() + integerValue + 1);//历史整数票数+这次获得整数票数+进位1
							m.setPrivilegeDecimalValue(privilegeDecimalValue - 1000);//将小数部分-1000，重新存储，待下次进位用
							log.debug("累计分数多于一票，票数加１，整数票数为" + integerValue + 1+ "　小数为　" + (privilegeDecimalValue - 1000));
						}else{
							m.setPrivilege(m.getPrivilege() + integerValue);//历史整数票数+这次获得整数票数
							m.setPrivilegeDecimalValue(privilegeDecimalValue);//将小数部分存储
							log.debug("累计分数不足一票整数票数为" + integerValue+ "　小数为　" + privilegeDecimalValue);
						}
						memberDAO.update(m);
					}else
						log.debug("没有匹配纪录");
				}
			}
		}
	}
	
	/**
	 *处理所有已经评论过的文章
	 *1.首先找出所有一次投票、并已经到结束日期的文章
	 *2.更新这些文章的status = 1
	 *3.计算出最终结果(a.支持方票多,b.反对方票多.c.双方打平)
	 *
	 *4.将查出的每一个文章的id，和结果(支持多还是反对多，)找到应了的memberId,和点数
	 *5.将member的票数更新
	 * @return
	 */
	public void firstVoteFinishProcess(){
		List<SimpleArticle>  articleList = articleDAO.getAllFirstVoteFinishSimpleArticle();//1.找出所有一次投票、并已经到结束日期的文章
		log.info("artidle.size() --> " + articleList.size());
		if(articleList == null || articleList.size() == 0)
			return ;
		
		for(SimpleArticle article : articleList){
			if(article.getState() == 1){
				continue;
			}
			/**
			 * edit
			 */
			String Support = "UnSupport";
			String win = Support == null?"UnSupport":"Support";
			//获得胜利方的用户列表
			List<Vote> winList = dao.getVotesListByVoteCategory(article.getId(), win);
			String lose = Support == null?"Support":"UnSupport";
			//获得失败方的用户列表
			@SuppressWarnings("unused") List<Vote> loseList = dao.getVotesListByVoteCategory(article.getId(), lose);
			double winVoteCount = 0;
			for(Vote vote : winList){
				winVoteCount += vote.getVoteNumber();//计算胜利方共投票数
			}
			
//			double loseVoteCount = 0;
//			for(Vote vote : loseList){
//				loseVoteCount += vote.getVoteNumber();//计算失败方共投票数
//			}
//			
//			//奖励频道建立者
//			updateChannerOwnerPrivilege(winList.size() + loseList.size());
//			
//			if(loseVoteCount == winVoteCount){//双方打平，回退票数
//				log.info("双方打平，回退票数");
//				new ReturnThread(winList,loseList).start();
//				voteMsg = getText("info_vote_equal");
//				article = articleService.getById(articleId);
//				//结束文章投票
//				boolean end = articleService.endArticle(article.getId(), Support.equals("Support")?SimpleArticle.RESULTTYPE_SUPPORT : SimpleArticle.RESULTTYPE_UNSUPPORT);
//				if(end)
//					voteMsg = getText("info_operation_success");
//				else
//					voteMsg = getText("error_operation_error");
//				return ENDARTICLE;
//			}
//			double bonus = caculateVote(winVoteCount,loseVoteCount);//计算奖金
//			new RewardThread(winList,bonus).start();
//			
//			//结束文章状态
//			boolean end = dao.endArticle(article.getId(), Support.equals("Support")?SimpleArticle.RESULTTYPE_SUPPORT : SimpleArticle.RESULTTYPE_UNSUPPORT);
//			if(end)
//				voteMsg = getText("info_operation_success");
//			else
//				voteMsg = getText("error_operation_error");
		}


	}

	
	public void handleInterminateVoteProcess(){
		//查询三天前未被截止投票的文章
		List<SimpleArticle>  articleList = articleDAO.lookforShouldEndArticles(3);
		
		if(articleList != null && articleList.size() > 0){
			log.info("articleList size --> "+articleList.size());
			for(SimpleArticle art : articleList){
				if(art == null) continue;
				log.info("reactive article : "+art.getId());
				boolean success = articleDAO.reactiveArticle(art.getId());
				if(success)
					log.info("reactive article SUCCESS!!!!!!!!");
				else
					log.error("reactive article FAILED!!!!!!!!");
				
				//查询文章的投票记录
				List<Vote> vList = dao.getByArticleId(art.getId());
				
				if(vList != null && vList.size() > 0){
					log.info("vList size --> "+vList.size());
					for(Vote v : vList){
						if(v == null) continue;
						//获得投票用户
						Member vMember = memberDAO.get(v.getMemberId());
						if(vMember == null) continue;
						log.info("return privilege: "+v.getVoteNumber()+" to member: "+vMember.getId());
						//回退所投票数
						int result = memberDAO.updatePrivilege(vMember.getId(), vMember.getPrivilege() + v.getVoteNumber());
						if(result > 0)
							log.info("return privilege: "+v.getVoteNumber()+" to member: "+vMember.getId()+" is SUCCESS!!!");
						else
							log.error("return privilege: "+v.getVoteNumber()+" to member: "+vMember.getId()+" is FAILED!!!");
					}
				}else{
					log.info("article: "+art.getId()+" is never been voted........");
				}
			}
		}else{
			log.info("no unterminate articles......in this 3 days");
		}
		
	}
	
	

	/**
	 * 根据文章Id获得反对票总数
	 * @param id
	 * @return
	 */
	public int getUnSupportVoteCountByArticleId(int id) {
		return dao.getUnSupportVoteCountByArticleId(id);
	}

	/**
	 * 根据文章Id获得支持票总数
	 * @param id
	 * @return
	 */
	public int getSupportVoteCountByArticleId(int id) {
		return dao.getSupportVoteCountByArticleId(id);
	}

	public SimpleArticleDAO getArticleDAO() {
		return articleDAO;
	}

	public void setArticleDAO(SimpleArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	public ChannelDAO getChannelDAO() {
		return channelDAO;
	}

	public void setChannelDAO(ChannelDAO channelDAO) {
		this.channelDAO = channelDAO;
	}
	
	public static void main(String []a){

	}

	public boolean isAlreadyVoted(int memberId, int resourceId, String resourceType) {
		return dao.isExist(memberId, resourceId, resourceType);
	}
	
	/**
	 * 根据memberId获得所有投过票的文章
	 * @param memberId
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getArticlesByMemberId(int memberId,int page , int count){
		int start = (page - 1) * count;
		List<Integer> articleIdList = dao.getArticlesIdByMemberId(memberId, start, count);
		List<SimpleArticle> articleList = new ArrayList<SimpleArticle>();
		for(int id : articleIdList){
			articleList.add(articleDAO.getById(id));
		}
		return articleList;
	}
	/**
	 * 根据memberId获得所有投过票的文章总数
	 * @param memberId
	 * @return
	 */
	public int getArticlesCountByMemberId(int memberId){
		return dao.getArticlesCountByMemberId(memberId);
	}

	public int getAllCountByArticle(int articleId) {
		Object obj = dao.getAllCountByArticle(articleId);
		if(obj != null)
			return (Integer)obj;
		else
			return 0;
	}

	public int getArticleSupportVoteCount(int articleId) {
		Object obj = dao.getCountByVoteCategory(articleId, "Support");
		if(obj != null)
			return (Integer)obj;
		else
			return 0;
	}

	public int getArticleUnSupportVoteCount(int articleId) {
		Object obj = dao.getCountByVoteCategory(articleId, "UnSupport");
		if(obj != null)
			return (Integer)obj;
		else
			return 0;
	}

	public List<Vote> getByArticleId(int articleId) {
		return dao.getByArticleId(articleId);
	}

	public List<Vote> getVotesListByVoteCategory(int resourceId, String type) {
		return dao.getVotesListByVoteCategory(resourceId, type);
	}

	public List<Vote> getNewVote(int page, int count) {
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		
		return dao.getNewVote(start, count);
	}

	public void setSessionValDAO(SessionValDAO sessionValDAO) {
		this.sessionValDAO = sessionValDAO;
	}

	public int getVoteCount4Channel(int channelId) {
		return dao.getVoteCount4Channel(channelId);
	}

	public void vote4Channel(Vote vote) {
		dao.vote4Channel(vote);
	}
	
	
}
