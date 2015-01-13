package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.AtomLabel;

public interface AtomLabelDAO {

	public int add(AtomLabel atomLabel);
	
	public int update(AtomLabel atomLabel);
	
	public int delete(int id);
	
	public AtomLabel getById(int id);
	
	/**
	 * 根据内容增和文章Id加标签引用次数
	 * @param content
	 * @param count
	 * @return
	 */
	public int increaseCountByContentArticleId(String content,int articleId,int count);
	
	/**
	 * 根据content查询是否有此纪录
	 * @param content
	 * @param articleId
	 * @return
	 */
	public boolean exists(String content,int articleId);
	
	/**
	 * 获得最热门标签
	 * @param start
	 * @param count
	 * @return
	 */
	public List<AtomLabel> getHotAtomLabel(int start, int count);
	/** 获得热门标签总数 */
	public int getHotAtomLabelCount();
	
	/**
	 * 对于点击搜索的标签，增加count，其文章Id为0
	 * @param content
	 * @param count
	 * @return
	 */
	public int increaseCountByContent(String content,int count);
	
	public List<String> getDistinctContent();

	public List<String> getDistinctContentByLike(String label);

	/**
	 * 获得最热标签，排出指定的内容
	 * @param start
	 * @param count
	 * @param notIn
	 * @return
	 */
	public List<AtomLabel> getHotAtomLabel(int start, int count, String notIn);

	
}
