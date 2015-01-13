package com.cc.cw.service.impl;

import java.util.Iterator;
import java.util.List;

import com.cc.cw.dao.MessageDAO;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;

public class MessageServiceImpl implements MessageService {
	private MessageDAO msgdao;

	private MemberService memberService;

	public int add(Message msg) {
		int newId = 0;
		
		// 判断用户是否存在 
		if (memberService.get(msg.getReceiveId()) != null) {
			newId = msgdao.add(msg);
		} else {
			return -1;
		}
		return newId;
	}

	public boolean updateState(int id, int state) {
		int result = msgdao.updateState(id, state); 
		
		return result > 0;
	}
	
	public Message get(int id){
		return msgdao.get(id);
	}
	
	public int delete(int id){
		return msgdao.delete(id);
	}

	
	
	
	
	public List<Message> getAllMessages(int memberId, int page, int count) {
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		
		return msgdao.getAllMessages(memberId, start, count);
	}
	
	public List<Message> getReadedMessage(int memberId,  int page, int count){
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		
		return msgdao.getReadedMessage(memberId, start, count);
	}

	public List<Message> getUnReadedMessage(int memberId,  int page, int count){
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		
		return msgdao.getUnReadedMessage(memberId, start, count);
	}
	
	
	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public MessageDAO getMsgdao() {
		return msgdao;
	}

	public void setMsgdao(MessageDAO msgdao) {
		this.msgdao = msgdao;
	}
	
	public int getAllMessageCount(int memberId){
		return msgdao.getMessageCount(memberId, -1);
	}
	
	public int getUnReadMessageCount(int memberId){
		return msgdao.getMessageCount(memberId, 0);
	}
	
	public int getReadedMessageCount(int memberId){
		return msgdao.getMessageCount(memberId, 1);
	}

	public List<Message> getForeinMessages(int memberId, int page, int count) {
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		
		return msgdao.getForeinMessages(memberId, start, count);
	}

	public int getForeinMessageCount(int memberId) {
		return msgdao.getForeinMessageCount(memberId);
	}

	public void sendMessage(int formId,int toId, int messageType, String messageTitle, String content) {
		Message message = new Message();
		message.setSenderId(formId);//将发送者ID设为-1，用以区别其它不存在用户发送的留言
		message.setReceiveId(toId);
		message.setMsgType(messageType);
		message.setTitle(messageTitle);
		message.setContent(content);
		
		msgdao.add(message);		
	}

	public int count(int msgType) {
		return msgdao.count(msgType);
	}

	public int countLikeContent(String key, int msgType) {
		return msgdao.countLikeContent(key, msgType);
	}

	public int countLikeMember(String key, int msgType) {
		String memberIds = "";
		List<Member> memberList = memberService.findLikeKey(key);
		if(memberList == null || memberList.size() < 1) return 0;
		for (Iterator iter = memberList.iterator(); iter.hasNext();) {
			Member member = (Member) iter.next();
			memberIds += "," + member.getId();
		}
		memberIds = memberIds.substring(1);
		return msgdao.countInMemberIds(memberIds, msgType);
	}

	public void deleteByIds(String ids) {
		msgdao.deleteByIds(ids);
	}

	public List<Message> findLikeContent(String key, int msgType, int start, int count) {
		return msgdao.findLikeContent(key, msgType, start, count);
	}

	public List<Message> findLikeMember(String key, int msgType, int start, int count) {
		String memberIds = "";
		List<Member> memberList = memberService.findLikeKey(key);
		if(memberList == null || memberList.size() < 1) return null;
		for (Iterator iter = memberList.iterator(); iter.hasNext();) {
			Member member = (Member) iter.next();
			memberIds += "," + member.getId();
		}
		memberIds = memberIds.substring(1);
		return msgdao.findInMemberIds(memberIds, msgType, start, count);
	}
	public List<Message> find(int msgType, int start, int count){
		return msgdao.find(msgType, start, count);
	}
}
