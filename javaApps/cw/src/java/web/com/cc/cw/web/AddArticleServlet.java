package com.cc.cw.web;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddArticleServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6698317648235115800L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		ArticleTransaction.process(this.getServletContext(), request, response);
		
	}
	
	public void doGet(HttpServletRequest request , HttpServletResponse response){
		doPost(request,response);
	}
	
}
