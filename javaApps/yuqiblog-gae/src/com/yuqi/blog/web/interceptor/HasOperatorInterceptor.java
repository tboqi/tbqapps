package com.yuqi.blog.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yuqi.blog.service.UserService;

public class HasOperatorInterceptor extends HandlerInterceptorAdapter {
	protected final Log logger = LogFactory.getLog(getClass());
	private UserService userService;

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if (userService.hasOperater()) {
			return true;
		} else {
			response.sendRedirect("/regist.htm");
			return false;
		}
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}

}
