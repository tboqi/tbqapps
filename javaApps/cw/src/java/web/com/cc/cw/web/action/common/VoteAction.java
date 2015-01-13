package com.cc.cw.web.action.common;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.domain.Broadcast;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.Vote;
import com.cc.cw.service.BroadcastService;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.VoteService;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.web.interceptor.MemberAware;
import com.cc.cw.web.util.Constants;
import com.opensymphony.webwork.ServletActionContext;

public class VoteAction extends SessionActionSupport implements MemberAware {

	private static final long serialVersionUID = 8596188768742784835L;

	/** 文章投票页面 */
	public static final String ARTICLEVOTE = "articleVote";

	public static final String ENDARTICLE = "end";

	// ###########################################用户相关
	private Member member;

	private MemberService memberService;

	// ###########################################文章相关
	private SimpleArticleService articleService;

	private SimpleArticle article;

	// ###########################################标签相关
	private LabelService labelService;

	private List<String> allLabels;

	// ###########################################投票相关
	private VoteService voteService;

	private Vote vote;

	private String voteCategory;

	private int articleId;

	private String Support;

	// ###########################################广播相关
	private BroadcastService broadcastService;

	// ###########################################页面参数
	@SuppressWarnings("unused")
	private String submit;

	/** 频道或文章的ID */
	private int resourceId;

	/** 资源类型：Channel || Article */
	private String resourceType;

	/** 投票结果：1：成功 | 2：票数不够，投票失败 | 3：重复投票 */
	private int result;

	/** 投票结果提示信息 */
	private String voteMsg;

	private String msg;

	/**
	 * action 默认方法：<br>
	 * 1、根据文章id查询资源； 2、转向投票页面
	 * 
	 * @return articleVote：文章投票页面
	 */
	public String execute() {

		// 根据资源ID(resourceId)查询具体文章
		article = articleService.getById(resourceId);
		if (article == null) {
			addActionError("此文章不存在！");
			return ERROR;
		}
		// 根据文章ID查询所有标签
		allLabels = labelService.getContentByArticleId(article.getId());
		return SUCCESS;
	}

	private int channelId;

	private int channelVoteCount;
	
	private int youVoteCount;
	
	private ChannelService channelService;

	public String vote4Channel() {
		Channel channel = channelService.getById(channelId);
		String result = INPUT;
		vote = new Vote();
		HttpSession session = ServletActionContext.getRequest().getSession();
		member = (Member) session.getAttribute("member");
		Object o = session.getAttribute("sessionVal");
		String bindflag = (String) session.getAttribute("bindflag");
		vote.setResourceId(channelId);
		vote.setResourceType("Channel");
		if (member == null) {
			if (bindflag.equals("yes")) {
				msg = "该机器已绑定用户，请登录后再进行投票";
			} else {
				SessionVal sval = (SessionVal) o;
				if (sval.getPrivilege() < 1) {
					msg = "票数不足";
				} else {
				vote.setVoteMember(sval.getHostId());
				vote.setMemberId(1000000);
				voteService.vote4Channel(vote);
				msg = SUCCESS;
//				msg = "您为频道“"+channel.getName()+"”投了1票";
				result = SUCCESS;
				}
			}
		} else {
			if (channelService != null) {
				if(member.getPrivilege() < 1){
					msg = "票数不足";
				} else {
					vote.setMemberId(member.getId());
					vote.setVoteMember(member.getId() + "");
					voteService.vote4Channel(vote);
	//				msg = "您为频道“"+channel.getName()+"”投了1票";
					msg = SUCCESS;
					result = SUCCESS;
				}
			} else {
				msg = "频道不存在";
			}
		}
		if(StringUtils.equals(result, SUCCESS)){
			if (member != null) {
				member.setPrivilege(member.getPrivilege()-1);
				youVoteCount = member.getPrivilege();
			} else {
				SessionVal s = (SessionVal) o;
				s.setPrivilege(s.getPrivilege() - 1);
				youVoteCount = s.getPrivilege();
			}
			channelVoteCount = voteService.getVoteCount4Channel(channelId);
			memberService.update(member);
		}
		
		return SUCCESS;
	}

