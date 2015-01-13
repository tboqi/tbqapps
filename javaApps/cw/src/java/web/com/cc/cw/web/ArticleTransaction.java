package com.cc.cw.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Article;
import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ArticleService;

public abstract class ArticleTransaction<T extends Article> {

	protected static String uploadDir = CwConfiguration.create().get("upload.dir");
	
	protected static ArticleService<SimpleArticle> simpleArticleService;
	protected static ArticleService<RemarkArticle> remarkArticleService;

	private static ServletContext servletContext;

	public abstract void process(HttpServletRequest request, HttpServletResponse response);
	
	public static void process(ServletContext ctx,HttpServletRequest request, HttpServletResponse response){
		servletContext = ctx;
		String type = request.getParameter("type");
		
		initArticleService();
		if(type == null || type.equals("")){
			new SimpleArticleTransaction().process(request, response);
		}else if(type.equals("remark")){
			new RemarkArticleTransaction().process(request, response);
		}
	}	
	
	public String getRealPath(String path){
		return servletContext.getRealPath(path);
	}
	
	
	@SuppressWarnings("unchecked")
	public static void initArticleService(){
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		simpleArticleService = (ArticleService<SimpleArticle>)ctx.getBean("simpleArticleService");
		remarkArticleService = (ArticleService<RemarkArticle>)ctx.getBean("remarkArticleService");
	}
	
}
