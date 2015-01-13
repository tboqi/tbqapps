package com.cc.cw.scheduling;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.Vote;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.VoteService;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.web.data.GlobalData;

public class SecVoteFinishJob extends QuartzJobBean {
	private VoteService voteService;
	private SimpleArticleService simpleArticleService;
	private MemberService memberService;
	private SessionValService sessionValService;
	private MessageService messageService;
	private GlobalData globalData;
	Log log = LogFactory.getLog(SecVoteFinishJob.class);
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		//更新全局数据
		globalData.updateDayTask();
		log.info("vote job start ... ");
		//2次投票判断
		this.secVoteFinishProcess();
		log.info("vote job first ... ");
		//1次投票判断
		this.firstVoteFinishProcess();
		log.info("vote job first end ... ");
//		voteService.handleInterminateVoteProcess();
		//simpleArticleService.autoInitiateVote(Constants.AUTOINITIATEVOTEDATE);
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
		List<SimpleArticle>  articleList = simpleArticleService.getAllFirstVoteFinishSimpleArticle();//1.找出所有一次投票、并已经到结束日期的文章
		log.info("articleList.size() --> " + articleList.size());
		if(articleList == null || articleList.size() == 0)
			return ;
		
		for(SimpleArticle article : articleList){
			if(article.getState() == 1){
				continue;
			}
			/**
			 * edit
			 */
			String win = null;
			String lose = null;
			int unsupportCount = article.getUnSupportCount();
			int supportCount = article.getSupportCount();
			double winVoteCount = 0;
			double loseVoteCount = 0;
			if(supportCount > unsupportCount){
				win = "Support";
				lose = "UnSupport";
				winVoteCount = supportCount;
				loseVoteCount = unsupportCount;
			}else if(supportCount < unsupportCount){
				win = "UnSupport";
				lose = "Support";
				winVoteCount = unsupportCount;
				loseVoteCount = supportCount;
			}else{
				win = "Support";
				lose = "UnSupport";
				winVoteCount = supportCount;
				loseVoteCount = unsupportCount;
			}
			//获得胜利方的用户列表
			List<Vote> winList = voteService.getVotesListByVoteCategory(article.getId(), win);
			
			//获得失败方的用户列表
			List<Vote> loseList = voteService.getVotesListByVoteCategory(article.getId(), lose);
			
			//双方打平，回退票数
			if(loseVoteCount == winVoteCount){
				log.info("双方打平，回退票数");
				new ReturnThread(winList,loseList).start();
				//结束文章投票
				article.setEndDate(DateTimeUtil.incDate(new Date(), Calendar.DAY_OF_MONTH, 30));
				article.setUnSupportCount(0);
				article.setSupportCount(0);
				simpleArticleService.update(article);
				continue;
			}else{
				//奖励频道建立者
				updateChannerOwnerPrivilege(winVoteCount + loseVoteCount,article.getMemberId());
			}
			
			double bonus = caculateVote(winVoteCount,loseVoteCount);//计算奖金
			log.info("bonus is" + bonus);
			new RewardThread(winList,bonus,article).start();
			
			//结束文章状态
			simpleArticleService.endArticle(article.getId(), win.equals("Support")?SimpleArticle.RESULTTYPE_SUPPORT : SimpleArticle.RESULTTYPE_UNSUPPORT, article.getSupportCount()+":"+article.getUnSupportCount());
//			if(end)
//				voteMsg = getText("info_operation_success");
//			else
//				voteMsg = getText("error_operation_error");
		}


	}
	/**
	 *处理所有已经评论过的文章
	 *1.首先找出所有一次投票、并已经到结束日期的文章
	 *2.更新这些文章的status = 3
	 *3.计算出最终结果(a.支持方票多,b.反对方票多.c.双方打平)
	 *
	 *4.将查出的每一个文章的id，和结果(支持多还是反对多，)找到应了的memberId,和点数
	 *5.将member的票数更新
	 * @return
	 */
	public void secVoteFinishProcess(){
		List<SimpleArticle>  articleList = simpleArticleService.getAllVoteFinishSimpleArticle();//1.找出所有一次投票、并已经到结束日期的文章
		log.info("articleList.size() --> " + articleList.size());
		if(articleList == null || articleList.size() == 0)
			return ;
		
		for(SimpleArticle article : articleList){
			if(article.getState() != 2){
				continue;
			}
			/**
			 * edit
			 */
			String win = null;
			String lose = null;
			int unsupportCount = article.getUnSupportCount();
			int supportCount = article.getSupportCount();
			double winVoteCount = 0;
			double loseVoteCount = 0;
			if(supportCount > unsupportCount){
				win = "Support";
				lose = "UnSupport";
				winVoteCount = supportCount;
				loseVoteCount = unsupportCount;
			}else if(supportCount < unsupportCount){
				win = "UnSupport";
				lose = "Support";
				winVoteCount = unsupportCount;
				loseVoteCount = supportCount;
			}else{
				win = "Support";
				lose = "UnSupport";
				winVoteCount = supportCount;
				loseVoteCount = unsupportCount;
			}
			//获得胜利方的用户列表
			List<Vote> winList = voteService.getVotesListByVoteCategory(article.getId(), win);
			
			//获得失败方的用户列表
			List<Vote> loseList = voteService.getVotesListByVoteCategory(article.getId(), lose);
			
			//双方打平，回退票数
			if(loseVoteCount == winVoteCount){
				log.info("双方打平，回退票数");
				new ReturnThread(winList,loseList).start();
				//结束文章投票
				article.setEndDate(DateTimeUtil.incDate(new Date(), Calendar.DAY_OF_MONTH, 30));
				article.setUnSupportCount(0);
				article.setSupportCount(0);
				simpleArticleService.update(article);
				continue;
			}else{
				//奖励频道建立者
				updateChannerOwnerPrivilege(winVoteCount + loseVoteCount,article.getMemberId());
			}
			
			double bonus = caculateVote(winVoteCount,loseVoteCount);//计算奖金
			log.info("bonus is" + bonus);
			new RewardThread(winList,bonus,article).start();
			
			//结束文章状态
			simpleArticleService.endSecondVote(article.getId(), win.equals("Support")?SimpleArticle.RESULTTYPE_SUPPORT : SimpleArticle.RESULTTYPE_UNSUPPORT);
//			if(end)
//				voteMsg = getText("info_operation_success");
//			else
//				voteMsg = getText("error_operation_error");
		}


	}

	private double caculateVote(double totalWin,double totalLose){
		double bonus;
		if(totalWin != 0){
			bonus = (totalWin + totalLose) / totalWin;
//			bonus = Double.parseDouble(new java.text.DecimalFormat("0.000").format(bonus));
		}
		else
			bonus = 0;
		return bonus;
	}
	
	class RewardThread extends Thread{//负责分配票数的线程
		List<Vote> winList;
		double bonus;
		SimpleArticle article;
		public RewardThread(List<Vote> winList,double bonus,SimpleArticle article){
			this.winList = winList;
			this.bonus = bonus;
			this.article = article;
		}
		public void run() {
			end(winList,bonus,article);//分配奖金
		}
	}
	
	class ReturnThread extends Thread{//负责回退票数的线程
		List<Vote> winList,loseList;
		
		public ReturnThread(List<Vote> winList,List<Vote> loseList){
			this.loseList = loseList;
			this.winList = winList;
		}
		public void run(){
			returnPrivilege(winList,loseList);//回退票数
		}
	}
	
	/**
	 * 结束投票，奖励优胜方
	 * @param winList 优胜方列表
	 * @param bonus 奖励点数
	 */
	private void end(List<Vote> winList,double bonus,SimpleArticle article){
		SessionVal sessionVal= null;
		Member winner = null;
		String uid = null;
		for(Vote vote : winList){
			uid = vote.getVoteMember();
			if(uid!=null && uid.length()==32){//处理非注册用户泛票
				sessionVal = sessionValService.getByHostId(uid);
				if(sessionVal == null) continue;
				int privilege = (int)bonus * vote.getVoteNumber();//与原有票数相加
				log.info("winner \""+sessionVal.getId()+"\" total bonus: "+privilege);
				sessionValService.incVotes(uid, privilege);
			}else if(uid!=null && !uid.trim().equals("")){//处理注册用户返票
				try{
					winner = memberService.get(Integer.parseInt(uid));
					if(winner == null) continue;
					double privilege = (bonus * vote.getVoteNumber()) + winner.getPrivilege() + ((double)winner.getPrivilegeDecimalValue() / 1000);//与原有票数相加
					double decimal = privilege - (int)privilege;//获得小数部分
					decimal = Double.parseDouble(new java.text.DecimalFormat("0.000").format(decimal));
					log.info("winner \""+winner.getId()+"\" get decimal: "+decimal);
					winner.setPrivilege((int)privilege);
					winner.setPrivilegeDecimalValue((int)(decimal*1000));
					memberService.update(winner);
					//给注册用户发分票短消息
					String str = "尊敬的用户您好，您在对<a href='/r/"+article.getId()+"'>"+article.getTitle()+"</a>一文的投票中取得了胜利，特将您所投票数与奖励票数，共计"+(int)bonus * vote.getVoteNumber()+"返回给您，小数部分我们将保留累计。";
					messageService.sendMessage(-1, winner.getId(), Message.MESSAGE_SYSTEM, "系统消息", str);
				}catch(Exception e){continue;}
			}
		}
	}
	
	/** 
	 * 回退用户的票数 
	 * @param winList 支持票列表
	 * @param loseList 反对票列表
	 */
	private void returnPrivilege(List<Vote> winList,List<Vote> loseList){
		for(Vote vote : winList){//回退投支持票的用户的票数
			returnVote(vote);
		}
		
		for(Vote vote : loseList){//回退投反对票的用户的票数
			returnVote(vote);
		}
	}
	//平局时给投票用户返票
	private void returnVote(Vote vote){
		SessionVal sessionVal= null;
		Member member = null;
		String uid = vote.getVoteMember();
		if(uid!=null && uid.length()==32){//处理非注册用户返票
			sessionVal = sessionValService.getByHostId(uid);
			if(sessionVal != null){
				sessionValService.incVotes(uid, vote.getVoteNumber());
			}
		}else if(uid!=null && !uid.trim().equals("")){//处理注册用户返票
			try{
				member = memberService.get(Integer.parseInt(uid));
				if(member != null){
					memberService.updatePrivilege(member.getId(), member.getPrivilege()+vote.getVoteNumber());
					String str = "尊敬的用户您好，由于您进行的投票文章平局，特将您所投票数返回。";
					//给注册用户发分票短消息
					messageService.sendMessage(-1, member.getId(), Message.MESSAGE_SYSTEM, "系统消息", str);
				}
			}catch(Exception e){log.info("returnVote ERROR");}
		}
	}
	/**
	 * 更新频道主的票数
	 * @param total - 总共参与投票的票数
	 */
	@SuppressWarnings("unchecked")
	private void updateChannerOwnerPrivilege(double total,int memberId){
		double privilege = total * 0.05;
		Member member = memberService.get(memberId);
		if(member != null){
			privilege += member.getPrivilege() + (member.getPrivilegeDecimalValue() / 1000d); 
			log.info("update channer's privilege --> "+privilege);
			member.setPrivilege((int)privilege);
			double decimal = privilege - (int)privilege;
			member.setPrivilegeDecimalValue((int)(Double.parseDouble(new java.text.DecimalFormat("0.000").format(decimal)) * 1000));
			memberService.update(member);
		}
	}

	public void setVoteService(VoteService voteService) {
		this.voteService = voteService;
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}
	
	public void setSessionValService(SessionValService sessionValService) {
		this.sessionValService = sessionValService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
}
