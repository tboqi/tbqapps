package com.cc.cw.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.AtomLabel;
import com.cc.cw.domain.Label;
import com.cc.cw.domain.Member;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.util.Convert;

public class AddLabelProcessor implements AjaxProcessor{

	private Log log = LogFactory.getLog(getClass());
	private String[] spliter = {",","，"," ","%","#"," ","&",".","。","\\","/"}; 
	
	@SuppressWarnings("unchecked")
	public void process(HttpServletRequest request, HttpServletResponse response){
		Member member = (Member)request.getSession().getAttribute("member");
		String content = request.getParameter("labelContent");
		content = Convert.getHtmlRealText(content);
		if(content==null || content.trim().equals(""))
			return;
		content = replaceSplit(content);
		String articleId = request.getParameter("articleId");
		int mId = 0;
		int aId = 0;
		boolean flag = true;
		String errorMsg = "";
		
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
		LabelService ls = (LabelService)ctx.getBean("labelService");
		
		try{
			
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			ServletOutputStream out = response.getOutputStream();
			out.write(("<?xml version=\"1.0\" encoding=\"" + ENCODER + "\"?>").getBytes());
			out.write("<result>".getBytes());
			
			if(member == null){
				log.info("member is null");
				flag = false;
				errorMsg="MEMBER_NULL";
			}else if(content == null || content.equals("")){
				log.info("content is null");
				flag = false;
				errorMsg="CONTENT_NULL";
			}else if(articleId == null || articleId.equals("")){
				log.info("articleId is null");
				flag = false;
				errorMsg = "ARTICLEID_NULL";
			}else{
				try{
					mId = member.getId();
					aId = Integer.parseInt(articleId);
				}catch(NumberFormatException ne){
					flag = false;
				}
			}
			
			if(flag){
				Label label = new Label();
				label.setArticleId(aId);
				label.setContent(content);
				label.setMemberId(mId);
				int lId = ls.add(label);
				if(lId > 0){
					//log.info("add label success");
					out.write("<status>".getBytes());
					out.write("OK".getBytes());
					out.write("</status>".getBytes());
					List<String> allLabel = ls.getContentByArticleId(aId);
					if(allLabel != null){
						for(String lb : allLabel){
							out.write("<label>".getBytes());
							out.write(lb.getBytes("UTF-8"));
							out.write("</label>".getBytes());
						}
					}
					/**
					 * 写标签表
					 */
					AtomLabelService als = (AtomLabelService)ctx.getBean("atomLabelService");
					String[] tags = content.split(";");
					Set<String> tagSet = new HashSet(Arrays.asList(tags));
					
					for(String tag : tagSet){
						if(tag==null || tag.trim().equals(""))continue;
						AtomLabel item = new AtomLabel();
						item.setContent(tag);
						item.setProviderId(member.getId());
						item.setArticleId(Integer.parseInt(articleId));
						//log.info("the articleId is --> " + articleId);
						als.add(item);
					}
				}else{
					log.info("add label error");
					out.write("<status>".getBytes());
					out.write("Failure".getBytes());
					out.write("</status>".getBytes());
				}
			}else{
				log.info("add label error");
				out.write("<status>".getBytes());
				out.write(errorMsg.getBytes());
				out.write("</status>".getBytes());
			}
			
			out.write("</result>".getBytes());
		}catch(IOException e){
			e.printStackTrace();
			
		}catch(Exception e1){
			
			e1.printStackTrace();
		}
	}
	
	private String replaceSplit(String strCont){
		String retCont = strCont;
		for(int i=0;i<spliter.length;i++){
			retCont = retCont.replace(spliter[i], ";");
		}
		return retCont;
	}
	
	public static void main(String[] args){
		
	}
	
}
