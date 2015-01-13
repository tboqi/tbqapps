package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Friend;
import com.cc.cw.domain.Member;
import com.cc.cw.exception.ServiceException;
import com.cc.cw.service.FriendService;
import com.cc.cw.service.MemberService;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.interceptor.MemberAware;
import com.opensymphony.webwork.ServletActionContext;

/**
 * 好友action
 * @author dzh
 * 下午12:44:20
 */
public class MyFriendAction extends SessionActionSupport implements MemberAware{

	private static final long serialVersionUID = -7098776158209066233L;
	
	private Member member;
	private int pn;
	private String myFriendsPagination;
	private String myValidateFriendsPagination;
	private String myBlackListPagination;
	
	private FriendService fs;
	private MemberService ms;
	
	//###########################userleft相关
	private Member viewMember;
	private MemberService memberService;
	private int memberId;
    //###########################################用户好友相关
	private List<Member> friendList;
	private List<Member> newfriendList;
	
	//好友
	private List<Map> myFriends;
	//待验证好友
	private List<Map> myValidateFriends;
	//黑名单
	private List<Map> myBlackList;
	
	private Map friendCount;

	private String msg;
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * 我的好友
	 * @return
	 * @throws ServiceException
	 */
	public String execute() throws ServiceException{
		if(pn == 0)
			pn = 1;
		try {
			init(pn,1,1);
			initleft();
		} catch (Exception e) {
			log.error("friend error");
			e.printStackTrace();
		}
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
	public String getValidateFriends(){
		if(pn == 0)
			pn = 1;
		try {
			init(1,pn,1);
		} catch (Exception e) {
			log.error("friend error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getBlackList(){
		if(pn == 0)
			pn = 1;
		try {
			init(1,1,pn);
		} catch (Exception e) {
			log.error("friend error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void init(int fPage,int vPage,int bPage) throws Exception{
		List<Friend> fList = fs.getGivenStateFriends(member.getId(),Friend.STATE_FRIEND, fPage, 5);
		myFriends = new ArrayList<Map>();
		for(Friend f : fList){
			Map map = new HashMap();
			map.put("member", ms.get(f.getFriendId()));
			map.put("createDate",String.format("%1$tY-%1$tm-%1$td",  f.getCreateDate()));
			map.put("friend",f);
			myFriends.add(map);
		}
		int fCount = fs.getGivenStateFriendsCount(member.getId(), Friend.STATE_FRIEND);
		Pagination pg = new Pagination();
		pg.setCurrentPage(fPage);
		pg.setRowsCount(fCount);
		pg.setRowsPerPage(5);
		HttpServletRequest request = ServletActionContext.getRequest();
		pg.setUrl(request.getContextPath() + "/user/myfriends.action?");
		myFriendsPagination = pg.getPagination();
		
		//初始化待验证好友列表
		List<Friend> vList = fs.getGivenStateFriends(member.getId(), Friend.STATE_APPLYING, vPage, 5);
		myValidateFriends = new ArrayList<Map>();
		for(Friend f : vList){
			Map map = new HashMap();
			map.put("member", ms.get(f.getFriendId()));
			map.put("createDate",String.format("%1$tY-%1$tm-%1$td",  f.getCreateDate()));
			map.put("friend",f);
			myValidateFriends.add(map);
		}
		int vCount = fs.getGivenStateFriendsCount(member.getId(), Friend.STATE_APPLYING);
		pg = new Pagination();
		pg.setCurrentPage(vPage);
		pg.setRowsPerPage(5);
		pg.setRowsCount(vCount);
		pg.setUrl(request.getContextPath() + "/user/myvalidatefriends.action?");
		myValidateFriendsPagination = pg.getPagination();
		
		//初始化黑名单
		
		List<Friend> bList = fs.getGivenStateFriends(member.getId(), Friend.STATE_REFUSED, bPage, 5);
		myBlackList = new ArrayList<Map>();
		for(Friend f : bList){
			Map map = new HashMap();
			map.put("member", ms.get(f.getFriendId()));
			map.put("createDate",String.format("%1$tY-%1$tm-%1$td",  f.getCreateDate()));
			map.put("friend",f);
			myBlackList.add(map);
		}
		int bCount = fs.getGivenStateFriendsCount(member.getId(), Friend.STATE_REFUSED);
		pg = new Pagination();
		pg.setCurrentPage(bPage);
		pg.setRowsPerPage(5);
		pg.setRowsCount(bCount);
		pg.setUrl(request.getContextPath() + "/user/myblacklist.action?");
		myBlackListPagination = pg.getPagination();
		
		friendCount = new HashMap();
		friendCount.put("fCount", fCount);
		friendCount.put("vCount", vCount);
		friendCount.put("bCount", bCount);
		
	}
	
	public String getMyFriendsPagination() {
		return myFriendsPagination;
	}

	public String getMyValidateFriendsPagination() {
		return myValidateFriendsPagination;
	}

	public String getMyBlackListPagination() {
		return myBlackListPagination;
	}

	public List<Map> getMyFriends() {
		return myFriends;
	}
	
	public Map getFriendCount() {
		return friendCount;
	}

	public List<Map> getMyBlackList() {
		return myBlackList;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public void setFs(FriendService fs) {
		this.fs = fs;
	}

	public List<Map> getMyValidateFriends() {
		return myValidateFriends;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public Member getViewMember() {
		return viewMember;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public int getMemberId() {
		return memberId;
	}

	public List<Member> getFriendList() {
		return friendList;
	}

	public List<Member> getNewfriendList() {
		return newfriendList;
	}

}
