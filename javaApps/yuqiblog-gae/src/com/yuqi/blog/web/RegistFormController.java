package com.yuqi.blog.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuqi.blog.domain.User;
import com.yuqi.blog.service.UserService;
import com.yuqi.blog.utils.BaseFormController;

public class RegistFormController extends BaseFormController {

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}

	@Override
	protected String pageTitle() {
		return "注册";
	}

	@Override
	protected void doSubmit(HttpServletRequest request, HttpServletResponse response, Object command) {
		User user = (User) command;
		user = userService.save(user);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loggedUser", user);
	}

	@Override
	protected Object fetchCommand(HttpServletRequest request) throws Exception {
			return getCommand(request);
	}

	@Override
	public Map<String, Object> allObjects(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
}
