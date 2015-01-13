package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;

public interface ControlRoleDAO {
	public void delete(int id);
	public void save(ControlRole role);
	public List<ControlRole> getRoleList(int start, int count);
	public List<ControlRole> getRoleList(ControlUser user);
	public List<ControlRole> getRoleList();
	public int getRoleCount();
	public ControlRole getRoleByValue(String role);
}
