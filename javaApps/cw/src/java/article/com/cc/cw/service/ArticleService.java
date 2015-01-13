package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.Article;

/**
 * 
 * @author lsd037
 *
 */
public interface ArticleService<T extends Article> {

	public int add(T article);
	
	public T getById(int id);
	
	public boolean update(T article);
	
	public boolean delete(int id);
	
	/**
	 * 查询所有纪录信息
	 * @return List<T>
	 */
	public List<T> getAll();
	
	/**
	 * 根据给定参数，查询所有新增的纪录信息
	 * @param id
	 * @return List<T>
	 */
	public List<T> getNewFromId(int id);
	
	/**
	 * 根据给定参数，检查是否有新的纪录产生
	 * @param id
	 * @return boolean
	 */
	public boolean haveNewResource(int id);
	
	/**
	 * 根据用户id查询所属文章或回复
	 * @param id
	 * @return
	 */
	public List<T> getByMemberId(int id);
	
	public List<T> search(String key,int page,int count);
	
	public int searchCount(String key);
	
}
