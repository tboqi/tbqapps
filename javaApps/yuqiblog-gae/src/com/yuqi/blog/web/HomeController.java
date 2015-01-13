package com.yuqi.blog.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yuqi.blog.domain.Article;
import com.yuqi.blog.service.ArticleService;
import com.yuqi.blog.service.UserService;
import com.yuqi.blog.utils.BaseAbstractController;
import com.yuqi.blog.utils.Pagination;

public class HomeController extends BaseAbstractController {

	private UserService userService;
	private ArticleService articleService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}

	@Override
	public Map<String, Object> allObjects(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Article> list = articleService.find(1, 10);
		Pagination pagination = new Pagination(1, 10, articleService.count(), list, "/articleList.htm");
		map.put("pagination", pagination);
		return map;
	}

	@Override
	public String pageTitle() {
		return "首页";
	}

	@Override
	public String viewName() {
		return "index";
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

}
