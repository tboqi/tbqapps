package com.cc.cw.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Ajax调用分发请求的SERVLET
 * 
 * 
 */
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 6769102337476632794L;
	private static transient Log log = LogFactory.getLog(AjaxServlet.class);
	private static HashMap<String,AjaxProcessor> map = new HashMap<String,AjaxProcessor>();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		AjaxProcessor processor = null;
		String url = request.getRequestURI();
		if((processor = map.get(url)) != null) {
			processor.process(request, response);
		}else {
			log.info("no instance in the map");
			processor = this.getServletInstance(url);
			if (processor != null) {
				processor.process(request, response);
			} else {
				log.error("Can't find matched processor!");
			}
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException {
		doGet(request,response);
	}
	
	public AjaxProcessor getServletInstance(String requestURI){
		AjaxProcessor processor = null;
		try{
			String servletName =  requestURI.substring(requestURI.lastIndexOf("/")+1,requestURI.lastIndexOf("."));
			String packageName = (AjaxServlet.class.getPackage()).getName();
			Class clazz = Class.forName(packageName+"."+servletName.toString());
			processor = (AjaxProcessor)clazz.newInstance();
			map.put(requestURI, processor);
			return processor;
		}catch(Exception e){
			e.printStackTrace();
		}
		return processor;
	}
	public static void main(String [] args) throws Exception{
		//AjaxServlet a = new AjaxServlet();
//		AjaxProcessor processor = a.getServletInstance("/IndexServletProcessor.ajax");
		//AjaxProcessor processor1 = a.getServletInstance("/LoginServletProcessor.ajax");
//		AjaxProcessor processor2 = a.getServletInstance("/IndexServletProcessor.ajax");

	}
}