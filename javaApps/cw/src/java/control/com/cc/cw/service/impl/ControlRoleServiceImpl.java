package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.ControlRoleDAO;
import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;
import com.cc.cw.service.ControlRoleService;

public class ControlRoleServiceImpl implements ControlRoleService {

	private ControlRoleDAO croleDAO;

	public boolean delete(int id) {
		croleDAO.delete(id);
		return true;
	}

	public int getRoleCount() {
		return croleDAO.getRoleCount();
	}

	public List<ControlRole> getRoleList() {
		return croleDAO.getRoleList();
	}

	public List<ControlRole> getRoleList(ControlUser user) {
		return croleDAO.getRoleList(user);
	}

	public List<ControlRole> getRoleList(int start, int count) {
		return croleDAO.getRoleList(start, count);
	}

	public boolean save(ControlRole role) {
		croleDAO.save(role);
		return true;
	}

	public ControlRoleDAO getCroleDAO() {
		return croleDAO;
	}

	public void setCroleDAO(ControlRoleDAO croleDAO) {
		this.croleDAO = croleDAO;
	}

	public ControlRole getRoleByValue(String role) {
		return croleDAO.getRoleByValue(role);
	}

}
