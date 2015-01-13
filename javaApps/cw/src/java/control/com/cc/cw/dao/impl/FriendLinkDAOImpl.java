package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.FriendLinkDAO;
import com.cc.cw.domain.FriendLink;

public class FriendLinkDAOImpl extends SqlMapClientDaoSupport implements
		FriendLinkDAO {

	public void delete(int id) {
		getSqlMapClientTemplate().delete("friendLink.delete", new Integer(id));
	}

	public int getCount() {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"friendLink.getCount", null);
	}

	public int getCount(String condition) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"friendLink.getCount", condition);
	}

	@SuppressWarnings("unchecked")
	public List<FriendLink> getLink(int start, int num) {
		HashMap map = new HashMap();
		map.put("start", new Integer(start));
		map.put("num", new Integer(num));
		return (List<FriendLink>) getSqlMapClientTemplate().queryForList(
				"friendLink.getLink", map);
	}

	@SuppressWarnings("unchecked")
	public List<FriendLink> getLink(String condition, int start, int num) {
		HashMap map = new HashMap();
		map.put("start", new Integer(start));
		map.put("num", new Integer(num));
		map.put("condition", condition);
		return (List<FriendLink>) getSqlMapClientTemplate().queryForList(
				"friendLink.getLinkByCondition", map);
	}

	public void insert(FriendLink link) {
		getSqlMapClientTemplate().insert("friendLink.insert", link);
	}

	public void update(FriendLink link) {
		getSqlMapClientTemplate().insert("friendLink.update", link);
	}

	@SuppressWarnings("unchecked")
	public List<FriendLink> getLink(String condition) {
		return (List<FriendLink>) getSqlMapClientTemplate().queryForList(
				"friendLink.getAllLinkByCondition", condition);
	}

	public FriendLink get(int i) {
return (FriendLink) getSqlMapClientTemplate().queryForObject("friendLink.get", new Integer(i));
	}

}
