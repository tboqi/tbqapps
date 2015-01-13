package com.yuqi.blog.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yuqi.blog.domain.Category;
import com.yuqi.blog.service.CategoryService;
import com.yuqi.blog.utils.BaseFormController;

public class CategoryFormController extends BaseFormController {

	private CategoryService categoryService;
	protected final Log logger = LogFactory.getLog(getClass());

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	@Override
	protected void doSubmit(HttpServletRequest request, HttpServletResponse response, Object command) {
		Category category = (Category) command;
		categoryService.save(category);
	}

	@Override
	protected String pageTitle() {
		return "发布文章";
	}

	@Override
	protected Object fetchCommand(HttpServletRequest request) throws Exception {
		Object id = request.getParameter("id");
		if (id == null) {
			return getCommand(request);
		} else
			return categoryService.get(new Long((String) id));
	}

	@Override
	public Map<String, Object> allObjects(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
