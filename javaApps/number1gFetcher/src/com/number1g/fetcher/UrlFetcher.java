package com.number1g.fetcher;

import java.util.ArrayList;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.StartTag;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.number1g.dao.ArticleDao;
import com.number1g.entity.Category;
import com.yuqi.utils.HtmlUtils;

public abstract class UrlFetcher {
	
	public abstract void doFetching(String url, int cateid);

	private Category cate;
	
	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	protected ArticleDao articleDao;
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	protected ArticleFetcher articleFetcher;

	public ArticleFetcher getArticleFetcher() {
		return articleFetcher;
	}

	public void setArticleFetcher(ArticleFetcher articleFetcher) {
		this.articleFetcher = articleFetcher;
	}
}
