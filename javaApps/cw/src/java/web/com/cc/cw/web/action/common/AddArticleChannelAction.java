package com.cc.cw.web.action.common;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Broadcast;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.BroadcastService;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.web.interceptor.MemberAware;
import com.cc.cw.web.util.Constants;
import com.opensymphony.webwork.ServletActionContext;

public class AddArticleChannelAction extends SessionActionSupport implements MemberAware{
	
	private static final long serialVersionUID = 1868231719577066014L;

	public int articleId;
	
	public static final String SHOW = "show";
	public static final String INFO = "info";
	
	public ChannelService cs;
	
	public List<Channel> myChannelList;
	
	public SimpleArticleService sas;
	private SimpleArticle article;
	
	public int chlId;
	
	public int pn;
	private String pagnation;
	private MemberService memberService;
	private BroadcastService broadcastService;
	public Member member;
	
	public String errorMsg;
	private String rate;
	private String toPage;//动态返回页面

	public String execute(){
		if(pn == 0){
			pn = 1;
		}
		myChannelList = cs.getByMemberId(pn,10,member.getId());
		int total = cs.getChannelCountByMemberId(member.getId(), 1);
		article = sas.getById(articleId);
		
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/addtochannel.action?articleId="+articleId+"&");
		pagnation = p.getPagination();
		return SHOW;
	}
	

	@SuppressWarnings("unchecked")
	public String add(){//TODO:发起投票
		Member member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		
		SimpleArticle sa = sas.getById(articleId);
		if(sa == null){
			this.addActionError(getText("error_article_null"));
			return ERROR;
		}
		if(sa.getChannelId() == 0){//文章未被收藏
			int rateInt = 0;
			if(ValidateUtil.isNumber(rate, false)){//验证天数是否为有效数字并转换
				rateInt = Integer.parseInt(rate);
			}else{
				errorMsg = getText("error_article_rate");
				session.put("errorMsg", errorMsg);
				return toPage;
			}
			sa.setFirstVoteCycle(rateInt);//设置第一次实际投票周期
			Date newDate = DateTimeUtil.incDate(new Date(),Calendar.DAY_OF_MONTH,rateInt);//从发起投票日开始延迟截止日期
			if(rateInt < sa.getRate())//如果指定的天数比文章价格少，则只扣除文章价格
				rateInt = sa.getRate();
			if(member.getPrivilege() < rateInt){//检查用户是否有足够的票数
				errorMsg = getText("error_vote_privilege");
				session.put("errorMsg", errorMsg);
				return toPage;
			}

			//扣除收藏文章所需的点数
			int tmp = member.getPrivilege()-rateInt;
			boolean success = memberService.updatePrivilege(member.getId(), tmp);
			member.setPrivilege(tmp);
			session.put("member", member);//更新session中的数据
			
			if(success){//扣除成功后增加作者的点数
				Member author = memberService.get(sa.getMemberId());
				if(author != null)
					success = memberService.updatePrivilege(author.getId(), author.getPrivilege()+sa.getRate());
			}
			if(success){//更新文章的频道id
				success = cs.addToChannel(sa.getId(), chlId);
				if(success){//全部成功后更新频道文章数量
					Channel myChl = cs.getById(chlId);
					myChl.setArticleNums(myChl.getArticleNums() + 1);
					sa.setEndDate(newDate);
					sa.setChannelId(chlId);
					sas.update(sa);//更新文章结束日期
					cs.update(myChl);
					errorMsg = "添加文章成功，您具有对文章投票结果的决定权，在管理页面进行文章管理";
					session.put("errorMsg", errorMsg);
					//新增一条关于用户对这个新闻发起投票的广播
					Broadcast broadcast = new Broadcast();
					broadcast.setArticleId(sa.getId());
					broadcast.setArticleTitle(sa.getTitle());
					broadcast.setFlag(Constants.BROADCAST_FLAGELSE);
					broadcast.setMemberId(member.getId());
					broadcast.setMemberName(member.getUserName());
					broadcast.setSort(Constants.BROADCAST_FVOTE);
					broadcastService.add(broadcast);
					
					return toPage;
				}
			}
			errorMsg = getText("error_operation_error");
			session.put("errorMsg", errorMsg);
			return toPage;
		}else{
			errorMsg = "添加失败，此文章已经被其他用户提前添加过了";
			session.put("errorMsg", errorMsg);
			return toPage;
		}
	}
	
	@SuppressWarnings("unchecked")
	public String reference(){//TODO：收录文章
		SimpleArticle sa = sas.getById(articleId);
		boolean flag = false;
		flag = cs.haveThisReference(articleId, member.getId());
		if(flag){
			errorMsg = "该文章已经收录到您的频道！";
			session.put("errorMsg", errorMsg);
			return toPage;
		}
		flag = cs.addReferenceToChannel(sa.getId(), chlId);
		if(flag){
			errorMsg = "添加文章成功";
			session.put("errorMsg", errorMsg);
			return toPage;
		}else{
			errorMsg = "添加失败";
			session.put("errorMsg", errorMsg);
			return toPage;
		}
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public static String getSHOW() {
		return SHOW;
	}

	public static String getINFO() {
		return INFO;
	}

	public ChannelService getCs() {
		return cs;
	}

	public void setCs(ChannelService cs) {
		this.cs = cs;
	}

	public List<Channel> getMyChannelList() {
		return myChannelList;
	}

	public void setMyChannelList(List<Channel> myChannelList) {
		this.myChannelList = myChannelList;
	}

	public SimpleArticleService getSas() {
		return sas;
	}

	public void setSas(SimpleArticleService sas) {
		this.sas = sas;
	}

	public int getChlId() {
		return chlId;
	}

	public void setChlId(int chlId) {
		this.chlId = chlId;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String msg) {
		this.errorMsg = msg;
	}

	public Member getMember() {
		return member;
	}

	public String getPagnation() {
		return pagnation;
	}

	public SimpleArticle getArticle() {
		return article;
	}
	
	public void setMember(Member member){
		this.member = member;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setRate(String rate) {
		this.rate = rate;
	}

	public void setNewList(String toPage) {
		this.toPage = toPage;
	}

	public void setToPage(String toPage) {
		this.toPage = toPage;
	}


	public void setBroadcastService(BroadcastService broadcastService) {
		this.broadcastService = broadcastService;
	}
}
