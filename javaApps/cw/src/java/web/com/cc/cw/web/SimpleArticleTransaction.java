package com.cc.cw.web;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.web.util.URLRewriteManager;

public class SimpleArticleTransaction extends ArticleTransaction<SimpleArticle> {
	protected final Log log = LogFactory.getLog(getClass());

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) {
		
		Member member = (Member) request.getSession().getAttribute("member");
		if(member == null){
			log.info("member is null");
			String errorMsg = "error_member_null";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return;
		}

		//String channelId =request.getParameter("channelId").trim();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String dateTime = request.getParameter("dateTime");
		Date endDate = null;
		
		String errorMsg = "";
		/**
		 * 有效性验证
		 */

		if (!ValidateUtil.checkString(title)) {
			log.info("title is null");
			errorMsg = "error_article_titleNull";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return;
		} else if (!ValidateUtil.checkString(content)) {
			log.info("contnt is null");
			errorMsg = "error_article_contentNull";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return;
		} else if (!ValidateUtil.checkString(dateTime)) {
			log.info("dateTime is null");
			errorMsg = "error_article_createdateNull";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return;
		} else {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate = df.parse(dateTime);
			} catch (ParseException e) {
				log.info("wrong endDate");
				errorMsg = "error_article_createdateNull";
				ServletHelper.sendToErrorPage(request, response, errorMsg);
				return;
			}
			Date today = new Date();
			if (today.getTime() - endDate.getTime() > 0) {
				log.info("wrong endDate");
				errorMsg = "error_article_createdateNull";
				ServletHelper.sendToErrorPage(request, response, errorMsg);
				return;
			}
		}

		int memberId = member.getId();
		SimpleArticle article = new SimpleArticle();
		article.setMemberId(memberId);
		article.setTitle(title);
		article.setContent(content);
		article.setEndDate(endDate);

		//article.setChannelId(Integer.parseInt(channelId));
		article.setId(SimpleArticleTransaction.simpleArticleService.add(article));
		
		String currentPath=uploadDir + memberId + "/" + "temp";
		String currentDirPath= currentPath;//this.getRealPath(currentPath);
		
		File file = new File(currentDirPath);
		file.renameTo(new File(currentDirPath.replaceAll("temp", article
				.getId()
				+ "")));
		content = content.replace(uploadDir + memberId + "/temp/", uploadDir
				+ memberId + "/" + article.getId() + "/");

		article.setContent(content);
		simpleArticleService.update(article);
		request.setAttribute("content", content);

		try {
			response.sendRedirect(URLRewriteManager.getArticleUrl(request.getContextPath(), article.getId()));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
