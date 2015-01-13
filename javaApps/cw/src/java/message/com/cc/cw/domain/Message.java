package com.cc.cw.domain;
import java.util.Date;
public class Message {
	public static final int MESSAGE_SYSTEM = 1;
	public static final int MESSAGE_USER = 0;
	public static final int MESSAGE = 2;
	
    private int id;
	
	/** 发送方Id */
	private int senderId;
	
	/** 接收方Id*/
	private int receiveId;
	           
	/**状态*/
	private int state;
	/** 短信息类型 (系统消息,用户消息)**/
	private int msgType;
	/** 短信息标题 */
	private String title;
	/** 短信息内容 */
	private String content;
	/** 短信息发送时间 */
	private Date sendTime;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMsgType() {
		return msgType;
	}
	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}
	public int getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(int receiveId) {
		this.receiveId = receiveId;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	

}
