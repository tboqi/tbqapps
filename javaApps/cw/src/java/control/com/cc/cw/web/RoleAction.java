package com.cc.cw.web;

import java.util.List;

import com.cc.cw.domain.ControlRole;
import com.cc.cw.service.ControlRoleService;

public class RoleAction extends CMyAction {
	private static final long serialVersionUID = 1L;

	private String flag;

	private List<ControlRole> list;

	private ControlRoleService croleService;

	private int cp;

	private Page page;

	@Override
	public String doExecute() {
		// if (flag == null || flag.trim().equals("")
		// || flag.equalsIgnoreCase("list")) {
		if (cp <= 1)
			cp = 1;
		int rowCount = croleService.getRoleCount();
		int rowPerPage = 15;
		page = new Page(cp, rowCount, rowPerPage);
		list = croleService.getRoleList((cp - 1) * rowPerPage, rowPerPage);
		return LIST;
		// }
		// return LIST;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public ControlRoleService getCroleService() {
		return croleService;
	}

	public void setCroleService(ControlRoleService croleService) {
		this.croleService = croleService;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public List<ControlRole> getList() {
		return list;
	}

	public void setList(List<ControlRole> list) {
		this.list = list;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
