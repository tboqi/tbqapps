package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.ControlUserDAO;
import com.cc.cw.domain.ControlUser;
import com.cc.cw.service.ControlUserService;

public class ControlUserServiceImpl implements ControlUserService {

	private ControlUserDAO cuserDAO;

	public boolean delete(int id) {
		cuserDAO.delete(id);
		return true;
	}

	public ControlUser getById(int id) {
		return cuserDAO.getUserById(id);
	}

	public int getUserCount() {
		return cuserDAO.getUserCount();
	}

	public List<ControlUser> getUserList(int start, int num) {
		return cuserDAO.getUserList(start, num);
	}

	public boolean save(ControlUser user) {
		cuserDAO.save(user);
		return true;
	}

	public ControlUser userLogin(String account, String password) {
		ControlUser user = cuserDAO.getUserByAccount(account);
		if (user == null)
			return null;
		if (password != null && password.equals(user.getPassword()))
			return user;
		return null;
	}

	public ControlUserDAO getCuserDAO() {
		return cuserDAO;
	}

	public void setCuserDAO(ControlUserDAO cuserDAO) {
		this.cuserDAO = cuserDAO;
	}

	public ControlUser getUserByAccount(String account) {
		ControlUser user = cuserDAO.getUserByAccount(account);
		return user;
	}

}
