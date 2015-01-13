package com.cc.cw.web;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Member;
import com.cc.cw.service.MemberService;
import com.cc.cw.util.URLCoderUtil;

/**
 * 用来验证用户从邮件中访问的链接，判断用户的合法性，并激活用户
 * @author dzh
 * 下午04:06:28
 */
public class MemberAffirmServlet extends HttpServlet{
	
	private static final long serialVersionUID = 7675609185662036658L;
	private Log log = LogFactory.getLog(getClass());
	@SuppressWarnings("static-access")
	public void doPost(HttpServletRequest request , HttpServletResponse response){
		
		try{
			int memberId = Integer.parseInt(request.getParameter("memberId"));
			String userName = new URLCoderUtil().decode(request.getParameter("userName"),"UTF-8");
			
			
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
			MemberService ms = (MemberService)ctx.getBean("memberService");
						
			Member member = ms.get(memberId);
			if(member != null){
				if(member.getUserName().equals(userName)){
					log.info("member affirm success!");
					//更新用户state;
					ms.setMemberEnable(member.getId());
					String infoMsg = "info_member_affirm_success";
					ServletHelper.sendToInfoPage(request, response, infoMsg);//跳转到提示页面，告知用户激活成功
					return ;
				}else {
					log.info("member affirm error");
					String errorMsg = "error_member_affirm_error";
					ServletHelper.sendToErrorPage(request, response, errorMsg);
					return ;
				}
			}
			else {
				log.info("do not have this user");
				response.sendRedirect(request.getContextPath());//应跳转到错误页面
				return ;
			}
		}catch(Exception e){
			e.printStackTrace();
			String errorMsg = "error_member_affirm_error";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;//失败，跳转到错误页面
		}
	}

	public void doGet(HttpServletRequest request , HttpServletResponse response){
		this.doPost(request, response);
	}
}
