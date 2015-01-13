package com.cc.cw.service.impl;

import com.cc.cw.dao.ArticleDAO;
import com.cc.cw.domain.Article;
import com.cc.cw.service.ArticleService;

public abstract class ArticleServiceImpl <T extends Article>implements ArticleService<T>{
	
//	private ArticleDAO<T> dao;
	
	public abstract ArticleDAO<T> getResourceDao() ;
	
	
	public int add(T article) {
		return getResourceDao().add(article);
	}

	public T getById(int id) {
		return getResourceDao().getById(id);
	}
	
	public boolean update(T article){
		return getResourceDao().update(article) > 0;
	}
	
	public boolean delete(int id){
		return getResourceDao().delete(id) > 0;
	}
	public boolean delete2(int id){
		return getResourceDao().delete2(id) > 0;
	}
	
}
