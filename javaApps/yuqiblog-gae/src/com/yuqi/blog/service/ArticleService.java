package com.yuqi.blog.service;

import java.util.List;

import com.yuqi.blog.dao.ArticleDao;
import com.yuqi.blog.domain.Article;

public class ArticleService {

	private ArticleDao articleDao;

	public Article get(Long id) {
		return articleDao.get(id);
	}

	public void delete(Long id) {
		articleDao.delete(id);
	}

	public Article save(Article article) {
		return articleDao.save(article);
	}

	public List<Article> find(int start, int num) {
		return articleDao.find(start, num);
	}

	public int count() {
		return articleDao.count();
	}

	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
}
