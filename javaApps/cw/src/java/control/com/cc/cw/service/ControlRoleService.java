package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;

public interface ControlRoleService {

	public List<ControlRole> getRoleList();

	public List<ControlRole> getRoleList(ControlUser user);

	public List<ControlRole> getRoleList(int start, int num);

	public int getRoleCount();

	public boolean delete(int id);

	public boolean save(ControlRole role);

	public ControlRole getRoleByValue(String role);
}
