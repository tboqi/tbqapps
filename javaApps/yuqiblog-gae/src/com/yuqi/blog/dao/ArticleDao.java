package com.yuqi.blog.dao;

import java.util.List;

import com.yuqi.blog.domain.Article;

public interface ArticleDao {

	public List<Article> find(int start, int num);

	public Article save(Article article);

	public void delete(Long id);

	public int count();

	Article get(Long id);
	
	public List<Article> findByCategoryId(Long categoryId, int start, int num);
	
	public int countByCategoryId(Long categoryId);

	public List<Article> findAll(Long categoryId);
	
	public List<Article> findAll();
}
