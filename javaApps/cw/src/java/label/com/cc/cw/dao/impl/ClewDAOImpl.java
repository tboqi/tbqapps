package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.ClewDAO;
import com.cc.cw.domain.Clew;

public class ClewDAOImpl extends SqlMapClientDaoSupport implements ClewDAO {

	public int add(Clew clew) {
		return (Integer)this.getSqlMapClientTemplate().insert("clew.insert", clew);
	}

	public Clew get(int id) {
		return (Clew)this.getSqlMapClientTemplate().queryForObject("clew.get", id);
	}

	@SuppressWarnings("unchecked")
	public List<Clew> getByTitle(String title,int start,int count) {
		Map map = new HashMap();
		map.put("title", title);
		map.put("start", start);
		map.put("count", count);
		return (List<Clew>)this.getSqlMapClientTemplate().queryForList("clew.getByTitle", map);
	}
	
	public int getCountByTitle(String title){
		int count = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject("clew.getCountByTitle", title);
		if(obj != null)
			count = (Integer)obj;
		return count;
		
	}

	@SuppressWarnings("unchecked")
	public List<Clew> getByKey(String title) {
		return (List<Clew>)this.getSqlMapClientTemplate().queryForObject("clew.getByKey", title);
	}

}
