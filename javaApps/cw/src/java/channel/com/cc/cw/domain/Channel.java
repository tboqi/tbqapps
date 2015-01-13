package com.cc.cw.domain;

import java.util.Date;

/**
 * 频道
 * @author lsd037
 *
 */
public class Channel {

	private int id;
	
	private int memberId;
	
	private String  name;
	
	private String keywords;
	
	private String description;
	
	/** 创建日期 */
	private Date createDate;
	/** 支持总票数 */
	private int supportCount;
	/** 反对总票数 */
	private int unSupportCount;
	
	/** 此频道包含的可投票文章数量 */
	private int articleNums;
	
	/** 此频道包含的文章总数量 */
	private int totalArticles;
	
	/** 到期文章总数 */
	private int endArticleCount;
	/** 已到期，但未裁决的文章总数 */
	private int toEndCount;
	private int tuijian;
	
	/**
	 * 状态 0：申请中，1：通过，2：未通过
	 */
	private int State;

	public int getState() {
		return State;
	}

	public void setState(int state) {
		State = state;
	}

	public int getSupportCount() {
		return supportCount;
	}

	public void setSupportCount(int supportCount) {
		this.supportCount = supportCount;
	}

	public int getUnSupportCount() {
		return unSupportCount;
	}

	public void setUnSupportCount(int unSupportCount) {
		this.unSupportCount = unSupportCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public int getArticleNums() {
		return articleNums;
	}

	public void setArticleNums(int articleNums) {
		this.articleNums = articleNums;
	}

	public int getTotalArticles() {
		return totalArticles;
	}

	public void setTotalArticles(int totalArticles) {
		this.totalArticles = totalArticles;
	}

	public int getEndArticleCount() {
		return endArticleCount;
	}

	public void setEndArticleCount(int endArticleCount) {
		this.endArticleCount = endArticleCount;
	}

	public int getToEndCount() {
		return toEndCount;
	}

	public void setToEndCount(int toEndCount) {
		this.toEndCount = toEndCount;
	}

	public int getTuijian() {
		return tuijian;
	}

	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}

}
