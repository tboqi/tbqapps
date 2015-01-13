package com.cc.cw.web.action.common;

import com.cc.cw.domain.Member;
import com.cc.cw.service.MailService;
import com.cc.cw.service.MemberService;
import com.cc.cw.util.ValidateUtil;
import com.opensymphony.xwork.ActionSupport;

public class FindPasswordAction extends ActionSupport{

	private static final long serialVersionUID = 1456004954287755927L;
	
	private String email;
	
	private MemberService ms;
	
	private MailService mailService;
	
	private String msg;
	private boolean submitFlag;
	
	public String execute(){
		
		if(!submitFlag){
			return INPUT;
		}
		
		if(!ValidateUtil.checkEmail(email)){
			this.addFieldError("getpwd_email_error", getText("error_member_login_email"));
			return INPUT;
		}
		Member member = ms.getByEmail(email);
		if(member == null){
			this.addFieldError("getpwd_member_null", getText("getpwd_member_null"));
			return INPUT;
		}else{
			try {
				mailService.sendEmail(email, member.getUserName(), member.getPassword());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		msg = getText("getpwd_success");
		return SUCCESS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMsg() {
		return msg;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public boolean isSubmitFlag() {
		return submitFlag;
	}

	public void setSubmitFlag(boolean submitFlag) {
		this.submitFlag = submitFlag;
	}

}
