package com.cc.cw.domain;

import java.util.Date;

/**
 * 提供给后台分析的数据类
 * @author dzh
 * 上午10:58:22
 */
public class ClickLog {

	private String uuid;
	private int articleId;
	private int channelId;
	private String tags;
	private String keyword;
	private String category;
	private Date clickTime;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getClickTime() {
		return clickTime;
	}
	public void setClickTime(Date clickTime) {
		this.clickTime = clickTime;
	}
}
