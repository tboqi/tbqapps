package com.cc.cw.web;

import java.util.ArrayList;
import java.util.List;

import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;
import com.cc.cw.service.ControlRoleService;

public class CMenuAction extends CMyAction {
	private static final long serialVersionUID = 1L;

	private ControlRoleService croleService;

	private List<ControlRole> list = new ArrayList<ControlRole>();

	@Override
	public String doExecute() {
		if (!checkLogin())
			return LOGIN;
		ControlUser cuser = getCUserFromSession();
		if (cuser.getLevel() == 1) {
			list = croleService.getRoleList();
		} else {
			list = croleService.getRoleList(cuser);
		}
		return SUCCESS;
	}

	public ControlRoleService getCroleService() {
		return croleService;
	}

	public void setCroleService(ControlRoleService croleService) {
		this.croleService = croleService;
	}

	public List<ControlRole> getList() {
		return list;
	}

	public void setList(List<ControlRole> list) {
		this.list = list;
	}
}
