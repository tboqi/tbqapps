package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.ControlUser;

public interface ControlUserDAO {

	public ControlUser getUserById(int id);
	public ControlUser getUserByAccount(String account);
	public void save(ControlUser user);
	public void delete(int id);
	public List<ControlUser> getUserList(int start, int num);
	public int getUserCount();
}
