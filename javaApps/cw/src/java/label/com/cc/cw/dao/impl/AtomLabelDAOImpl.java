package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.AtomLabelDAO;
import com.cc.cw.domain.AtomLabel;

public class AtomLabelDAOImpl extends SqlMapClientDaoSupport implements AtomLabelDAO {

	public int add(AtomLabel atomLabel) {
		int id = 0;
		Object obj = this.getSqlMapClientTemplate().insert("atomLabel.insert", atomLabel);
		if(obj != null)
			id = (Integer)obj;
		return id;
	}

	public int delete(int id) {
		return this.getSqlMapClientTemplate().delete("atomLabel.delete", id);
	}

	public AtomLabel getById(int id) {
		return (AtomLabel)this.getSqlMapClientTemplate().queryForObject("atomLabel.getById", id);
	}


	public int update(AtomLabel atomLabel) {
		return this.getSqlMapClientTemplate().update("atomLabel.update", atomLabel);
	}
	
	@SuppressWarnings("unchecked")
	public int increaseCountByContentArticleId(String content,int articleId, int count){
		Map map = new HashMap();
		map.put("content", content);
		map.put("articleId", articleId);
		map.put("count", count);
		return this.getSqlMapClientTemplate().update("atomLabel.increaseCountByContentArticleId", map);
	}

	@SuppressWarnings("unchecked")
	public boolean exists(String content,int articleId){
		Map map = new HashMap();
		map.put("articleId", articleId);
		map.put("content", content);
		return getSqlMapClientTemplate().queryForObject("atomLabel.exists", map) == null ? false : true;
	}

	@SuppressWarnings("unchecked")
	public List<AtomLabel> getHotAtomLabel(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		return getSqlMapClientTemplate().queryForList("atomLabel.getHotAtomLabel", map);
	}
	
	/** 获得热门标签总数 */
	public int getHotAtomLabelCount(){
		int count = 0;
		Object obj = getSqlMapClientTemplate().queryForObject("atomLabel.getHotAtomLabelCount", null);
		if(obj != null)
			count = (Integer)obj;
		return count;
	}
	
	public int increaseCountByContent(String content,int count){
		return increaseCountByContentArticleId(content,0,count);
	}

	@SuppressWarnings("unchecked")
	public List<String> getDistinctContent() {
		return getSqlMapClientTemplate().queryForList("atomLabel.getDistinctContent", null);
	}

	@SuppressWarnings("unchecked")
	public List<String> getDistinctContentByLike(String label) {
		return getSqlMapClientTemplate().queryForList("atomLabel.getDistinctContentByLike", label);
	}

	@SuppressWarnings("unchecked")
	public List<AtomLabel> getHotAtomLabel(int start, int count, String notIn) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("notIn", notIn);
		return getSqlMapClientTemplate().queryForList("atomLabel.getHotAtomLabelNotIn", map);
	}
	
}
