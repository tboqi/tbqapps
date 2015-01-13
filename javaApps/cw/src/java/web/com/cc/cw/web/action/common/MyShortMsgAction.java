package com.cc.cw.web.action.common;

import java.util.ArrayList;
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
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.interceptor.MemberAware;
import com.opensymphony.webwork.ServletActionContext;

public class MyShortMsgAction extends SessionActionSupport implements MemberAware {

	private static final long serialVersionUID = -8990263254775402661L;
	
	private Member member;
	private MessageService messageService;
	private List<Map> readedMessageList;
	private List<Map> unReadMessageList;
	private int pn = 1;
	private MemberService memberService;
	private FriendService friendService;
	private String readPagnation;
	private String unReadPagnation;
	private int[] mId;
	private int fId;
	private String msg;
	/** 好友列表 */
	private List<Member> mList;
	private String content;
	private String title;
	private Message message;
	/** 接收短消息的好友 */
	private Member friend;
	private int msgId;
	

	//###########################userleft相关
	private Member viewMember;
//	private MemberService memberService;
	private int memberId;
    //###########################################用户好友相关
	private List<Member> friendList;
	private List<Member> newfriendList;


	public String execute(){
		member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		HttpServletRequest request	= ServletActionContext.getRequest();
		String uri = request.getRequestURI();
		int upn = 1;
		if(uri.contains("msgunread")){
			upn = pn;
			pn = 1;
		}else if(uri.contains("msgread")){
			upn = 1 ;
		}else{
			upn = 1;
			pn = 1;
		}
		getUnReadMsg(request,upn);
		getReadMsg(request,pn);
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

	public String getReadMsg(){//TODO:查询已读消息
		member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		HttpServletRequest request	= ServletActionContext.getRequest();
		getReadMsg(request,pn);
		getUnReadMsg(request,1);
		
		return SUCCESS;
	}
	
	private void getUnReadMsg(HttpServletRequest request,int pn2){
		List<Message> unReadMsgListTemp = null;
		int unReadTotal = 0;
		unReadMsgListTemp = messageService.getUnReadedMessage(member.getId(),pn2,10);
		if(unReadMsgListTemp != null && unReadMsgListTemp.size() > 0){
			unReadMessageList = new ArrayList<Map>();
			for(Message msg : unReadMsgListTemp){
				Map<String,String> map = new HashMap<String,String>();
				Member memberMsg = null;
				if(msg.getSenderId() != -1){
					memberMsg = memberService.get(msg.getSenderId());
					if(memberMsg == null) continue;//过滤掉不存在的用户短消息
				}
				//不显示来自黑名单中以及非好友发的短消息
				Friend friend = null;
				if(memberMsg != null){
					try {
						friend = friendService.showFriend(member.getId(), memberMsg.getId());
						if(friend != null){
							int state = friend.getState();
							if(state < 0) continue;//过滤掉黑名单中的短消息
						}
						else ;
							//continue;//过滤掉非好友的短消息,但不过滤系统消息
					} catch (ServiceException e) {
						e.printStackTrace();
					}
				}
				
				map.put("msgId", ""+msg.getId());
				map.put("msgTitle", msg.getTitle());
				map.put("msgType", ""+msg.getMsgType());
				map.put("msgState", ""+msg.getState());
				int msgSenderId = msg.getSenderId();
				if(msg.getSenderId() == -1) msgSenderId =1000891;
				map.put("senderId", ""+msgSenderId);
				if(msg.getSenderId() != -1){
					map.put("senderName", memberMsg == null?"":memberMsg.getUserName());
				}else{
					map.put("senderName", "系统管理员");
				}
				map.put("sendTime", Convert.formatDate(msg.getSendTime(),"yyyy-MM-dd HH:mm:ss"));
				
				unReadMessageList.add(map);
			}
		}

		unReadTotal = messageService.getUnReadMessageCount(member.getId());//获得未读信息总数
		Pagination p = new Pagination();
		p = new Pagination();
		p.setCurrentPage(pn2);
		p.setRowsCount(unReadTotal);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/shortmsgunread.action?");
		unReadPagnation = p.getPagination();
	}
	
	private void getReadMsg(HttpServletRequest request,int pn1){
		List<Message> readMsgListTemp = null;
		int readTotal = 0;
		
		readMsgListTemp = messageService.getReadedMessage(member.getId(),pn1,10);
		if(readMsgListTemp != null && readMsgListTemp.size() > 0){
			readedMessageList = new ArrayList<Map>();
			for(Message msg : readMsgListTemp){
				Map<String,String> map = new HashMap<String,String>();
				Member memberMsg = null;
				if(msg.getSenderId() != -1){
					memberMsg = memberService.get(msg.getSenderId());
					if(memberMsg == null) continue;//过滤掉不存在的用户短消息
				}
				
				//不显示来自黑名单中以及非好友发的短消息
				Friend friend = null;
				if(memberMsg != null){
					try {
						friend = friendService.showFriend(member.getId(), memberMsg.getId());
						if(friend != null){
							int state = friend.getState();
							if(state < 0) continue;//过滤掉黑名单中的短消息
						}else if(msg.getMsgType() == 0) ;
							//continue;//过滤掉非好友的短消息,但不过滤系统消息
					} catch (ServiceException e) {
						e.printStackTrace();
					}
				}
				
				map.put("msgId", ""+msg.getId());
				map.put("msgTitle", msg.getTitle());
				map.put("msgType", ""+msg.getMsgType());
				map.put("msgState", ""+msg.getState());
				map.put("senderId", ""+msg.getSenderId());
				if(msg.getSenderId() != -1){
					map.put("senderName", memberMsg == null?"":memberMsg.getUserName());
				}else{
					map.put("senderName","系统管理员");
				}
				map.put("sendTime", Convert.formatDate(msg.getSendTime(),"yyyy-MM-dd HH:mm:ss"));
				
				readedMessageList.add(map);
			}
		}

		readTotal = messageService.getReadedMessageCount(member.getId());//获得已读信息总数
		Pagination p = new Pagination();
		p.setCurrentPage(pn1);
		p.setRowsCount(readTotal);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/shortmsgread.action?");
		readPagnation = p.getPagination();
	}
	
	public String delete(){//TODO:删除消息
		int result = 0;
		if(mId != null && mId.length > 0){
			for(int id : mId){
				result = messageService.delete(id);
			}
		}
		
		if(result > 0){
			msg = getText("info_operation_success");
		}else{
			msg = getText("error_operation_error");
		}
		
		return execute();
	}
	

	public String sendMsg(){//TODO:转到编辑短消息页面	
		member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
//		try {
//			int count = friendService.getGivenStateFriendsCount(member.getId(), 1);
//			List<Friend> fList = friendService.getGivenStateFriends(member.getId(), 1, 1, count);
//			if(fList != null && fList.size() > 0){
//				mList = new ArrayList<Member>();
//				for(Friend f : fList){
//					Member m = memberService.get(f.getFriendId());
//					if(m != null)
//						mList.add(m);
//				}
//			}
//		} catch (ServiceException e) {
//			e.printStackTrace();
//		}
		
		friend = memberService.get(fId);
		if(friend == null ){
			this.addActionError(getText("error_member_notexists"));
			return ERROR;
		}
		return INPUT;
	}
	
	public String replyMessage(){//TODO:回复短消息 
		member = (Member)session.get("member");
		if(member == null){
			this.addActionError(getText("error_member_null"));
			return ERROR;
		}
		
		Message messageTmp = new Message();
		messageTmp.setSenderId(member.getId());
		messageTmp.setReceiveId(fId);
		messageTmp.setMsgType(Message.MESSAGE_USER);
		messageTmp.setTitle(title);
		messageTmp.setContent(content);
		
		int result = messageService.add(messageTmp);
		if(result > 0){
			msg = getText("info_operation_success");
			return INPUT;
		}
		else{
			msg = getText("error_operation_error");
			return INPUT;
		}
	}
	
	public String viewMessage(){//TODO:查看短消息
		message = messageService.get(msgId);
		messageService.updateState(msgId, 1);
		if(message.getSenderId() == -1) message.setSenderId(1000891);
		return "view";
	}
	
	
	public void setMember(Member member) {
		this.member = member;
	}
	public List<Map> getReadedMessageList() {
		return readedMessageList;
	}
	public String getReadPagnation() {
		return readPagnation;
	}
	public List<Map> getUnReadMessageList() {
		return unReadMessageList;
	}
	public String getUnReadPagnation() {
		return unReadPagnation;
	}
	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public void setPn(int pn) {
		this.pn = pn;
	}
	public void setMId(int[] id) {
		mId = id;
	}
	public String getMsg() {
		return msg;
	}
	public List<Member> getMList() {
		return mList;
	}
	public int getFId() {
		return fId;
	}
	public void setFId(int id) {
		fId = id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Message getMessage() {
		return message;
	}
	public Member getFriend() {
		return friend;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
}
