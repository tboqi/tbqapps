package com.yuqi.rssreader;

import java.util.Date;

public class Article {
	public Article(String description, String title, String link,
			String author, Date publishedDate, String feedUrl, String feedName) {
		super();
		this.description = description;
		this.title = title;
		this.link = link;
		this.author = author;
		this.publishedDate = publishedDate;
		this.feedUrl = feedUrl;
		this.feedName = feedName;
	}
	
	public Article() {
		
	}
	
	public String toString() {
		return title;
	}

	private String description;
	private String title;
	private String link;
	private String author;
	private Date publishedDate;
	private String feedUrl;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}

	public String getFeedUrl() {
		return feedUrl;
	}

	public void setFeedUrl(String feedUrl) {
		this.feedUrl = feedUrl;
	}

	public String getFeedName() {
		return feedName;
	}

	public void setFeedName(String feedName) {
		this.feedName = feedName;
	}

	private String feedName;
}
