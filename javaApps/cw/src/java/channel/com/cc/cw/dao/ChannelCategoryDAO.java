package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.ChannelCategory;

public interface ChannelCategoryDAO {

	public ChannelCategory getById(int id);
	
	public int add(ChannelCategory cc);
	
	public int delete(int id); 
	
	public int updateFieldValueByContent(String content,String field, Object value);
	
	public ChannelCategory getByContent(String content);
	 
	public int increaseCountByContent(String content,int count);
	
	public int getRowsNum();
	
	public List getAllChannelCategorys(Integer currentPageNum,Integer rowsPerPage);
	
}
