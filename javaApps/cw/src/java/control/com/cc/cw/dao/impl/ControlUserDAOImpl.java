package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.ControlUserDAO;
import com.cc.cw.domain.ControlUser;

public class ControlUserDAOImpl extends SqlMapClientDaoSupport implements
		ControlUserDAO {

	public void delete(int id) {
		this.getSqlMapClientTemplate().delete("controlUser.delete",
				new Integer(id));
	}

	public ControlUser getUserByAccount(String account) {
		return (ControlUser) getSqlMapClientTemplate().queryForObject(
				"controlUser.getUserByAccount", account);
	}

	public ControlUser getUserById(int id) {
		return (ControlUser) getSqlMapClientTemplate().queryForObject(
				"controlUser.getUserById", new Integer(id));
	}

	public int getUserCount() {
		Integer i = (Integer) getSqlMapClientTemplate().queryForObject(
				"controlUser.getUserCount", null);
		return i.intValue();
	}

	@SuppressWarnings("unchecked")
	public List<ControlUser> getUserList(int start, int num) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", new Integer(start));
		map.put("num", new Integer(num));
		return getSqlMapClientTemplate().queryForList("controlUser.getUserList", map);
	}

	@SuppressWarnings("unchecked")
	public void save(ControlUser user) {
		HashMap map = new HashMap();
		map.put("id", new Integer(user.getId()));
		map.put("account", user.getAccount());
		map.put("password", user.getPassword());
		map.put("createTime", user.getCreateTime());
		map.put("role", user.getRole());
		map.put("level", new Integer(user.getLevel()));
		if(user.getId() > 0){
			//update
			getSqlMapClientTemplate().update("controlUser.update", map);
		} else {
			//insert
			getSqlMapClientTemplate().insert("controlUser.insert", map);
		}
	}

}
