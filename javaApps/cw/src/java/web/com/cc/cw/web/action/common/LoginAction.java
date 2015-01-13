package com.cc.cw.web.action.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.cw.domain.Member;
import com.cc.cw.service.ClickLogService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.util.ValidateUtil;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;

/**
 * 登录action
 * @author dzh
 * 下午01:55:00
 */
public class LoginAction extends SessionActionSupport{

	private static final long serialVersionUID = 7238685047394388828L;
	
	//页面传入的表单数据
	private String email;
	private String password;
	private String userName;
	private boolean loginFlag;
	
	//如没有激活，将此uuid传给error.ftl
	private String uuid;
	
	//action所需服务
	private MemberService memberService;
	@SuppressWarnings("unused")
	private SessionValService sv;
	
	//线程类
	private ClickLogService logService;
	
	/**
	 * 当用户访问某个需要登录的action时，AuthenticationInterceptor拦截器负责把用户
	 * 将要访问的页面url存储到session中，成功登录之后，跳转到此url中
	 */
	public static final String  RETURN_REQUEST_PAGE = "returnRequestPage";
	private String requestUrl = "";
	
	private String inputUrl;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		if(session!=null && session.get("member") != null){
			return SUCCESS;
		}
		if(!loginFlag){
			return INPUT;
		}
		Map errorMap = new HashMap();
		//登录逻辑开始
		if(loginFlag)//验证
			try{
				if(!ValidateUtil.checkEmail(email)){
//					this.addFieldError("login_email", getText("error_member_login_email"));
					errorMap.put("login_email", getText("error_member_login_email"));
					session.put("errorMap", errorMap);
				}
				if(!ValidateUtil.checkString(password)){
//					this.addFieldError("login_password", getText("error_member_login_password_null"));
					errorMap.put("login_password", getText("error_member_login_password_null"));
					session.put("errorMap", errorMap);
				}
			}catch(Exception e){
				log.error(e.getMessage());
				return INPUT;
			}
			
