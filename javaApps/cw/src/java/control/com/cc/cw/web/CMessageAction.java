package com.cc.cw.web;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;

public class CMessageAction extends CMyAction {
	private static final long serialVersionUID = 1L;

	private String flag;

	private int id;

	private String content;

	private List<Message> list;

	private int cp;

	private UrlPage page;

	private int property;

	private String key;

	private String ids;

	private MessageService messageService;

	private MemberService memberService;

	private String title;

	@Override
	public String doExecute() {
		if (StringUtils.equals(flag, "delete")) {
			messageService.deleteByIds(ids);
			setMessage("删除成功");
			return "message";
		}
		if (StringUtils.equals(flag, "input")) {
			// 执行一个进程给所有用户发系统消息
			Message m = new Message();
			m.setContent(content);
			m.setMsgType(1);
			// m.setReceiveId(receiveId);
			m.setSenderId(-1);
			m.setSendTime(new Date());
			m.setState(0);
			m.setTitle(title);
			Thread thread = new Thread(new MessageSenderThread(messageService, m, memberService));
			thread.start();
			
			return SUCCESS;
		}
		int perPageRows = 12;
		if (cp < 1)
			cp = 1;
		int count = 0;
		int MsgType = 0;
		if (StringUtils.equals(flag, "doSearch")) {

			if (property == 0) {
				count = messageService.countLikeMember(key, MsgType);
				list = messageService.findLikeMember(key, MsgType, (cp - 1)
						* perPageRows, perPageRows);
			} else {
				count = messageService.countLikeContent(key, MsgType);
				list = messageService.findLikeContent(key, MsgType, (cp - 1)
						* perPageRows, perPageRows);
			}

			page = new UrlPage(cp, count, perPageRows, "flag=doSearch&key="
					+ key + "&property=" + property + "&");

			return LIST;
		}
		if (StringUtils.equals(flag, "list")) {
			count = messageService.count(MsgType);
			page = new UrlPage(cp, count, perPageRows, "flag=list&");
			list = messageService.find(MsgType, (cp - 1) * perPageRows,
					perPageRows);
			return LIST;
		}
		return "publish";
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Message> getList() {
		return list;
	}

	public void setList(List<Message> list) {
		this.list = list;
	}

	public UrlPage getPage() {
		return page;
	}

	public void setPage(UrlPage page) {
		this.page = page;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getProperty() {
		return property;
	}

	public void setProperty(int property) {
		this.property = property;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}

class MessageSenderThread implements Runnable {
	private MessageService messageService;

	private MemberService memberService;

	private Message newMessage;

	private static final Logger logger = Logger
			.getLogger(MessageSenderThread.class);

	public MessageSenderThread(MessageService messageService,
			Message newMessage, MemberService memberService) {
		super();
		this.messageService = messageService;
		this.newMessage = newMessage;
		this.memberService = memberService;
	}

	public void run() {
		logger.info("开始发送系统信息");
		List<Member> list = memberService.find();
		Message msg = new Message();
		msg.setContent(newMessage.getContent());
		msg.setMsgType(newMessage.getMsgType());
		msg.setSenderId(newMessage.getSenderId());
		msg.setSendTime(newMessage.getSendTime());
		msg.setState(newMessage.getState());
		msg.setTitle(newMessage.getTitle());
		int i = 1;
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Member member = (Member) iter.next();
			msg.setReceiveId(member.getId());
			messageService.add(msg);
			i++;
		}
		if (logger.isInfoEnabled()) {
			logger.info("系统信息发送的条数是：" + i);
		}
		msg = null;
	}

}