package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.interceptor.MemberAware;
import com.opensymphony.webwork.ServletActionContext;

/**
 * 我的频道
 * @author dzh
 * 下午06:06:16
 */
public class MyChannelAction extends SessionActionSupport implements MemberAware {

	private static final long serialVersionUID = -6902117588614206465L;

	private Member member;
	private ChannelService cs;
	private MemberService ms;
	private SimpleArticleService sas;
	private int pn;
	private String pagination;
	
	//###########################userleft相关
	private Member viewMember;
	private MemberService memberService;
	private int memberId;
    //###########################################用户好友相关
	private List<Member> friendList;
	private List<Member> newfriendList;
	
	private List<Map<String,Object>> channelArticleList;
	/** 用户所有频道，用于发起投票时选择 */
	private List<Channel> channelList;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		if(pn == 0)
			pn = 1;
		member =(Member) session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}else{
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			channelList = cs.getByMemberId(1, count, member.getId());
		}
		int pagerow = 4;
		List<Channel> myChannels = cs.getByMemberId(pn, pagerow, member.getId());
		Pagination pg = new Pagination();
		pg.setCurrentPage(pn);
		pg.setRowsCount(cs.getChannelCountByMemberId(member.getId(), 1));
		pg.setRowsPerPage(pagerow);
		HttpServletRequest request = ServletActionContext.getRequest();
		pg.setUrl(request.getContextPath() + "/user/mychannels.action?");
		pagination = pg.getPagination();
		if(myChannels!=null && myChannels.size() > 0){
			channelArticleList = new ArrayList<Map<String,Object>>();
			for(Channel channel : myChannels){
				List<SimpleArticle> artList = sas.getArticlesByChannelId(channel.getId(), 1, 5);
				List memberArticleList = new ArrayList();
				for(SimpleArticle sa : artList){
					Member m = ms.get(sa.getMemberId());
					Map memberArticleMap = new HashMap();
					memberArticleMap.put("article",sa);
					memberArticleMap.put("member",m);
					memberArticleList.add(memberArticleMap);
				}
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("channel", channel);
				map.put("memberArticleList", memberArticleList);
				channelArticleList.add(map);
			}
		}
		initleft();
		return SUCCESS;
		
	}
	private void initleft(){
		//获得被访用户的信息
		viewMember = memberService.get(member.getId());
		memberId = member.getId();
		//获取被访用户的随机好友
		friendList = memberService.getByFriendId(memberId, 1, 4);
		//获取被访用户的最新好友
		newfriendList = memberService.getByNewFriendId(memberId, 1, 4);
		//获取被访用户的最新访客
	}
	public void setMember(Member member) {
		this.member = member;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public List<Map<String, Object>> getChannelArticleList() {
		return channelArticleList;
	}

	public void setCs(ChannelService cs) {
		this.cs = cs;
	}

	public void setSas(SimpleArticleService sas) {
		this.sas = sas;
	}

	public String getPagination() {
		return pagination;
	}

	public void setPagination(String pagination) {
		this.pagination = pagination;
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
	public int getMemberId() {
		return memberId;
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
