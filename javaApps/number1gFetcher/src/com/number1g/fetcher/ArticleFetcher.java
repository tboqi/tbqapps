package com.number1g.fetcher;

import java.util.List;

import net.htmlparser.jericho.Source;

import com.number1g.dao.ArticleDao;
import com.number1g.entity.Article;

public abstract class ArticleFetcher implements Runnable {
	
	protected Article article;

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	
	protected Source source;
	
	protected ArticleDao articleDao;
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public abstract void fetcher(String url, int cateid);
	
	protected String parseError = "";
	protected String url;

	private List<String> urls;
	
	private int cateid;

	public int getCateid() {
		return cateid;
	}

	public void setCateid(int cateid) {
		this.cateid = cateid;
	}

	public List<String> getUrls() {
		return urls;
	}

	public void setUrls(List<String> urls) {
		this.urls = urls;
	}
	
	public void doFetching() {
		for (String url : urls) {
			fetcher(url, cateid);
		}
	}

	@Override
	public void run() {
		this.doFetching();
	}
}
