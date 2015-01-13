package com.cc.cw.web;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.RemarkArticle;

public class RemarkArticleTransaction extends ArticleTransaction<RemarkArticle>{
	protected final Log log = LogFactory.getLog(getClass());
	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) {
		
	
		
		String articleId = request.getParameter("articleId");
		String authorId = request.getParameter("authorId");
		Member member = (Member)request.getSession().getAttribute("member");
		String content = request.getParameter("content");
		try{
			if(articleId == null || articleId.equals("")){
				log.info("articleId is null");
				response.sendRedirect(request.getContextPath()+"/jsp/rumour.jsp?id="+articleId);
				return ;
			}else if(authorId == null || authorId.equals("")){
				log.info("authorId is null");
				response.sendRedirect(request.getContextPath()+"/jsp/rumour.jsp?id="+articleId);
				return ;
			}else if(member == null){
				log.info("member is null");
				response.sendRedirect(request.getContextPath()+"/jsp/rumour.jsp?id="+articleId);
				return ;
			}else if(content == null || content.equals("")){
				log.info("content is null");
				response.sendRedirect(request.getContextPath()+"/jsp/rumour.jsp?id="+articleId);
				return ;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		int memberId = member.getId();
		RemarkArticle article = new RemarkArticle();
		article.setMemberId(memberId);
		article.setArticleId(Integer.parseInt(articleId));
		article.setId(RemarkArticleTransaction.remarkArticleService.add(article));
		
		String currentPath=uploadDir + authorId + "/" + articleId +  "/temp/";
		String currentDirPath= currentPath;//this.getRealPath(currentPath);
		File file = new File(currentDirPath);
		file.renameTo(new File(currentDirPath.replaceAll("temp", article.getId()+"")));
		content = content.replace(uploadDir + authorId + "/" + articleId +  "/temp/", uploadDir + authorId + "/" + articleId +"/"+article.getId()+"/");
		
		article.setContent(content);
		remarkArticleService.update(article);
		request.setAttribute("content", content);
		
		try {
			response.sendRedirect(request.getContextPath()+"/jsp/rumour.jsp?id="+articleId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
