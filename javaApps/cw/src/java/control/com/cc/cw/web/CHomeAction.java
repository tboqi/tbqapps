package com.cc.cw.web;

public class CHomeAction extends CMyAction {
	private static final long serialVersionUID = 1L;

	@Override
	public String doExecute() {
		if (!checkLogin())
			return "clogin";
		return SUCCESS;
	}
}
