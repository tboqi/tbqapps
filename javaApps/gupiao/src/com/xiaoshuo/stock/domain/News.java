package com.xiaoshuo.stock.domain;

import java.util.Date;

public class News {
	private int id;

	private String title;

	private String content;

	private String stockNum;

	private Date pubDate;

	private String oldUrl;
	
	public String toString(){
		return "------------------\ntitle" + title + "\nstockNum" + stockNum + "\ncontent"
		+ content + "+++++++++++++++++++++";
	}

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

	public String getOldUrl() {
		return oldUrl;
	}

	public void setOldUrl(String oldUrl) {
		this.oldUrl = oldUrl;
	}

	public Date getPubDate() {
		return pubDate;
	}

	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}

	public String getStockNum() {
		return stockNum;
	}

	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
