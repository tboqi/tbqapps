package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.ChannelCategoryDAO;
import com.cc.cw.domain.ChannelCategory;

public class ChannelCategoryDAOImpl extends SqlMapClientDaoSupport implements ChannelCategoryDAO {
    private SqlMapClientTemplate smct=this.getSqlMapClientTemplate();
	public int add(ChannelCategory cc) {
		String content=cc.getContent();
		int id = 0;
		if(getByContent(content) == null ? false : true){
			id=this.increaseCountByContent(content, 1);
		}else{
			Object obj = this.smct.insert("channelcategory.add", cc);
			if(obj != null){
				id = (Integer)obj;
			}
		}
		return id;
	}

	public int delete(int id) {
		return this.smct.delete("channelcategory.delete", id);
	}

	public ChannelCategory getById(int id) {
		return (ChannelCategory)this.smct.queryForObject("channelcategory.getById", id);
	}
	/**
	 * 根据传入的字段名,id,增加给定的value值
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	
	private int increaseFieldValueByContent(String content,String field, Object value){
		Map<String ,Object> map = new HashMap<String , Object>();
		map.put("content", content);
		map.put("field", field);
		map.put("value", value);
		return this.getSqlMapClientTemplate().update("channelcategory.increaseFieldValueByContent", map);
	}
	
	public int increaseCountByContent(String content,int count){
		return this.increaseFieldValueByContent(content, "Count", count);
	}
	
	public ChannelCategory getByContent(String content){
		ChannelCategory cc=(ChannelCategory)this.smct.queryForObject("channelcategory.getByContent", content);
		return cc;
	}
	
	public int updateFieldValueByContent(String content,String field, Object value){
		Map<String ,Object> map = new HashMap<String , Object>();
		map.put("content", content);
		map.put("field", field);
		map.put("value", value);
		return this.smct.update("channelcategory.updateFieldValueByContent", map);
	}

	@SuppressWarnings("unchecked")
	public List<ChannelCategory> getAllChannelCategorys(Integer currentPageNum,Integer rowsPerPage){
		Map<String ,Integer> map = new HashMap<String , Integer>();
		map.put("currentPageNum", currentPageNum);
		map.put("rowsPerPage", rowsPerPage);
		return  this.smct.queryForList("channelcategory.getAllChannelCategorys", map);	
	}
	
	public int getRowsNum(){
		return (Integer)this.smct.queryForObject("channelcategory.getRowsNum", null);	
	}

}
