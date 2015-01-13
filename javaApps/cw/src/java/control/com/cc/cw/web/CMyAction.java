package com.cc.cw.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cc.cw.domain.ControlUser;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

public abstract class CMyAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String message;
	public static final String LIST = "list";
	public static final String EDIT = "edit";

	public String execute() throws Exception {
		return doExecute();
	}

	public abstract String doExecute();

	protected ControlUser getCUserFromSession() {
		Map map = getSessionMap();
		if (!map.containsKey("cuser")) {
			return null;
		}
		return (ControlUser) map.get("cuser");
	}

	protected boolean checkLogin() {
		ControlUser cuser = getCUserFromSession();
		if (cuser == null)
			return false;
		if (cuser.getLevel() == 0 && cuser.getRole().trim().length() < 1)
			return false;
		return true;
	}

	protected Map getContextMap() {
		return ActionContext.getContext().getContextMap();
	}
	protected HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	protected HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}

	protected Map getSessionMap() {
		Map map = ActionContext.getContext().getSession();
		return map;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
