package com.yuqi.blog.dao.gae;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.yuqi.blog.dao.ArticleDao;
import com.yuqi.blog.domain.Article;
import com.yuqi.blog.utils.PMF;

public class ArticleDaoImpl implements ArticleDao {
	private PersistenceManager pm = PMF.get().getPersistenceManager();

	@Override
	public void delete(Long id) {
		pm.deletePersistent(get(id));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> find(int start, int num) {
		Query query = pm.newQuery(Article.class);
		query.setOrdering("createTime desc");
		query.setRange(start - 1, num);
		return (List<Article>) query.execute();
	}

	@Override
	public Article get(Long id) {
		return pm.getObjectById(Article.class, id);
	}

	@Override
	public Article save(Article article) {
		pm.makePersistent(article);
		pm.close();
		pm = PMF.get().getPersistenceManager();
		return article;
	}

	@Override
	public int count() {
		Query query = pm.newQuery(Article.class);
		query.setResult("count(this.id)");
		int results = (Integer) query.execute();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findByCategoryId(Long categoryId, int start, int num) {
		Query query = pm.newQuery(Article.class);
		query.setFilter("categoryId == categoryIdParam");
		query.declareParameters("Long categoryIdParam");
		query.setRange(start - 1, num);
		List<Article> list = (List<Article>)query.execute(categoryId);
		return list;
	}

	@Override
	public int countByCategoryId(Long categoryId) {
		Query query = pm.newQuery(Article.class);
		query.setFilter("categoryId == categoryIdParam");
		query.declareParameters("Long categoryIdParam");
		query.setResult("count(this.id)");
		int num = (Integer) query.execute(categoryId);
		return num;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAll(Long categoryId) {
		Query query = pm.newQuery(Article.class);
		query.setFilter("categoryId == categoryIdParam");
		query.declareParameters("Long categoryIdParam");
		List<Article> list = (List<Article>)query.execute(categoryId);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAll() {
		Query query = pm.newQuery(Article.class);
		query.declareParameters("Long categoryIdParam");
		List<Article> list = (List<Article>)query.execute();
		return list;
	}
}
