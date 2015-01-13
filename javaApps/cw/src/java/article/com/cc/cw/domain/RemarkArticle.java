package com.cc.cw.domain;


/**
 * 文章评论类
 * @author lsd037
 *
 */
public class RemarkArticle extends Article{
	
	public static final int TYPE_REMARK = 1;
	public static final int TYPE_CLEW = 2;
	
	private int articleId;
	/** 回复类型：TYPE_REMARK：普通回复 |　TYPE_CLEW：线索 */
	private int type;
	
	/** 级别 */
	private int level;
	
	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
