package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.ControlUser;

public interface ControlUserService {

	public ControlUser userLogin(String account, String password);
	public ControlUser getById(int id);
	public boolean save(ControlUser user);
	public List<ControlUser> getUserList(int start, int num);
	public int getUserCount();
	public boolean delete(int id);
	public Object getUserByAccount(String account);
}
