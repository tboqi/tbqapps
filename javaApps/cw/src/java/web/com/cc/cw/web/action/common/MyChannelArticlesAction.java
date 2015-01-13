package com.cc.cw.web.action.common;

import java.util.ArrayList;
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
import com.opensymphony.webwork.ServletActionContext;

public class MyChannelArticlesAction extends SessionActionSupport {

	private static final long serialVersionUID = -671831371883492079L;

	private ChannelService cs;
	private SimpleArticleService sas;
	private MemberService ms;
	private Member member;
//	private int memberId;
	private int channelId;

	private Channel channel;
	private List<Map> articleListMap;
	private int pn;
	private String pagination;
	/** 用户所有频道，用于发起投票时选择 */
	private List<Channel> channelList;
	
	//###########################userleft相关
	private Member viewMember;
	private MemberService memberService;
	private int memberId;
    //###########################################用户好友相关
	private List<Member> friendList;
	private List<Member> newfriendList;

	@SuppressWarnings("unchecked")
	public String execute(){
		if(pn == 0){
			pn = 1;
		}
		member = (Member)session.get("member");
		if(member != null){
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			channelList = cs.getByMemberId(1, count, member.getId());
		}
		channel = cs.getById(channelId);
		memberId = channel.getMemberId();
		articleListMap = new ArrayList();
		List<SimpleArticle> articleList = sas.getArticlesByChannelId(channelId, pn, 10);
		for(SimpleArticle a : articleList){
			Map map = new HashMap();
			map.put("article",a);
			map.put("author",ms.get(a.getMemberId()));
			articleListMap.add(map);
		}
		String url = "/user/mychannelarticles.action?channelId="+channelId+"&pn="+pn;
		Pagination pg = new Pagination();
		pg.setCurrentPage(pn);
		pg.setRowsCount(sas.getArticlesCountByChannelId(channelId));
		pg.setRowsPerPage(10);
		pg.setUrl(ServletActionContext.getRequest().getContextPath() + url);
		pagination = pg.getPagination();
		initleft();
		return SUCCESS;
	}
	private void initleft(){
		//获得被访用户的信息
		viewMember = memberService.get(memberId);
		//获取被访用户的随机好友
		friendList = memberService.getByFriendId(memberId, 1, 4);
		//获取被访用户的最新好友
		newfriendList = memberService.getByNewFriendId(memberId, 1, 4);
		//获取被访用户的最新访客
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

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}


	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public void setCs(ChannelService cs) {
		this.cs = cs;
	}

	public void setSas(SimpleArticleService sas) {
		this.sas = sas;
	}

	public List<Map> getArticleListMap() {
		return articleListMap;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}
	public List<Channel> getChannelList() {
		return channelList;
	}

	public List<Member> getFriendList() {
		return friendList;
	}

	public List<Member> getNewfriendList() {
		return newfriendList;
	}

	public Member getViewMember() {
		return viewMember;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

}
