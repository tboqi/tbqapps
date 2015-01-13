package com.cc.cw.web;

import java.util.Map;

import com.cc.cw.domain.ControlUser;
import com.cc.cw.service.ControlUserService;

public class CUserLoginAction extends CMyAction {

	private static final long serialVersionUID = 1L;

	private String flag;

	private String account;

	private String password;
	
	private ControlUserService cuserService;

	@SuppressWarnings("unchecked")
	@Override
	public String doExecute() {
		if (flag == null || flag.trim().length() < 1
				|| flag.equalsIgnoreCase(INPUT))
			return INPUT;
		if(flag != null && flag.equalsIgnoreCase("login")){
			if(account == null || account.length() < 1){
				setMessage("帐号不能为空");
				return INPUT;
			}
			if(password == null || password.length() < 1){
				setMessage("密码不能为空");
				return INPUT;
			}
			//准备登录
			ControlUser cuser = cuserService.userLogin(account, password);
			if(cuser == null) {
				setMessage("帐号错误！");
				return INPUT;
			}
			else {
				Map map = getSessionMap();
				map.put("cuser", cuser);
				return SUCCESS;
			}
		}
		if(flag != null && flag.equalsIgnoreCase("logout")){
			//准备登录
			ControlUser cuser = cuserService.userLogin(account, password);
			if(cuser == null) return INPUT;
			else {
				Map map = getSessionMap();
				if(!map.containsKey("cuser"))return SUCCESS;
				map.remove("cuser");
				return SUCCESS;
			}
		}
		return INPUT;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ControlUserService getCuserService() {
		return cuserService;
	}

	public void setCuserService(ControlUserService cuserService) {
		this.cuserService = cuserService;
	}

}
