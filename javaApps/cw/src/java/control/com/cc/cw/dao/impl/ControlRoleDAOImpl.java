package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.ControlRoleDAO;
import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;

public class ControlRoleDAOImpl extends SqlMapClientDaoSupport implements
		ControlRoleDAO {

	public void delete(int id) {
		this.getSqlMapClientTemplate().delete("controlRole.delete",
				new Integer(id));
	}

	@SuppressWarnings("unchecked")
	public List<ControlRole> getRoleList(int start, int count) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return this.getSqlMapClientTemplate().queryForList(
				"controlRole.getRoleList", map);
	}

	@SuppressWarnings("unchecked")
	public List<ControlRole> getRoleList(ControlUser user) {
		if (user == null)
			return null;
		int id = user.getId();
		if (id <= 0)
			return null;
		if (user.getRole() == null || user.getRole().trim() == "")
			return null;

		return this.getSqlMapClientTemplate().queryForList(
				"controlRole.getRoleListByUser", user.getRole());
	}

	@SuppressWarnings("unchecked")
	public List<ControlRole> getRoleList() {
		return this.getSqlMapClientTemplate().queryForList(
				"controlRole.getRoleListByAll", null);
	}

	@SuppressWarnings("unchecked")
	public void save(ControlRole role) {
		int id = role.getId();
		String name = role.getName();
		String value = role.getValue();
		int viewOrder = role.getViewOrder();
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("value", value);
		map.put("id", new Integer(id));
		map.put("viewOrder", new Integer(viewOrder));
		if (id > 0) {
			// update
			this.getSqlMapClientTemplate().update("controlRole.update", map);
		} else {
			// insert
			this.getSqlMapClientTemplate().insert("controlRole.insert", map);
		}
	}

	public int getRoleCount() {
		Integer i = (Integer) getSqlMapClientTemplate().queryForObject(
				"controlRole.getRoleCount", null);
		return i.intValue();
	}

	public ControlRole getRoleByValue(String role) {
		return (ControlRole) getSqlMapClientTemplate().queryForObject(
				"controlRole.getRoleByValue", role);
	}

}
