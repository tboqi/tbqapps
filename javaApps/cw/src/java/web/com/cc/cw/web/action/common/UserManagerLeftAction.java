package com.cc.cw.web.action.common;

import java.util.List;

import com.cc.cw.domain.Member;
import com.cc.cw.service.MemberService;
import com.cc.cw.web.interceptor.MemberAware;

public class UserManagerLeftAction extends SessionActionSupport implements MemberAware{

	private static final long serialVersionUID = 2424773822299089014L;

	private Member member;
	
	//###########################userleft相关
	private Member viewMember;
	private MemberService memberService;
	private int memberId;
    //###########################################用户好友相关
	private List<Member> friendList;
	private List<Member> newfriendList;
	
	@Override
	public String execute() throws Exception {
		//获得被访用户的信息
		viewMember = memberService.get(member.getId());
		memberId = member.getId();
		//获取被访用户的随机好友
		friendList = memberService.getByFriendId(memberId, 1, 4);
		//获取被访用户的最新好友
		newfriendList = memberService.getByNewFriendId(memberId, 1, 4);
		//获取被访用户的最新访客
		return INPUT;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}

	public Member getMember() {
		return member;
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
