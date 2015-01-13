package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.LabelDAO;
import com.cc.cw.domain.Label;

public class LabelDAOImpl extends SqlMapClientDaoSupport implements LabelDAO{

	public Label get(int id) {
		return (Label)this.getSqlMapClientTemplate().queryForObject("label.get", id);
	}
 
	@SuppressWarnings("unchecked")
	public List<Label> getByArticleId(int articleId) {
		return (List<Label>)this.getSqlMapClientTemplate().queryForList("label.getByArticleId",articleId);
	}

	public int add(Label label) {
		return (Integer)this.getSqlMapClientTemplate().insert("label.insert", label);
	}

	public int remove(int id) {
		return 0;
	}

	public int update(Label label) {
		return this.getSqlMapClientTemplate().update("label.update", label);
	}
	
	public Label getByArticleIdMemberId(int articleId,int memberId){
		Label label = null;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("articleId", articleId);
		map.put("memberId", memberId);
		label = (Label)this.getSqlMapClientTemplate().queryForObject("label.getByArticleIdMemberId", map);
		return label;
	}

	public int countNewLabels(int id) {
		return (Integer)this.getSqlMapClientTemplate().queryForObject("label.countNewLabels", id);
	}

	@SuppressWarnings("unchecked")
	public List<Label> getAllLabels() {
		return (List<Label>)this.getSqlMapClientTemplate().queryForList("label.getAllLabels",null);
	}

	@SuppressWarnings("unchecked")
	public List<Label> getNewLabels(int id) {
		return (List<Label>)this.getSqlMapClientTemplate().queryForList("label.getNewLabels",id);
	}

	@SuppressWarnings("unchecked")
	public List<Label> search(String key, int start, int count) {
		Map map = new HashMap();
		map.put("key", key);
		map.put("start", start);
		map.put("count", count);
		return (List<Label>)this.getSqlMapClientTemplate().queryForList("label.searchLabel",map);
	}

	public int searchCount(String key) {
		Object obj = this.getSqlMapClientTemplate().queryForObject("label.searchLabelCount", key);
		int i = 0;
		if(obj != null){
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

}
