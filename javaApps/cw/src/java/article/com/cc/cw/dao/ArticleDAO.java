package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Article;

public interface ArticleDAO<T extends Article> {

	public int add(T article);
	
	public T getById(int id);
	
	public int update(T article);
	
	public int delete(int id);
	
	public List<T> getAll();
	
	public List<T> getNewFromId(int id);
	
	public int haveNewResource(int id);
	
	public List<T> getByMemberId(int id);

	public List<T> search(String key,int start,int count);
	
	public int searchCount(String key);

	public int delete2(int id);
}
