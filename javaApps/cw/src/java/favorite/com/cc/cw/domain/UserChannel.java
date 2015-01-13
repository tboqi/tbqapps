package com.cc.cw.domain;

import java.util.Date;

public class UserChannel {

	private String uuid;

	private int channelId;

	private int clickTime;

	private Date updateTime;

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public int getClickTime() {
		return clickTime;
	}

	public void setClickTime(int clickTime) {
		this.clickTime = clickTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
