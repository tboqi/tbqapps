package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Friend;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.exception.ServiceException;
import com.cc.cw.service.FriendService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.ValidateUtil;
import com.opensymphony.webwork.ServletActionContext;

public class FriendAction extends SessionActionSupport {

	private static final long serialVersionUID = -3240217165583071656L;
	private static final String MANAGE_FRIEND = "manage";
	private static final String MANAGE_HOME = "managehome";
	
	private MemberService memberService;
	private Member friend;
	/** 好友ID */
	private int friendId;
	private int memberId;
	private List<Map<String,Object>> friendList;
	/** 要查看何种状态的好友 */
	private int state = 1;
	
	private FriendService friendService;
	private String comment;
	/** 操作结果提示信息 */
	private String msg;
	
	private MessageService messageService;
	private String title;
	private String content;
	
	/** 当前页 */
	private int pn = 1;
	private String pagnation;
	private String myPrivilege;
	private String privilege;
	/** 好友总数 */
	private int friendTotal;
	/** 等待验证的好友总数 */
	private int waitingTotal;
	/** 黑名单总数 */
	private int blackListTotal;
	/** 好友的状态，用于页面动态显示 */
	private String isMyFriend;

	public String execute(){
		Member member = (Member)session.get("member");
		//获得登录用户的点数，用于页面显示
		if(member == null){
			myPrivilege = "<font color=red>对不起！您需要<a href=login.action title=登录后才能查看及赠送点数 alt=登录后才能查看及赠送点数>登录</a>后才能查看及赠送点数！</font>";
		}else{
			myPrivilege = member.getPrivilege()+"&nbsp;点";
			//如果登录用户点自己，则跳转到用户管理页面
			if(member.getId() == friendId){
				return MANAGE_HOME;
			}
			//检查该用户是否已经是我的好友
			Friend f = null;
			try {
				f = friendService.showFriend(member.getId(), friendId);
				if(f != null){
					isMyFriend = ""+f.getState();
				}
			} catch (ServiceException e) {
				e.printStackTrace();
			}
		}
		friend = memberService.get(friendId);
		return SUCCESS;
	}
	
