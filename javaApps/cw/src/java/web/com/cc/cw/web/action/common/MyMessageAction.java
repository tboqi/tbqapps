package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.interceptor.MemberAware;
import com.opensymphony.webwork.ServletActionContext;

public class MyMessageAction extends SessionActionSupport implements MemberAware {

	private static final long serialVersionUID = 6336032005621745429L;
	
	private Member member;
	private MemberService memberService;
	private List<Map> messageList;
	private MessageService messageService;
	private int pn = 1;
	private String pagnation;
	private int[] mId;
	/** 操作结果提示信息 */
	private String msg;

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
		int pagerow = 20;
		List<Message> messageListTemp = messageService.getForeinMessages(member.getId(), pn, pagerow);
		if(messageListTemp != null && messageListTemp.size() > 0){
			messageList = new ArrayList<Map>();
			for(Message msg : messageListTemp){
				Map<String,String> map = new HashMap<String,String>();
				Member memberMsg = memberService.get(msg.getSenderId());
				if(msg.getSenderId() == -1){
					memberMsg = new Member();
					memberMsg.setUserName("系统留言");
				}
				if(memberMsg == null) continue;//过滤掉不存在的用户短消息
				
				map.put("msgId", ""+msg.getId());
				map.put("msgTitle", msg.getTitle());
				map.put("msgContent", msg.getContent());
				map.put("senderId", ""+msg.getSenderId());
				map.put("senderName", memberMsg.getUserName());
				map.put("sendTime", Convert.formatDate(msg.getSendTime(),"yyyy-MM-dd HH:mm:ss"));
				
				messageList.add(map);
			}
		}
		int total = messageService.getForeinMessageCount(member.getId());
		log.info("total == "+total);
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(pagerow);
		p.setUrl(request.getContextPath() + "/user/usermanage!article.action?");
		pagnation = p.getPagination();
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
	public String delete(){
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
	
	
	
	
	public void setMember(Member member) {
		this.member = member;
	}
	public List<Map> getMessageList() {
		return messageList;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public void setPn(int pn) {
		this.pn = pn;
	}
	public String getPagnation() {
		return pagnation;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public void setMId(int[] id) {
		mId = id;
	}
	public String getMsg() {
		return msg;
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

}
