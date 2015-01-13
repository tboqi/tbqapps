package com.yuqi.blog.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yuqi.blog.service.CategoryService;
import com.yuqi.blog.utils.BaseAbstractController;

public class CategoryListController extends BaseAbstractController {

	private CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	@Override
	public Map<String, Object> allObjects(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryList", categoryService.find());
		return map;
	}

	@Override
	public String pageTitle() {
		return "分类列表";
	}

	@Override
	public String viewName() {
		return "categoryList";
	}
}