	public String addThisFriend(){//TODO:添加某用户为好友
		Member member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		log.info("step --> 1");
		try {
			//判断该好友是否已在好友列表中
			Friend f = friendService.showFriend(member.getId(), friendId);
			if(f != null){
				msg = getText("info_friend_exist");
				log.info("step --> 2");
				return "managehome";
			}
			f = new Friend();
			f.setMyId(member.getId());
			f.setFriendId(friendId);
			f.setComment(comment);
			int result = friendService.apply(f);
			if(result > 0){
				msg = getText("info_friend_success");
				log.info(msg);
				log.info("step --> 3");
				return "managehome";
			}else{
				msg = getText("error_operation_error");
				log.info("step --> 4");
				return "managehome";
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			msg = getText("error_operation_error");
			log.info("step --> 5");
			return "managehome";
		}
	}
	
	public String myFriend(){//TODO:好友管理
		Member member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		int total = 0;
		try {
			List<Friend> fl = friendService.getGivenStateFriends(member.getId(), state, pn, 10);
			if(fl != null){
				friendList = new ArrayList<Map<String,Object>>();
				for(Friend f : fl){
					Map<String,Object> map = new HashMap<String,Object>();
					Member m = memberService.get(f.getFriendId());
					if(m == null) continue;
					map.put("friend", f);
					map.put("friendInfo", m);
					friendList.add(map);
				}
			}
			total = friendService.getGivenStateFriendsCount(member.getId(), state);
			friendTotal = friendService.getGivenStateFriendsCount(member.getId(), 1);
			waitingTotal = friendService.getGivenStateFriendsCount(member.getId(), 0);
			blackListTotal = friendService.getGivenStateFriendsCount(member.getId(), -1);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/friend!myFriend.action?state="+state+"&");
		pagnation = p.getPagination();
		return MANAGE_FRIEND;
	}

	public String remove(){//TODO:屏蔽好友
		try {
			boolean success = friendService.remove(friendId);
			if(success)
				msg = getText("info_operation_success");
			else
				msg = getText("error_operation_error");
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return MANAGE_HOME;
//		Member member = (Member)session.get("member");
//		try {
//			friendService.delete(member.getId(), friendId);
//			friendService.delete(friendId, member.getId());
//			
//			//发送短消息给被拒绝对象
//			Message message = new Message();
//			message.setSenderId(-1);//将发送者ID设为-1，用以区别其它不存在用户发送的留言
//			message.setReceiveId(friendId);
//			message.setMsgType(Message.MESSAGE_USER);
//			message.setTitle("系统消息");
//			HttpServletRequest request = ServletActionContext.getRequest();
//			String str = "用户：<a href="+request.getContextPath()+"/user/viewuser.action?memberId="+member.getId()+" title=查看用户信息 alt=查看用户信息 target=_blank >"+member.getUserName()+"</a> 拒绝您的加为好友请求。";
//			message.setContent(str);
//			
//			messageService.add(message);
//			if(true)
//				msg = getText("info_operation_success");
//			else
//				msg = getText("error_operation_error");
//		} catch (ServiceException e) {
//			e.printStackTrace();
//		}
//		
//		return MANAGE_HOME;
	}
	
	public String confirm(){//TODO:确认为好友

		try {
			boolean success = friendService.confirm(friendId);
			if(success)
				msg = getText("info_operation_success");
			else
				msg = getText("error_operation_error");
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return MANAGE_HOME;
	}
	
	@SuppressWarnings("unchecked")
	public String sendMessage(){//TODO:发留言
		Member member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		Message message = new Message();
		message.setSenderId(member.getId());
		message.setReceiveId(friendId);
		message.setMsgType(Message.MESSAGE);
		message.setTitle("");
		message.setContent(content);
		
		int result = messageService.add(message);
		if(result > 0)
			msg = getText("info_operation_success");
		else
			msg = getText("error_operation_error");
		session.put("msg", msg);
		return INPUT;
	}
	
	@SuppressWarnings("unchecked")
	public String privilege(){//TODO:赠送点数
		Member member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		int privilegeInt = 0;
		if(ValidateUtil.isNumber(privilege, false)){//验证点数是否为有效数字
			privilegeInt = Integer.parseInt(privilege);
		}else{
			msg = getText("error_article_rate");
			return "managehome";
		}
		//比较是否足够赠送点数
		int memberPrivilege = member.getPrivilege();
		if(memberPrivilege < privilegeInt){
			msg = getText("error_vote_privilege");
			return "managehome";
		}
		Member tmp = memberService.get(friendId);
		//增加被赠送者的点数
		boolean success = memberService.updatePrivilege(friendId, tmp.getPrivilege()+privilegeInt);
		if(success)//如果成功，减少赠送者的点数
			success = memberService.updatePrivilege(member.getId(), member.getPrivilege()-privilegeInt);
		if(success){
			member.setPrivilege(member.getPrivilege()-privilegeInt);
			session.put("member", member);
			
			//发送短消息给被赠送者   将发送者ID设为-1，用以区别其它不存在用户发送的留言
			HttpServletRequest request = ServletActionContext.getRequest();
			String str = "用户：<a href="+request.getContextPath()+"/user/viewuser.action?memberId="+member.getId()+" title=查看用户信息 alt=查看用户信息 target=_blank >"+member.getUserName()+"</a> 于 "+DateTimeUtil.parseDateToString(new Date())+" 向您赠送了"+privilegeInt+" 点！";
			messageService.sendMessage(-1, friendId, Message.MESSAGE_SYSTEM, "系统消息", str);
			
			msg = getText("info_operation_success");
		}
		else
			msg = getText("error_operation_error");

		return "managehome";
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setFriendId(int fId) {
		this.friendId = fId;
	}

	public Member getFriend() {
		return friend;
	}

	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getMsg() {
		return msg;
	}

//	public void setMsg(String msg) {
//		this.msg = msg;
//	}

	public int getFriendId() {
		return friendId;
	}

	public List<Map<String,Object>> getFriendList() {
		return friendList;
	}

	public String getPagnation() {
		return pagnation;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public void setState(int state) {
		this.state = state;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public String getTitle() {
		return title;
	}

	public String getMyPrivilege() {
		return myPrivilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	public int getBlackListTotal() {
		return blackListTotal;
	}

	public int getFriendTotal() {
		return friendTotal;
	}

	public int getWaitingTotal() {
		return waitingTotal;
	}

	public String getIsMyFriend() {
		return isMyFriend;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
}
