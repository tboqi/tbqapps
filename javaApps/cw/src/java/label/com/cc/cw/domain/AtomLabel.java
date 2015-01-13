package com.cc.cw.domain;
/**
 * 添加label的时候，将label的content同时添加到atomLabel
 * 用来纪录label的在每篇文章中引用次数，通过取和可以找到最热标签
 * @author dzh
 * 下午03:53:18
 */
public class AtomLabel {

	private int id;
	
	private int providerId;
	
	private String content;
	
	private int count;
	
	private int articleId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProviderId() {
		return providerId;
	}

	public void setProviderId(int providerId) {
		this.providerId = providerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	
	
}
