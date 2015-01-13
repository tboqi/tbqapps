package com.yuqi.blog.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yuqi.blog.service.ArticleService;
import com.yuqi.blog.utils.BaseAbstractController;

public class ArticleViewController extends BaseAbstractController {

	private ArticleService articleService;

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	@Override
	public Map<String, Object> allObjects(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long id = new Long((String)request.getParameter("id"));
		map.put("article", articleService.get(id));
		return map;
	}

	@Override
	public String pageTitle() {
		return "文章列表";
	}

	@Override
	public String viewName() {
		return "articleView";
	}
}
