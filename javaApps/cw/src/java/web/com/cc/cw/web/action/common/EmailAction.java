package com.cc.cw.web.action.common;

import java.util.HashMap;
import java.util.Map;

import com.cc.cw.service.MailService;
import com.cc.cw.util.URLCoderUtil;

/**
 * 发送邮件Action
 * @author dzh
 * 下午02:33:29
 */
public class EmailAction extends BaseActionSupport{
	
	private static final long serialVersionUID = -1562411095316772299L;
	//此action需要的参数
	private String userName;
	private String email;
	private String uuid;
	
	//向页面传的信息
	private String msg;
	
	//需要服务
	private MailService mailService;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		log.info("uuid" + uuid);
		log.info("encodeName" + userName);
		Map map = new HashMap();
		map.put("uuid", uuid);
		map.put("encodeName", userName);
		map.put("userName", URLCoderUtil.decode(userName,"UTF-8"));
		try {
			log.info("send email");
			mailService.sendEmail(email, map);
			msg = getText("info_member_affirm");
		} catch (Exception e) {
			log.error("email error!");
			e.printStackTrace();
			this.addActionError(getText("error_member_regist_sendEmail"));
			return ERROR;
		}
		return SUCCESS;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setEmail(String password) {
		this.email = password;
	}

	public String getMsg(){
		return msg;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
}
