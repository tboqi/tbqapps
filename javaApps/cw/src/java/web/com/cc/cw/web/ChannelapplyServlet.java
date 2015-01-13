package com.cc.cw.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.ChannelCategory;
import com.cc.cw.domain.Member;
import com.cc.cw.service.ChannelCategoryService;
import com.cc.cw.service.ChannelService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.web.util.URLRewriteManager;

public class ChannelapplyServlet extends HttpServlet {
	private static final long serialVersionUID = 6494783442688334237L;
	protected final Log log = LogFactory.getLog(getClass());
	private String[] spliter = {",","，","%","#"," ","&",".","。","\\","/"," "};

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response){
	
		HttpSession session = request.getSession();
		
		String chName = request.getParameter("chname");
		String chDes = request.getParameter("description");
		String chKey = request.getParameter("key");
		String s1 = request.getParameter("chparm");
		Member member = null;
		if (s1 == null || s1.equals("")) {
			try {
				if (!ValidateUtil.checkString(chName)) {
					log.info("chname is null");
					String errorMsg = "error_channel_namenotnull";
					ServletHelper.sendToErrorPage(request, response, errorMsg);// 错误页面
					return;
				}
				if (!ValidateUtil.checkString(chDes)) {
					log.info("description is null");
					String errorMsg = "error_channel_descnotnull";
					ServletHelper.sendToErrorPage(request, response, errorMsg);// 错误页面
					return;
				}
				if (!ValidateUtil.checkString(chKey)) {
					log.info("key is null");
					String errorMsg = "error_channel_keywordsnotnull";
					ServletHelper.sendToErrorPage(request, response, errorMsg);// 错误页面
					return;
				}
			} catch (Exception ws) {
				ws.printStackTrace();
				try {
					String errorMsg = "error_default";
					ServletHelper.sendToErrorPage(request, response, errorMsg);// 错误的页面
				} catch (Exception wa) {
					wa.printStackTrace();
				}
			}
			member = (Member) session.getAttribute("member");
			if (member == null) {
				String errorMsg = "error_member_null";
				ServletHelper.sendToErrorPage(request, response, errorMsg);// 错误的页面
				return;
			}
			WebApplicationContext ctx = WebApplicationContextUtils
					.getRequiredWebApplicationContext(this.getServletContext());
			ChannelService cs = (ChannelService) ctx.getBean("channelService");
			ChannelCategoryService ccs = (ChannelCategoryService)ctx.getBean("channelCategoryService");
			
			Channel ch = new Channel();
			ch.setMemberId(member.getId());
			ch.setName(Convert.getHtmlRealText(chName));
			String keywords = Convert.getHtmlRealText(chKey);
			ch.setKeywords(keywords);
			ch.setDescription(Convert.getHtmlRealText(chDes));
			cs.add(ch);
			keywords = replaceSplit(keywords);
			String[] tags = keywords.split(";");
			Set<String> tagSet = new HashSet(Arrays.asList(tags));
			
			for(String tag : tagSet){
				if(tag==null || tag.trim().equals(""))continue;
				ChannelCategory cc = new ChannelCategory();
				cc.setContent(tag);
				ccs.add(cc);
			}
		}else{
		}
		
		try {
			response.sendRedirect(URLRewriteManager.getChannelApplyUrl(request.getContextPath()));
		} catch (IOException e) {
			String errorMsg = "error_default1";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;
		}
	}
	
	private String replaceSplit(String strCont){
		String retCont = strCont;
		for(int i=0;i<spliter.length;i++){
			retCont = retCont.replace(spliter[i], ";");
		}
		return retCont;
	}

}