			if(this.getFieldErrors().size() > 0){
				return INPUT;
			}
		//获得member信息
		Member member = memberService.login(email,password,"email");
		if(member == null){
//			this.addFieldError("member_null", (getText("error_member_login")));
			errorMap.put("member_null", getText("error_member_login"));
			session.put("errorMap", errorMap);
			return INPUT;
		}else{
			if(member.getState() == -1){//需要跳转到一个提示页面，通知用户被屏蔽
				log.info("member 被屏蔽");
				//userName = member.getUserName();
				//uuid = member.getUuid();
				//addActionError("email");//添加email作为标识，在error.ftl中判断
				addActionError("您的帐户已被屏蔽");
				return ERROR;
			}
			HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession ses = request.getSession();
			ses.setAttribute("member", member);
			
			Cookie id_cookie = new Cookie("memberid",member.getId()+"");
			id_cookie.setMaxAge(365*24*60*60);
			id_cookie.setPath("/");
			response.addCookie(id_cookie);
			
			Cookie pwd_cookie = new Cookie("password",member.getPassword()+"");
			pwd_cookie.setMaxAge(365*24*60*60);
			pwd_cookie.setPath("/");
			response.addCookie(pwd_cookie);
			
//			Object o = ses.getAttribute("sessionVal");
/*			if (o instanceof SessionVal) {
				SessionVal sessionVal = (SessionVal) o;
				//提示用户这台机器未绑定用户，可以进行绑定用户
			}*/
			//String strHostId = null, strVotes = null;
//			Cookie[] cookies = request.getCookies();
//			for(int i=0;cookies!=null && i<cookies.length;i++){		
//				String name = cookies[i].getName();
//				String value = cookies[i].getValue();
//				if(name.trim().equalsIgnoreCase("hostid")){
//					strHostId = value;
//				}
//				if(name.trim().equalsIgnoreCase("votes")){
//					strVotes = value;
//				}
//			}
			
//			if(strHostId!=null){
//				SessionVal svItem = sv.getByHostId(strHostId);
//				if(svItem!=null && svItem.getMemberId()<=0)
//					sv.setMemberId(strHostId, member.getId());
//			}
//			
//			if(strVotes!=null){
//				int votes = Convert.strToInt(strVotes,0);
//				if(votes>0){
//					memberService.updatePrivilege(member.getId(), member.getPrivilege()+votes);
//					member.setPrivilege(member.getPrivilege()+votes);
//					Cookie cukiDel = new Cookie("votes",null);cukiDel.setMaxAge(0);cukiDel.setPath("/"); 
//					response.addCookie(cukiDel);
//					Cookie cukiVotes = new Cookie("votes","0");cukiVotes.setMaxAge(365*24*60*60);cukiVotes.setPath("/"); 
//					response.addCookie(cukiVotes);
//				}
//			}
			
			//设置uuid
//			String uuid = (String)session.get("uuid");
			//log.info("uuid --> " + uuid);
//			if(uuid!=null && !uuid.trim().equals(member.getUuid())){
//				if(!member.getUuid().equals("0")){
//					//log.info("update cookie");
//					Cookie uCookie = new Cookie("uuid",member.getUuid());
//					uCookie.setMaxAge(365*24*60*60);
//					uCookie.setPath("/");
//					
//					response.addCookie(uCookie);
//					//该操作不应当进行
//					//new UpdateClickLogThread(member.getUuid(),uuid).start();
//				}else{
//					//log.info("update member");
//					member.setUuid(uuid);
//					memberService.updateUUID(member.getId(), uuid);
//				}
//			}
			//添加一个标识为登录过的cookie
//			Cookie loginCoolie = new Cookie("loginFlag","true");
//			loginCoolie.setMaxAge(365*24*60*60);
//			loginCoolie.setPath("/");
//			response.addCookie(loginCoolie);
			
//			session.remove("uuid");
//			session.put("member", member);
			
//			requestUrl = (String)session.get("requestPageUri");
//			session.remove("requestPageUri");
			if(inputUrl!=null && inputUrl.indexOf("privilege")>-1){
				inputUrl = inputUrl.substring(0,inputUrl.indexOf("privilege"));
			}
//			if(requestUrl != null && !requestUrl.trim().equals("")){
//				//log.info("request url --> " + requestUrl);
//				return RETURN_REQUEST_PAGE;
//			}
			return SUCCESS;
		}
	}
	
	/*public void validate(){
		if(loginFlag)
			try{
				if(!ValidateUtil.checkEmail(email)){
					this.addFieldError("login_email", getText("error_member_login_email"));
				}
				if(!ValidateUtil.checkString(password)){
					this.addFieldError("login_password", getText("error_member_login_password_null"));
				}
			}catch(Exception e){
				log.error(e.getMessage());
			}
	}*/
	
	/**
	 * 注销方法
	 * @return
	 */
	public String logout(){
//		memberService.updateFieldValueById(., field, value)
		HttpSession hs = ServletActionContext.getRequest().getSession();
//		Member member = (Member) hs.getAttribute("member");
//		memberService.updateFieldValueById(member.getId(), "LastLoginTime", new Date());
		hs.removeAttribute("member");
		hs.removeAttribute("uuid");
		
		HttpServletResponse response = ServletActionContext.getResponse();
		Cookie mIdDel = new Cookie("memberid", null);
		mIdDel.setMaxAge(0);
		mIdDel.setPath("/");
		response.addCookie(mIdDel);
		
		Cookie pwdDel = new Cookie("password", null);
		mIdDel.setMaxAge(0);
		mIdDel.setPath("/");
		response.addCookie(pwdDel);
		
//		Cookie flagCookie = new Cookie("loginFlag", null);
//		flagCookie.setMaxAge(0);
//		flagCookie.setPath("/");
//		response.addCookie(flagCookie);
		
		hs.invalidate();
		return SUCCESS;
	}

	//所有数据的get方法和服务的set方法
	public void setSv(SessionValService sv) {
		this.sv = sv;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public String getEmail() {
		return email;
	}

	public String getUserName() {
		return userName;
	}
	
	public String getRequestUrl() {
		return requestUrl;
	}

	public void setLoginFlag(boolean loginFlag) {
		this.loginFlag = loginFlag;
	}

	public void setLogService(ClickLogService logService) {
		this.logService = logService;
	}
	
	/**
	 * 当cookie的uuid和member表中的uuid不一致时，将所有点击日志中，将所有uuid等于cookie的值的记录
	 * 全部更新为member表中的uuid
	 * @author dzh
	 * 下午04:02:02
	 */
	public class UpdateClickLogThread extends Thread{
		private String uuid;
		private String oldUuid;
		
		public UpdateClickLogThread(String uuid,String oldUuid){
			this.uuid = uuid;
			this.oldUuid = oldUuid;
		}
		
		public void run(){
			logService.updateUUID(uuid, oldUuid);
		}
	}

	public String getUuid() {
		return uuid;
	}

	public String getInputUrl() {
		return inputUrl;
	}

	public void setInputUrl(String inputUrl) {
		this.inputUrl = inputUrl;
	}

}
