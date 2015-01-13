package com.cc.cw.web;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.util.Convert;

public class LoginServlet extends HttpServlet{


	/**
	 * 
	 */
	private static final long serialVersionUID = -5909322432858772153L;
	private Log log = LogFactory.getLog(getClass());
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String errorMsg = "";

		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		MemberService ms = (MemberService)ctx.getBean("memberService");
		Member member = ms.login(email,password,"email");
		String requestPageUri = (String)request.getSession().getAttribute("requestPageUri");
		log.info("requestPageUri is ：　　" + requestPageUri);
		if( member != null){
			if(member.getState() != 1){//需要跳转到一个提示页面，通知用户去邮箱激活
				log.info("not affirm member");
				errorMsg = "error_member_notAffirm";
				request.getSession().setAttribute("memberId", member.getId());
				request.getSession().setAttribute("userName", member.getUserName());
				request.getSession().setAttribute("email", email);
				ServletHelper.sendToErrorPage(request, response, errorMsg);
				return ;
			}
			member.setLastLoginTime(new Date());
			ms.update(member);
			/*if(ms.increaseMemberPrivilege(member)){
				member.setPrivilege(member.getPrivilege() + 1);
			}*/
			
			SessionValService sv = (SessionValService)ctx.getBean("sessionValService");
			String strHostId = null, strVotes = null;
			Cookie[] cookies = request.getCookies();
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
				SessionVal svItem = sv.getByHostId(strHostId);
				if(svItem!=null && svItem.getMemberId()<=0)
					sv.setMemberId(strHostId, member.getId());
			}
			
			if(strVotes!=null){
				int votes = Convert.strToInt(strVotes,0);
				if(votes>0){
					ms.updatePrivilege(member.getId(), member.getPrivilege()+votes);
					member.setPrivilege(member.getPrivilege()+votes);
					Cookie cukiDel = new Cookie("votes",null);cukiDel.setMaxAge(0);cukiDel.setPath("/"); 
					response.addCookie(cukiDel);
					Cookie cukiVotes = new Cookie("votes","0");cukiVotes.setMaxAge(365*24*60*60);cukiVotes.setPath("/"); 
					response.addCookie(cukiVotes);
				}
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			
			if(requestPageUri == null || requestPageUri.equals("")){
			
				try {
					
					response.sendRedirect(request.getContextPath()+"/index.html");
					return ;
				} catch (IOException e) {
					e.printStackTrace();
			}
			}else{
				try {
					log.info("login success,redirect to the last request page : "+request.getContextPath() + requestPageUri);
					request.getSession().removeAttribute("requestPageUri");
					response.sendRedirect(request.getContextPath() + requestPageUri);
					return ;
				} catch (IOException e) {
					e.printStackTrace();
			}
			}
		}else{
			errorMsg = "error_member_login";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
}
