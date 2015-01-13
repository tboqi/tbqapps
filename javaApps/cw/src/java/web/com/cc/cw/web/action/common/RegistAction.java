package com.cc.cw.web.action.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.service.MailService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.util.URLCoderUtil;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.web.util.Constants;
import com.opensymphony.webwork.ServletActionContext;

/**
 * 注册action
 * @author dzh
 *
 */
public class RegistAction extends SessionActionSupport{

	private static final long serialVersionUID = -7710052743029145118L;
	
	//action需要数据，注册用
	private String userName;
	private String email;
	private String password;
	private String password_cnf;
	private boolean registFlag;
	
	//action所需服务
	private MemberService memberService;
	private MailService mailService;
	private SessionValService sv;
	private MessageService messageServie;
	
	//info页面所需数据
	private String msg;
	
	//用户推广人ID
	private int introId;
	
	private String hostIdFlag;
	private String hostId;

	public void validate(){
		if(registFlag)
			try{
				if(!ValidateUtil.checkEmail(email)){
					this.addFieldError("regist_email", getText("error_member_regist_email"));
				}
				if(!ValidateUtil.checkString(userName)){
					this.addFieldError("regist_username", getText("error_member_regist_uername"));
				}
				if(!ValidateUtil.checkPassword(password, password_cnf)){
					this.addFieldError("regist_password", getText("error_member_regist_password"));
				}
			}catch(Exception e){
				log.error(e.getMessage());
			}
	}

	/**
	 * action 主方法,注册
	 * @return 
	 */
	@SuppressWarnings("unchecked")
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//转向注册页面
		if(!registFlag){
			Cookie[] cookies = request.getCookies();
			if(cookies == null || cookies.length == 0)
				return INPUT;
			String hostId = null;
			for(Cookie c : cookies){
				if(c==null)continue;
				if(c.getName().trim().equals("hostId")){
					hostId = c.getValue();
				}
			}
			if(hostId != null && !hostId.trim().equals("") && memberService.getByUUID(hostId) == null){
				hostIdFlag = "yes";
				this.hostId = hostId;
			}else{
				hostId = HashUtil.getUUID();
			}
			return INPUT;
		}
		
		//用户注册
		Member member = new Member();
		if(hostIdFlag!=null && hostIdFlag.equals("on")){
			member.setUuid(hostId);
			SessionVal sessionVal = sv.getByHostId(hostId);
			if(sessionVal!=null){
				member.setPrivilege(sessionVal.getPrivilege()+Constants.FIRSTREGISTUSERPRIVILEGE);
				sv.del(sessionVal.getId());
				request.getSession().setAttribute("sessionVal", member);
				request.getSession().setAttribute("bindflag", "yes");
			}
		}else{
			member.setUuid(HashUtil.getUUID());
			member.setPrivilege(Constants.FIRSTREGISTUSERPRIVILEGE);
		}
		member.setEmail(email);
		member.setUserName(userName);
		member.setPassword(password);
		member.setIp(getIp());
		member.setCoverPath("");
		int id = memberService.regist(member);
		
		if(id <= 0){
			this.addFieldError("regist_error", getText("error_member_regist"));
			return INPUT;
		}

//		//临时+5票
//		member.setPrivilege(member.getPrivilege()+5);
//		memberService.updatePrivilege(member.getId(),member.getPrivilege());
		
		request.getSession().setAttribute("member", member);
		
		Map map = new HashMap();
		map.put("uuid", member.getUuid());
		map.put("encodeName", URLCoderUtil.encode(member.getUserName(),"UTF-8"));
		map.put("userName", member.getUserName());
		//boolean isSend = true;
		try {
			mailService.sendEmail(email, map);
		} catch (Exception e1) {
			log.error("send email error");
			//isSend = false;
			e1.printStackTrace();
		}
		/*if(isSend){
			msg = getText("info_member_affirm");
			return SUCCESS;
		}else{
			this.addFieldError("regist_error_sendEmail", getText("error_member_regist_sendEmail"));
			return INPUT;
		}*/
		//给推广人加票
		if(introId>0){
			int i = memberService.addMemberPrivilege(introId, Constants.INTROPRIVILEGE);
			if(i>0){
				String str = "用户：<a href='"+request.getContextPath()+"/user/viewuser.action?memberId="+member.getId()+"' title=查看用户信息 alt=查看用户信息 target=_blank >"+member.getUserName()+"</a> 经过您的介绍，已经成功在<a href='"+request.getContextPath()+"' target=_blank>传闻网</a>注册， 特向您奖励"+Constants.INTROPRIVILEGE+" 点，并感谢您的大力支持！";
				//将发送者ID设为-1，用以区别其它不存在用户发送的留言
				messageServie.sendMessage(-1, introId, Message.MESSAGE_SYSTEM, "系统消息", str);
			}
		}
		String str = "感谢您的登录传闻网，希望您的继续关注和支持传闻网！只要您以 http://www.chuanwen.com.cn/regist.html?introId="+member.getId()+" 这个地址，向您的朋友们推荐，并在此注册用户，我们将给您2点票数的奖励！";
		messageServie.sendMessage(-1, member.getId(), Message.MESSAGE_SYSTEM, "系统消息", str);
		introId = member.getId();
		msg = getText("info_member_affirm");
		return SUCCESS;
	}
	
	/**
	 * 获取ip方法
	 * @return ip
	 */
	public String getIp(){
		HttpServletRequest request = ServletActionContext.getRequest();
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
		return strFromIP;
	}

	//所有服务、数据的get set方法
	public void setUserName(String userName) {
		this.userName = userName;
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
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void setSv(SessionValService sv) {
		this.sv = sv;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setPassword_cnf(String password_cnf) {
		this.password_cnf = password_cnf;
	}

	public void setRegistFlag(boolean registFlag) {
		this.registFlag = registFlag;
	}

	public void setIntroId(int introId) {
		this.introId = introId;
	}

	public int getIntroId() {
		return introId;
	}

	public void setMessageServie(MessageService messageServie) {
		this.messageServie = messageServie;
	}
	
	public String getHostIdFlag() {
		return hostIdFlag;
	}

	public void setHostIdFlag(String hostIdFlag) {
		this.hostIdFlag = hostIdFlag;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	
}
