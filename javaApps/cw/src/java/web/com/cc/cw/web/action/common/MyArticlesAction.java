package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.interceptor.MemberAware;
import com.opensymphony.webwork.ServletActionContext;

public class MyArticlesAction extends SessionActionSupport implements MemberAware{

	private static final long serialVersionUID = 2790728203617861340L;
	
	private Member member;
	
	private List<Map> myCollectionArticles;
	
	private List<Map> myPublishArticles;
	
	private List<Map> myVoteArticles;
	private int pn;
	private String pagination;
	private SimpleArticleService sa;
	private MemberService ms;
	private int memberId;

	/** 用户所有频道，用于发起投票时选择 */
	private List<Channel> channelList;
	private ChannelService cs;

	

	@SuppressWarnings("unchecked")
	public String myCollectionArticles(){
		
		if(pn == 0){
			pn = 1;
		}
		member = (Member) session.get("member");
		String url = "";
		if(memberId == 0 && member != null){
			memberId = member.getId();
			url = "/user/mycollectionarticles.action?";
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			channelList = cs.getByMemberId(1, count, member.getId());
		}
		else{
			url = "/user/mycollectionarticles.action?memberId="+memberId+"&";
		}
		myCollectionArticles = new ArrayList();
		Pagination pg = new Pagination();
		pg.setCurrentPage(pn);
		pg.setRowsCount(sa.getAllMyCollectedArticlesCount(memberId));
		pg.setRowsPerPage(10);
		pg.setUrl(ServletActionContext.getRequest().getContextPath() + url);
		pagination = pg.getPagination();
		List<SimpleArticle> list = sa.getAllMyCollectedArticles(memberId, pn, 10);
		for(SimpleArticle a : list){
			Map map = new HashMap();
			map.put("article", a);
			map.put("author", ms.get(a.getMemberId()));
			myCollectionArticles.add(map);
		}
		
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String myPublishArticles(){
		if(pn == 0){
			pn = 1;
		}
		member = (Member) session.get("member");
		String url = "";
		if(memberId == 0 && member != null){
			memberId = member.getId();
			url = "/user/mypublisharticles.action?";
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			channelList = cs.getByMemberId(1, count, member.getId());
		}
		else{
			url = "/user/mypublisharticles.action?memberId="+memberId+"&";
		}
		myPublishArticles = new ArrayList();
		Pagination pg = new Pagination();
		pg.setCurrentPage(pn);
		pg.setRowsCount(sa.getArticlesCountByMemberId(memberId));
		pg.setRowsPerPage(10);
		pg.setUrl(ServletActionContext.getRequest().getContextPath() + url);
		pagination = pg.getPagination();
		List<SimpleArticle> list = sa.getArticlesByMemberId(memberId, pn, 10);
		log.info("size() -->" + list.size());
		for(SimpleArticle a : list){
			Map map = new HashMap();
			map.put("article",a);
			map.put("author", ms.get(a.getMemberId()));
			myPublishArticles.add(map);
		}
		return SUCCESS;
	}
	

	private Date currentDate;
	

	@SuppressWarnings("unchecked")
	public String myVoteArticles(){
		Calendar c = Calendar.getInstance();
		GregorianCalendar g = new GregorianCalendar(c.get(Calendar.YEAR),c.get(Calendar.MONTH),c.get(Calendar.DATE)+1);
		currentDate = g.getTime();
		
		if(pn == 0){
			pn = 1;
		}
		member = (Member) session.get("member");
		String url = "";
		if(memberId == 0 && member != null){
			memberId = member.getId();
			url = "/user/myvotearticles.action?";
		}
		else{
			url = "/user/myvotearticles.action?memberId="+memberId+"&";
		}
		
		myVoteArticles = new ArrayList();
		Pagination pg = new Pagination();
		pg.setCurrentPage(pn);
		pg.setRowsCount(sa.getAllMyVoteArticlesCount(memberId));
		pg.setRowsPerPage(10);
		pg.setUrl(ServletActionContext.getRequest().getContextPath() + url);
		pagination = pg.getPagination();
		List<SimpleArticle> list = sa.getAllMyVoteArticles(memberId, pn, 10);
		for(SimpleArticle a : list){
			Map map = new HashMap();
			map.put("article",a);
			map.put("author", ms.get(a.getMemberId()));
			myVoteArticles.add(map);
		}
		return SUCCESS;
	}
	
	/*get set*/
	
	public void setMember(Member member) {
		this.member = member;
	}

	public List<Map> getMyCollectionArticles() {
		return myCollectionArticles;
	}

	public List<Map> getMyPublishArticles() {
		return myPublishArticles;
	}

	public List<Map> getMyVoteArticles() {
		return myVoteArticles;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getPagination() {
		return pagination;
	}

	public void setSa(SimpleArticleService sa) {
		this.sa = sa;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}
	
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public Date getCurrentDate() {
		return currentDate;
	}
	public List<Channel> getChannelList() {
		return channelList;
	}

	public void setCs(ChannelService cs) {
		this.cs = cs;
	}
}
