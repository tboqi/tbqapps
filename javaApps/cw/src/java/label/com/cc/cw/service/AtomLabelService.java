package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.AtomLabel;

public interface AtomLabelService {
	
	public int add(AtomLabel atomLabel);
	
	public AtomLabel getById(int id);
	
	public boolean delete(int id);
	
	/**
	 * 根据内容增加标签引用次数
	 * @param content
	 * @param count
	 * @return
	 */
	public boolean increaseCountByContent(String content, int count);
	
	public boolean increaseCountByContentArticleId(String content,int articleId, int count);
	
	
	/**
	 * 获得最热门标签
	 * @param page
	 * @param count
	 * @return
	 */
	public List<AtomLabel> getHotAtomLabel(int page,int count);
	/** 获得热门标签总数 */
	public int getHotAtomLabelCount();
	
	public List<String> getDistinctContent();
	
	public List<String> getDistinctContentByLike(String label);

	/**
	 * 获得最热标签，排出指定的内容
	 * @param page
	 * @param count
	 * @param notIn
	 * @return
	 */
	public List<AtomLabel> getHotAtomLabel(int page, int count, String notIn);

}
