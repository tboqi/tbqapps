package com.cc.cw.domain;

import java.util.Date;

public class Broadcast {
	/** 主键 */
	private int id;
	/** 发广播用户ID */
	private int memberId;
	/** 发广播用户呢称*/
	private String memberName;
	/** 发广播的目标文章 */
	private int articleId;
	/** 发广播的目标文章的标题*/
	private String articleTitle;
	/** 广播发布时间 */
    private Date createDate;
    /** 广播类型 0:拉票 1:募捐 */
    private int sort;
    /** 拉票的种类 0:真 1:假 -1募捐类 */
    private int flag;
    /** 广播内容 */
    private String content;
    
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int state) {
		this.sort = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
    
}
