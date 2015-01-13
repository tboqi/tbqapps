package com.cc.cw.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;
import com.cc.cw.service.ControlRoleService;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

public class CheckRoleInterceptor implements Interceptor {
	private static final long serialVersionUID = 1L;

	private ControlRoleService croleService;

	public void destroy() {
	}

	public void init() {
	}

	public ControlRoleService getCroleService() {
		return croleService;
	}

	public void setCroleService(ControlRoleService croleService) {
		this.croleService = croleService;
	}

	public String intercept(ActionInvocation invo) throws Exception {
		Map sesMap = ActionContext.getContext().getSession();
		Map contextMap = ActionContext.getContext().getContextMap();
		// HttpServletRequest request = ServletActionContext.getRequest();
		// HttpServletResponse response = ServletActionContext.getResponse();

		ControlUser cuser = (ControlUser) sesMap.get("cuser");
		if (cuser == null)
			return "clogin";
		if (cuser.getLevel() == 1)
			return invo.invoke();
		String role = "/cc/"
				+ (String) contextMap.get(ActionContext.ACTION_NAME)
				+ ".action";
		ControlRole crole = croleService.getRoleByValue(role);
		List<ControlRole> croles = croleService.getRoleList(cuser);
		for (Iterator iter = croles.iterator(); iter.hasNext();) {
			ControlRole element = (ControlRole) iter.next();
			if (element.getId() == crole.getId()) {
				return invo.invoke();
			}
		}
		return "clogin";
	}

}
