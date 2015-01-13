package com.yuqi.blog.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class MessageController extends AbstractController {
	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("message", parseMassagePage(request.getParameter("msg")));
		return mav;
	}

	private Map<String, String> parseMassagePage(String msg) {
		Map<String, String> map = new HashMap<String, String>();
		if (StringUtils.equalsIgnoreCase(msg, "unloggedIn")) {
			map.put("redirectUrl", "/login.htm");
			map.put("message", "没有登录");
			map.put("redirestString", "登录");
		} else {
			map.put("redirectUrl", "/");
			map.put("message", "系统错误");
			map.put("redirestString", "回到首页");
		}
		return map;
	}
}
