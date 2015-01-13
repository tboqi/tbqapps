package com.yuqi.blog.web;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yuqi.blog.domain.User;
import com.yuqi.blog.service.UserService;
import com.yuqi.blog.utils.BaseFormController;
import com.yuqi.blog.utils.SecurityUtils;

public class LoginFormController extends BaseFormController {

	private UserService userService;
	protected final Log logger = LogFactory.getLog(getClass());

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}

	@Override
	protected void doSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command) {
		User user = (User) command;
		user = userService.login(user.getUsername(), user.getPassword());

		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loggedUser", user);
		
		String userauth = user.getUsername() + "|" + SecurityUtils.md5(user.getPassword());
		Cookie cookie = new Cookie("userauth", SecurityUtils.encode(userauth));
		cookie.setMaxAge(3600 * 30);
		response.addCookie(cookie);
	}

	@Override
	protected String pageTitle() {
		return "登录";
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