	/**
	 * 投票方法
	 * 
	 * @return 执行execute方法后返回articleVote：文章投票页面
	 */
	public String voteForArticle() {
		String INPUT = "msg";
		HttpSession session = ServletActionContext.getRequest().getSession();
		article = articleService.getById(articleId);
		member = (Member) session.getAttribute("member");
		Object o = session.getAttribute("sessionVal");
		String bindflag = (String) session.getAttribute("bindflag");
		// 判断是否超过投票截止日期
		Calendar c = Calendar.getInstance();
		GregorianCalendar g = new GregorianCalendar(c.get(Calendar.YEAR), c
				.get(Calendar.MONTH), c.get(Calendar.DATE) + 1);
		long curTime = g.getTimeInMillis();// 获得今天日期的毫秒数

		c.setTime(article.getEndDate());
		g = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH),
				c.get(Calendar.DATE) + 1);
		long endTime = g.getTimeInMillis();// 获得文章截止日期的毫秒数
		if (curTime > endTime) {
			voteMsg = getText("error_vote_end");
			msg = getText("error_vote_end");
			return INPUT;
		}
		vote = new Vote();
		if (member == null) {
			if (bindflag.equals("yes")) {
				msg = "该机器已绑定用户，请登录后再进行投票";
				return INPUT;
			} else {
				SessionVal sval = (SessionVal) o;
				if (sval.getPrivilege() < 1) {
					msg = "票数不足";
					return INPUT;
				}
				vote.setVoteMember(sval.getHostId());
				vote.setMemberId(1000000);
			}
		} else {
			if (article != null) {
				// int mid = article.getMemberId();
				// //判断是否自己给自己投票
				// if(mid == member.getId()){
				// voteMsg = getText("error_vote_self");
				// msg = getText("error_vote_self");
				// return INPUT;
				// }

				// 如果频道ID小于等于零，说明已经未被收藏到频道，不可以投票
				if (article.getChannelId() == 0) {
					voteMsg = getText("info_vote_article_new");
					msg = getText("info_vote_article_new");
					return INPUT;
				}
				vote.setMemberId(member.getId());
				vote.setVoteMember(member.getId() + "");
			} else {
				msg = "文章不存在";
			}
		}

		vote.setVoteDate(new java.util.Date());
		vote.setResourceType("Article");
		vote.setResourceId(articleId);
		vote.setVoteCategory(voteCategory);
		vote.setVoteNumber(1);
		result = voteService.voteArticle(vote);
		if (result == 1) {
			voteMsg = getText("info_vote_success");
			if (vote.getVoteCategory().equals("Support")) {
				msg = "1";
			} else {
				msg = "2";
			}
		} else if (result == 0) {
			voteMsg = getText("error_vote_privilege");
			msg = getText("error_vote_privilege");
			return INPUT;
		}
		if (member != null) {
			member.setPrivilege(member.getPrivilege() - 1);
		} else {
			SessionVal s = (SessionVal) o;
			s.setPrivilege(s.getPrivilege() - 1);
		}
		return INPUT;
	}

	/**
	 * 投票方法
	 * 
	 * @return 执行execute方法后返回articleVote：文章投票页面
	 */
	@SuppressWarnings("unchecked")
	public String vote() {// TODO:投票
		article = articleService.getById(articleId);
		member = (Member) session.get("member");
		if (member == null) {
			voteMsg = getText("error_member_null");
			return INPUT;
		}

		if (article != null) {
			int mid = article.getMemberId();
			// 判断是否自己给自己投票
			if (mid == member.getId()) {
				voteMsg = getText("error_vote_self");
				return INPUT;
			}
			// 判断是否超过投票截止日期
			Calendar c = Calendar.getInstance();
			GregorianCalendar g = new GregorianCalendar(c.get(Calendar.YEAR), c
					.get(Calendar.MONTH), c.get(Calendar.DATE) + 1);
			long curTime = g.getTimeInMillis();// 获得今天日期的毫秒数

			c.setTime(article.getEndDate());
			g = new GregorianCalendar(c.get(Calendar.YEAR), c
					.get(Calendar.MONTH), c.get(Calendar.DATE) + 1);
			long endTime = g.getTimeInMillis();// 获得文章截止日期的毫秒数
			if (curTime > endTime) {
				voteMsg = getText("error_vote_end");
				return INPUT;
			}

			// 如果频道ID小于等于零，说明已经未被收藏到频道，不可以投票
			if (article.getChannelId() <= 0) {
				voteMsg = getText("info_vote_article_new");
				return INPUT;
			}
		}

		vote.setVoteDate(new java.util.Date());
		vote.setMemberId(member.getId());
		vote.setResourceType(resourceType);
		vote.setResourceId(articleId);
		vote.setVoteCategory(voteCategory);
		result = voteService.vote(vote);
		if (result == 1) {
			voteMsg = getText("info_vote_success");
			member.setPrivilege(member.getPrivilege() - vote.getVoteNumber());
			session.put("member", member);
		} else if (result == 2) {
			voteMsg = getText("error_vote_privilege");
		} else if (result == 3) {
			voteMsg = getText("info_vote_voted");
		} else {
			voteMsg = getText("error_vote_failed");
		}
		return INPUT;
	}

	public String endVote() {
		article = articleService.getById(articleId);
		if (article.getState() == 1) {
			voteMsg = getText("error_vote_end");

			return ENDARTICLE;
		}
		String win = Support == null ? "UnSupport" : "Support";
		// 获得胜利方的用户列表
		List<Vote> winList = voteService.getVotesListByVoteCategory(articleId,
				win);
		String lose = Support == null ? "Support" : "UnSupport";
		// 获得失败方的用户列表
		List<Vote> loseList = voteService.getVotesListByVoteCategory(articleId,
				lose);
		double winVoteCount = 0;
		for (Vote vote : winList) {
			winVoteCount += vote.getVoteNumber();// 计算胜利方共投票数
		}

		double loseVoteCount = 0;
		for (Vote vote : loseList) {
			loseVoteCount += vote.getVoteNumber();// 计算失败方共投票数
		}

		// 奖励频道建立者
		updateChannerOwnerPrivilege(winList.size() + loseList.size());

		if (loseVoteCount == winVoteCount) {// 双方打平，回退票数
			log.info("双方打平，回退票数");
			new ReturnThread(winList, loseList).start();
			voteMsg = getText("info_vote_equal");
			article = articleService.getById(articleId);
			// 结束文章投票
			boolean end = articleService.endArticle(article.getId(), Support
					.equals("Support") ? SimpleArticle.RESULTTYPE_SUPPORT
					: SimpleArticle.RESULTTYPE_UNSUPPORT, article
					.getSupportCount()
					+ ":" + article.getUnSupportCount());
			if (end)
				voteMsg = getText("info_operation_success");
			else
				voteMsg = getText("error_operation_error");
			return ENDARTICLE;
		}
		double bonus = caculateVote(winVoteCount, loseVoteCount);// 计算奖金
		new RewardThread(winList, bonus).start();

		// 结束文章状态
		boolean end = articleService.endArticle(article.getId(), Support
				.equals("Support") ? SimpleArticle.RESULTTYPE_SUPPORT
				: SimpleArticle.RESULTTYPE_UNSUPPORT, article.getSupportCount()
				+ ":" + article.getUnSupportCount());
		if (end)
			voteMsg = getText("info_operation_success");
		else
			voteMsg = getText("error_operation_error");
		return ENDARTICLE;
	}

	private double caculateVote(double totalWin, double totalLose) {
		double bonus;
		if (totalWin != 0) {
			bonus = (totalWin + totalLose) / totalWin;
			// bonus = Double.parseDouble(new
			// java.text.DecimalFormat("0.000").format(bonus));
		} else
			bonus = 0;
		return bonus;
	}

	class RewardThread extends Thread {// 负责分配票数的线程
		List<Vote> winList;

		double bonus;

		public RewardThread(List<Vote> winList, double bonus) {
			this.winList = winList;
			this.bonus = bonus;
		}

		public void run() {
			end(winList, bonus);// 分配奖金
		}
	}

	class ReturnThread extends Thread {// 负责回退票数的线程
		List<Vote> winList, loseList;

		public ReturnThread(List<Vote> winList, List<Vote> loseList) {
			this.loseList = loseList;
			this.winList = winList;
		}

		public void run() {
			returnPrivilege(winList, loseList);// 回退票数
		}
	}

	/**
	 * 结束投票，奖励优胜方
	 * 
	 * @param winList
	 *            优胜方列表
	 * @param bonus
	 *            奖励点数
	 */
	private void end(List<Vote> winList, double bonus) {
		for (Vote vote : winList) {
			Member winner = memberService.get(vote.getMemberId());

			if (winner == null)
				continue;
			double privilege = (bonus * vote.getVoteNumber())
					+ winner.getPrivilege()
					+ ((double) winner.getPrivilegeDecimalValue() / 1000);// 与原有票数相加
			double decimal = privilege - (int) privilege;// 获得小数部分
			decimal = Double.parseDouble(new java.text.DecimalFormat("0.000")
					.format(decimal));
			log.info("winner \"" + winner.getId() + "\" get bonus: " + decimal);
			winner.setPrivilege((int) privilege);
			winner.setPrivilegeDecimalValue((int) (decimal * 1000));
			memberService.update(winner);

		}
	}

	/**
	 * 回退用户的票数
	 * 
	 * @param winList
	 *            支持票列表
	 * @param loseList
	 *            反对票列表
	 */
	private void returnPrivilege(List<Vote> winList, List<Vote> loseList) {
		for (Vote vote : winList) {// 回退投支持票的用户的票数
			Member winner = memberService.get(vote.getMemberId());
			int privilege = winner.getPrivilege() + vote.getVoteNumber();
			memberService.updatePrivilege(winner.getId(), privilege);
		}

		for (Vote vote : loseList) {// 回退投反对票的用户的票数
			Member winner = memberService.get(vote.getMemberId());
			int privilege = winner.getPrivilege() + vote.getVoteNumber();
			memberService.updatePrivilege(winner.getId(), privilege);
		}
	}

	/**
	 * 更新频道主的票数
	 * 
	 * @param total -
	 *            总共参与投票的人数
	 */
	@SuppressWarnings("unchecked")
	private void updateChannerOwnerPrivilege(double total) {
		double privilege = total * 0.1;
		member = (Member) session.get("member");
		if (member != null) {
			privilege += member.getPrivilege()
					+ (member.getPrivilegeDecimalValue() / 1000);
			log.info("update channer's privilege --> " + privilege);
			member.setPrivilege((int) privilege);
			double decimal = privilege - (int) privilege;
			member.setPrivilegeDecimalValue((int) (Double
					.parseDouble(new java.text.DecimalFormat("0.000")
							.format(decimal)) * 1000));
			memberService.update(member);
			session.put("member", member);// 更新session
		}
	}

	private int secDate;

	@SuppressWarnings("unchecked")
	public String secondVote() {// TODO:二次投票
		member = (Member) session.get("member");
		if (member == null) {
			voteMsg = getText("error_member_null");
			return INPUT;
		}
		boolean canVote = false;
		if (member.getPrivilege() > secDate * 5)
			canVote = true;
		if (canVote) {
			// 更新开始二次投票者的票数
			memberService.updatePrivilege(member.getId(), member.getPrivilege()
					- secDate * 5);
			article = articleService.getById(articleId);
			Date endDate = DateTimeUtil.incDate(new Date(),
					Calendar.DAY_OF_MONTH, secDate);
			boolean suc = articleService.beginSecondVote(articleId, member
					.getId(), endDate);
			if (suc) {
				member.setPrivilege(member.getPrivilege() - secDate * 5);
				session.put("member", member);
				voteMsg = getText("info_operation_success");
				// 新增一条关于用户对这个新闻发起二次投票的广播
				Broadcast broadcast = new Broadcast();
				broadcast.setArticleId(article.getId());
				broadcast.setArticleTitle(article.getTitle());
				broadcast.setFlag(Constants.BROADCAST_FLAGELSE);
				broadcast.setMemberId(member.getId());
				broadcast.setMemberName(member.getUserName());
				broadcast.setSort(Constants.BROADCAST_SVOTE);
				broadcastService.add(broadcast);
				return INPUT;
			} else {
				voteMsg = getText("error_operation_error");
				return INPUT;
			}
		} else {
			voteMsg = getText("error_vote_privilege");
			return INPUT;
		}
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}

	public void setVoteService(VoteService voteService) {
		this.voteService = voteService;
	}

	public void setLabelService(LabelService labelService) {
		this.labelService = labelService;
	}

	public int getResourceId() {
		return resourceId;
	}

	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public SimpleArticle getArticle() {
		return article;
	}

	public List<String> getAllLabels() {
		return allLabels;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public void setVoteCategory(String voteCategory) {
		this.voteCategory = voteCategory;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public int getArticleId() {
		return articleId;
	}

	public String getVoteMsg() {
		return voteMsg;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public void setSupport(String support) {
		Support = support;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setSecDate(int secDate) {
		this.secDate = secDate;
	}

	public void setBroadcastService(BroadcastService broadcastService) {
		this.broadcastService = broadcastService;
	}

	public String getMsg() {
		return msg;
	}

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public int getChannelVoteCount() {
		return channelVoteCount;
	}

	public void setChannelVoteCount(int channelVoteCount) {
		this.channelVoteCount = channelVoteCount;
	}

	public ChannelService getChannelService() {
		return channelService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public Vote getVote() {
		return vote;
	}

	public int getYouVoteCount() {
		return youVoteCount;
	}

	public void setYouVoteCount(int youVoteCount) {
		this.youVoteCount = youVoteCount;
	}

}
