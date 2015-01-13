package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.Label;

public interface LabelService {
	
	public Label get(int id);
	
	public int add(Label label);
	
	public boolean update(Label label);
	
	public boolean remove(int id);
	
	public List<Label> getByArticleId(int articleId);
	
	/**
	 * 得到所有标签
	 * @return List<Label>
	 */
	public List<Label> getAllLabels();
	
	/**
	 * 查询所有大于参数ID的新增的标签
	 * @param id
	 * @return List<Label> 
	 */
	public List<Label> getNewLabels(int id);
	
	/**
	 * 查询是否有大于参数ID的新增标签
	 * @param id
	 * @return boolean
	 */
	public boolean havaNewLabels(int id);
	
	/**
	 * 根据id，获得此文章的所有标签content
	 * @param articleId
	 * @return
	 */
	public List<String> getContentByArticleId(int articleId);
	
	/**
	 * 根据articleId memberId，获得此文章的所有标签content
	 * @param articleId
	 * @param memberId
	 * @return
	 */
	public List<String> getContentByArticleIdMemberId(int articleId,int memberId);
	
	public List<Label> search(String key,int page,int count);

	public int searchCount(String key);
}
