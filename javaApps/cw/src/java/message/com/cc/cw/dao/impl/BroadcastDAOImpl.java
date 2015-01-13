package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.BroadcastDAO;
import com.cc.cw.domain.Broadcast;

public class BroadcastDAOImpl extends SqlMapClientDaoSupport implements
		BroadcastDAO {

	public int add(Broadcast broadcast) {
		return (Integer) this.getSqlMapClientTemplate().insert(
				"broadcast.addBroadcast", broadcast);
	}

	@SuppressWarnings("unchecked")
	public List<Broadcast> getBroadcastOrderByDate(int start, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("count", count);
		return (List<Broadcast>) this.getSqlMapClientTemplate().queryForList(
				"broadcast.getBroadcastOrderByDate", map);
	}

	@SuppressWarnings("unchecked")
	public List<Broadcast> getBroadcastOrderByDate(String fieldName,
			String key, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fieldName", fieldName);
		map.put("key", key);
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return (List<Broadcast>) this.getSqlMapClientTemplate().queryForList(
				"broadcast.findByField", map);
	}

	@SuppressWarnings("unchecked")
	public List<Broadcast> getBroadcastOrderByDate(Map<String, Object> map1,
			int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.putAll(map1);
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return (List<Broadcast>) this.getSqlMapClientTemplate().queryForList(
				"broadcast.findByDate", map);
	}

	public int getCount(String fieldName, String key) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fieldName", fieldName);
		map.put("key", key);
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"broadcast.getCountByField", map);
	}

	public int getCount(Map<String, Object> map1) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.putAll(map1);
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"broadcast.getCountByDate", map);
	}

	public int getCount() {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"broadcast.getCount", null);
	}

	public void deleteByIds(String ids) {
		getSqlMapClientTemplate().delete("broadcast.deleteByIds", ids);
	}

	public Broadcast get(int id) {
		return (Broadcast) getSqlMapClientTemplate().queryForObject("broadcast.get", new Integer(id));
	}

}
