/**
 * 
 */
package com.number1g.entity;

/**
 * @author 唐伯琦
 *
 */
public class Article {
	
	private Integer id;
	private String title;
	private String content;
	private String sourceUrl;

	/**
	 * 
	 */
	public Article() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSourceUrl() {
		return sourceUrl;
	}

	public void setSourceUrl(String sourceUrl) {
		this.sourceUrl = sourceUrl;
	}

}
