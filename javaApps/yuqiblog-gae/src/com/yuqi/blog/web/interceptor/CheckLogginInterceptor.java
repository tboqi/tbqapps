package com.yuqi.blog.web.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yuqi.blog.domain.User;
import com.yuqi.blog.service.UserService;
import com.yuqi.blog.utils.SecurityUtils;

public class CheckLogginInterceptor extends HandlerInterceptorAdapter {
	private UserService userService;
	protected final Log logger = LogFactory.getLog(getClass());

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser != null && loggedUser.getId().intValue() > 0) {
			return true;
		} else {
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (StringUtils.equals(cookie.getName(), "userauth")) {
					if (StringUtils.isNotEmpty(cookie.getValue())) {
						String userauth = SecurityUtils.decode(cookie
								.getValue());
						String[] ua = StringUtils.split(userauth, '|');
						User user = userService.getByUsername(ua[0]);
						if (user != null
								&& StringUtils.equals(SecurityUtils.md5(user
										.getPassword()), ua[1])) {
							HttpSession httpSession = request.getSession();
							httpSession.setAttribute("loggedUser", SecurityUtils.encode(userauth));
							cookie.setMaxAge(3600 * 30);
							return true;
						}
					}
					break;
				}
			}
		}
		session.setAttribute("oldUrl", request.getRequestURL());
		response.sendRedirect("/message.htm?msg=unloggedIn");
		return false;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}
}
