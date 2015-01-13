package com.cc.cw.dm.module;

import java.sql.Timestamp;

public class ClickLog {
	private String uuid;
	private Integer articleid;
	private Integer channelId;
	private String tags;
	private String keyword;
	private String category;
	private Timestamp clicktime;

	public ClickLog(String uuid, Integer articleid, Integer channelId, String tags, String keyword, String category, Timestamp clicktime) {
		super();
		this.uuid = uuid;
		this.articleid = articleid;
		this.channelId = channelId;
		this.tags = tags;
		this.keyword = keyword;
		this.category = category;
		this.clicktime = clicktime;
	}
	
	public ClickLog(){
		
	}
	public Integer getArticleid() {
		return articleid;
	}
	public void setArticleid(Integer articleid) {
		this.articleid = articleid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getChannelId() {
		return channelId;
	}
	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}
	public Timestamp getClicktime() {
		return clicktime;
	}
	public void setClicktime(Timestamp clicktime) {
		this.clicktime = clicktime;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	
}
