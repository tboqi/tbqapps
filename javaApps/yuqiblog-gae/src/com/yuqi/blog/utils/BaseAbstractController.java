package com.yuqi.blog.utils;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.yuqi.blog.domain.User;

public abstract class BaseAbstractController extends AbstractController {
	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView(viewName());
		mav.addAllObjects(allObjects(request));

		User loggedUser = (User) request.getSession()
				.getAttribute("loggedUser");
		mav.addObject("loggedUser", loggedUser);
		mav.addObject("pageTitle", pageTitle());
		return mav;
	}

	public abstract String viewName();

	public abstract String pageTitle();

	public abstract Map<String, Object> allObjects(HttpServletRequest request);
}
