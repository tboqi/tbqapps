package com.cc.cw.domain;

import java.util.Date;

public class Friend {
	public static final int STATE_APPLYING = 0;
	public static final int STATE_FRIEND = 1;
	public static final int STATE_REFUSED = -1;
	
	/**	主键Id */
	private int Id;
	/** 自己的ID号 */
	private int myId;	
	/** 好友的ID号 */
	private int friendId;	
	/** 备注信息 */
	private String comment;
	/** 请求日期 */
	private Date createDate;
	/** 确定好友的时间 */
	private Date passedTime;	
	/** 两人当前关系的状态：0：请求状态 | 1：好友状态 | -1：被屏蔽状态 */
	private int state;

	public Friend(){
		myId = 0;
		friendId = 0;
		passedTime = null;
		state = 3;
	}
	
	public Date getPassedTime() {
		return passedTime;
	}

	public void setPassedTime(Date contactTime) {
		this.passedTime = contactTime;
	}

	public int getFriendId() {
		return friendId;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}

	public int getMyId() {
		return myId;
	}

	public void setMyId(int myId) {
		this.myId = myId;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append(super.toString());
		sb.append(", myId=");
		sb.append(this.myId);
		sb.append(", friendId=");
		sb.append(this.friendId);
		sb.append(", contactTime=");
		sb.append(this.passedTime);
		sb.append(", state=");
		sb.append(this.state);
		return sb.toString();
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
