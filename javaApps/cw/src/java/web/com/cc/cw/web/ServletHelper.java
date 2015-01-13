package com.cc.cw.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ServletHelper {

	private static Log log = LogFactory.getLog(ServletHelper.class);
	
	/**
	 * 跳转到错误页面
	 * @param request
	 * @param response
	 * @param errorMsg
	 */
	public static void sendToErrorPage(HttpServletRequest request,HttpServletResponse response,String errorMsg){
		try {
			response.sendRedirect(request.getContextPath()+"/jsp/error.jsp?errorMsg="+errorMsg);
			return;
		} catch (IOException e1) {
			log.error("send reedirect error ");
			e1.printStackTrace();
		}
	}
	public static void sendToInfoPage(HttpServletRequest request,HttpServletResponse response,String infoMsg){
		try {
			response.sendRedirect(request.getContextPath()+"/jsp/info.jsp?infoMsg=" + infoMsg);
			return;
		} catch (IOException e1) {
			log.error("send reedirect error ");
			e1.printStackTrace();
		}
	}
	
	
}
