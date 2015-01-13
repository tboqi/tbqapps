package com.yuqi.blog.service;

import java.util.List;

import com.yuqi.blog.dao.ArticleDao;
import com.yuqi.blog.dao.CategoryDao;
import com.yuqi.blog.domain.Article;
import com.yuqi.blog.domain.Category;

public class CategoryService {

	private CategoryDao categoryDao;
	private ArticleDao articleDao;

	public Category get(Long id) {
		return categoryDao.get(id);
	}

	public void delete(Long id) {
		categoryDao.delete(id);
		List<Article> list = articleDao.findAll(id);
		for (Article article : list) {
			article.setCategoryId(0L);
			articleDao.save(article);
		}
	}
	
	public void delete(int id) {
		delete(new Long(id));
	}

	public Category save(Category category) {
		return categoryDao.save(category);
	}

	public List<Category> find() {
		return categoryDao.find();
	}

	public int count() {
		return categoryDao.count();
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public ArticleDao getArticleDao() {
		return articleDao;
	}
}
