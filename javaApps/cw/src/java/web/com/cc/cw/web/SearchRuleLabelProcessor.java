package com.cc.cw.web;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.service.AtomLabelService;


public class SearchRuleLabelProcessor implements AjaxProcessor{

	public void process(HttpServletRequest request, HttpServletResponse response) {
		String label = request.getParameter("label");
		if(label.equals("undefined")){
			label="";
		}
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
		AtomLabelService als = (AtomLabelService)ctx.getBean("atomLabelService");
		List<String> list = als.getDistinctContentByLike(label);
		StringBuffer sb = new StringBuffer();
		for (Iterator it = list.iterator(); it.hasNext();) {
			String e = (String) it.next();
			sb.append(e+",");
		}
		try {
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			ServletOutputStream out = response.getOutputStream();
			out.write(("<?xml version=\"1.0\" encoding=\"" + ENCODER + "\"?>").getBytes());
			out.write(("<result>"+sb.toString()+"</result>").getBytes(ENCODER));
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
