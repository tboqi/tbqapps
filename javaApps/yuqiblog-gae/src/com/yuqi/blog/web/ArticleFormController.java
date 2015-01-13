package com.yuqi.blog.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.appengine.api.datastore.Text;
import com.yuqi.blog.domain.Article;
import com.yuqi.blog.service.ArticleService;
import com.yuqi.blog.service.CategoryService;
import com.yuqi.blog.utils.BaseFormController;
import com.yuqi.blog.web.command.ArticleCommand;

public class ArticleFormController extends BaseFormController {

	private ArticleService articleService;
	private CategoryService categoryService;
	protected final Log logger = LogFactory.getLog(getClass());

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public ArticleService getArticleService() {
		return articleService;
	}

	@Override
	protected void doSubmit(HttpServletRequest request, HttpServletResponse response, Object command) {
		Object id = request.getParameter("id");
		ArticleCommand articleCommand = (ArticleCommand) command;
		if(articleCommand.getCategoryId() == null) {
			articleCommand.setCategoryId(0L);
		}
		Article article;
		if (id == null) {
			article = articleCommand.toArticle();
			article.setCreateTime(new Date());
		} else {
			article = articleService.get(new Long((String) id));
			article.setContent(new Text(articleCommand.getContent()));
			article.setTitle(articleCommand.getTitle());
			article.setCategoryId(articleCommand.getCategoryId());
		}
		articleService.save(article);
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
			return articleService.get(new Long((String) id));
	}

	@Override
	public Map<String, Object> allObjects(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categories", categoryService.find());
		return map;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

}
