package com.cc.cw.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Member;
import com.cc.cw.service.MailService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.URLCoderUtil;
import com.cc.cw.util.ValidateUtil;

public class RegistServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6856013199249651697L;
	private Log log = LogFactory.getLog(getClass());
	@SuppressWarnings({"unchecked","static-access"})
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		
		String errorMsg = "";
	  if(!ValidateUtil.checkEmail(email)){
		  errorMsg = "error_member_regist_email";
		  ServletHelper.sendToErrorPage(request, response, errorMsg);
		  return;
	  }if(!ValidateUtil.checkString(userName)){
		  errorMsg = "error_member_regist_uername";
		  ServletHelper.sendToErrorPage(request, response, errorMsg);
		  return;
	  }
		if(!ValidateUtil.checkPassword(password, repassword)){
			errorMsg = "error_member_login_password";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;
		}
		
		String strFromIP = request.getHeader("x-forwarded-for");
		if(strFromIP == null || strFromIP.length() == 0 || "unknown".equalsIgnoreCase(strFromIP)) {
			strFromIP = request.getHeader("Proxy-Client-IP");
		}
		if(strFromIP == null || strFromIP.length() == 0 || "unknown".equalsIgnoreCase(strFromIP)) {
			strFromIP = request.getHeader("WL-Proxy-Client-IP");
		}
		if(strFromIP == null || strFromIP.length() == 0 || "unknown".equalsIgnoreCase(strFromIP)) {
			strFromIP = request.getRemoteAddr();
		}
		
		Member member = new Member();
		member.setUserName(userName);
		member.setPassword(password);
		member.setEmail(email);
		member.setIp(strFromIP);
		
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		MemberService ms = (MemberService)ctx.getBean("memberService");
		SessionValService sv = (SessionValService)ctx.getBean("sessionValService");
		
		int id = ms.regist(member);
		
		if(id <= 0){
			errorMsg = "error_member_regist";
			log.info("注册失败");//需要跳转到错误页面
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;
		}
		
		Cookie[] cookies = request.getCookies();
		String strHostId = null, strVotes = null;
		for(int i=0;cookies!=null && i<cookies.length;i++){		
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.trim().equalsIgnoreCase("hostid")){
				strHostId = value;
			}
			if(name.trim().equalsIgnoreCase("votes")){
				strVotes = value;
			}
		}

		if(strHostId!=null){
			sv.setMemberId(strHostId, member.getId());
			sv.setState(strHostId, 1);
		}
		
		if(strVotes!=null){
			int votes = Convert.strToInt(strVotes,0);
			if(votes>0){
				ms.updatePrivilege(member.getId(), member.getPrivilege()+votes);
				member.setPrivilege(member.getPrivilege()+votes);
				sv.setState(strHostId, 1);
				Cookie cukiDel = new Cookie("votes",null);cukiDel.setMaxAge(0);cukiDel.setPath("/"); 
				response.addCookie(cukiDel);
				Cookie cukiVotes = new Cookie("votes","0");cukiVotes.setMaxAge(365*24*60*60);cukiVotes.setPath("/"); 
				response.addCookie(cukiVotes);
			}
		}
		MailService mailService = (MailService)ctx.getBean("mailService");
		Map map = new HashMap();
		map.put("memberId", member.getId());
		map.put("encodeName", new URLCoderUtil().encode(member.getUserName(),"UTF-8"));
		map.put("userName", member.getUserName());
		boolean isSend = true;
		try {
			mailService.sendEmail(email, map);
		} catch (Exception e1) {
			log.info("send email error");
			isSend = false;
			e1.printStackTrace();
		}
		if(isSend){
			errorMsg = "info_member_affirm";
			ServletHelper.sendToInfoPage(request, response, errorMsg);
			return ;
		}else{
			errorMsg = "error_member_regist_sendEmail";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;
		}
		
}
}
