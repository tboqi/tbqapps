package com.yuqi.blog.utils;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

public abstract class BaseFormController extends SimpleFormController {
	@Override
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(String.class,
				new StringTrimmerEditor(false));
	}

	protected ModelAndView showForm(HttpServletRequest request,
			HttpServletResponse response, BindException errors)
			throws Exception {
		ModelAndView mav = showForm(request, response, errors, null);
		mav.addObject("pageTitle", pageTitle());
		mav.addObject("command", fetchCommand(request));
		mav.addAllObjects(allObjects(request));
		return mav;
	}

	public abstract Map<String, Object> allObjects(HttpServletRequest request);

	public ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws ServletException {
		doSubmit(request, response, command);
		ModelAndView mav = new ModelAndView(new RedirectView(getSuccessView()));
		return mav;
	}

	protected abstract String pageTitle();

	protected abstract void doSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command);

	protected abstract Object fetchCommand(HttpServletRequest request)
			throws Exception;
}
