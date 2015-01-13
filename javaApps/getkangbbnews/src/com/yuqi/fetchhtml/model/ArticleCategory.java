package com.yuqi.fetchhtml.model;

public class ArticleCategory {

	private Integer id;
	private String title;
	private Integer pid;
	private String description;
	private String imagevarchar;
	private Integer ordermediumint;
	private String templatevarchar;
	private Integer entryint;
	private String sponsor;
	private String moderator;
	private String track;
	
	public ArticleCategory(){
		
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
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImagevarchar() {
		return imagevarchar;
	}
	public void setImagevarchar(String imagevarchar) {
		this.imagevarchar = imagevarchar;
	}
	public Integer getOrdermediumint() {
		return ordermediumint;
	}
	public void setOrdermediumint(Integer ordermediumint) {
		this.ordermediumint = ordermediumint;
	}
	public String getTemplatevarchar() {
		return templatevarchar;
	}
	public void setTemplatevarchar(String templatevarchar) {
		this.templatevarchar = templatevarchar;
	}
	public Integer getEntryint() {
		return entryint;
	}
	public void setEntryint(Integer entryint) {
		this.entryint = entryint;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getModerator() {
		return moderator;
	}
	public void setModerator(String moderator) {
		this.moderator = moderator;
	}
	public String getTrack() {
		return track;
	}
	public void setTrack(String track) {
		this.track = track;
	}
	public String getLastarticles() {
		return lastarticles;
	}
	public void setLastarticles(String lastarticles) {
		this.lastarticles = lastarticles;
	}
	private String lastarticles;
}
