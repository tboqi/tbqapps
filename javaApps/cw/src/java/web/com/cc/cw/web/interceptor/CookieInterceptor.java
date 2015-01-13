package com.cc.cw.web.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.Member;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.util.Convert;
import com.cc.cw.web.util.Constants;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

/**
 * cookie拦截器，负责在每次请求前处理cookie的值，实现 用户永久性登录，给分。
 * 
 * @author dzh 2007-6-19
 */
public class CookieInterceptor implements Interceptor {

	private static final long serialVersionUID = 9069090646261134546L;
	private SessionValService sv;
	private MemberService ms;
	static Log log = LogFactory.getLog(CookieInterceptor.class);
	/** 奖励分数所需停留时间 */
	private final long INTERVAL = 2 * 60 * 60 * 1000;
//	private final long INTERVAL = 1 * 60 * 1000;
	/** cookies有效时间 */
	private final int COOKIEAGE = 365*24*60*60;

	public String intercept(ActionInvocation invocation) throws Exception {
//		log.info("in CookieInterceptor...");
		sv();
		
		return invocation.invoke();
	}

	/**
	 * 处理给分情况
	 */
	private void sv() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		if(request==null || response==null)return;
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
//		log.debug("member --> "+member);
		Cookie[] cookies = request.getCookies();
		if(member == null){//如果用户未登录，判断是否为第一次访问，否则尝试从cookies登录
			if(cookies == null){//如果cookies为空，说明是第一次访问网站，添加cookies
//				log.debug("first visit ! add cookie...");
				String strFirvt = null, strFromIP = null;
				strFirvt = "" + new Date().getTime();
				String uuid = HashUtil.getUUID();
				session.setAttribute("uuid", uuid);
				
				addCookie(response,"uuid",uuid,COOKIEAGE,"/");
				addCookie(response,"firstvisitime",strFirvt,COOKIEAGE,"/");
				addCookie(response,"hostid",sv.allocHostId(),COOKIEAGE,"/"); //(new Date()).getTime()+""
				
				strFromIP = request.getHeader("x-forwarded-for");
				if (strFromIP == null || strFromIP.length() == 0
						|| "unknown".equalsIgnoreCase(strFromIP)) {
					strFromIP = request.getHeader("Proxy-Client-IP");
				}
				if (strFromIP == null || strFromIP.length() == 0
						|| "unknown".equalsIgnoreCase(strFromIP)) {
					strFromIP = request.getHeader("WL-Proxy-Client-IP");
				}
				if (strFromIP == null || strFromIP.length() == 0
						|| "unknown".equalsIgnoreCase(strFromIP)) {
					strFromIP = request.getRemoteAddr();
				}
				addCookie(response,"fromip",strFromIP,COOKIEAGE,"/");
				
				addCookie(response,"lastvisitime",strFirvt,COOKIEAGE,"/");
			}else{//尝试从cookies读取用户信息，进行登录
//				log.debug("login from cookie...");
				String memberId = "";
				String password = "";
				for(Cookie c : cookies){
					if(c==null)continue;
					String name = c.getName();
					String value = c.getValue();
					if(name.trim().equalsIgnoreCase("memberid")){
						memberId = value;
					}else if(name.trim().equalsIgnoreCase("password")){
						password = value;
					}else if(name.trim().equalsIgnoreCase("uuid")){
						String uuid = c.getValue();
						session.setAttribute("uuid", uuid);
					}
				}
				if(memberId !=null && !memberId.trim().equals("") && password!=null && !password.trim().equals("")){
					//根据cookies中的用户id登录
					member = ms.login(memberId, password, "id");
					if(member != null){
						session.setAttribute("member", member);
						if(session.getAttribute("uuid")==null ||  !session.getAttribute("uuid").equals(member.getUuid())){
							session.setAttribute("uuid", member.getUuid());
							addCookie(response,"uuid",member.getUuid(),COOKIEAGE,"/");
						}
					}else{
//						log.debug("login failed...");
					}
				}else{
//					log.debug("login failed...");
				}
			}
		}else{
//			log.debug("already login ! check cookie...");
			Cookie cukiMemberId = null, cukiPwd = null;
			
			for(Cookie c : cookies){
				if(c.getName().trim().equalsIgnoreCase("memberid")){
					cukiMemberId = c;
				}
				if(c.getName().trim().equalsIgnoreCase("password") && c.getValue().trim().equalsIgnoreCase(member.getPassword())){
					cukiPwd = c;
				}
				if(c.getName().trim().equalsIgnoreCase("lastvisitime")){
					long longNow = new Date().getTime();
					long longLstvt = Convert.strToLong(c.getValue(), 0);
					if ((longNow - longLstvt) > INTERVAL) {//判断用户是否已经超过指定停留的时间
//						log.debug("add point.......");
						int addedvalue = ms.addMemberPrivilege(member.getId(), Constants.REGISTUSERTIMERADDPRIVILEGE);
						if(addedvalue > 0 ){
							member.setPrivilege(addedvalue);
						}
						addCookie(response,"lastvisitime",""+longNow,COOKIEAGE,"/");
					}
				}
				if(c.getName().trim().equalsIgnoreCase("uuid")){
					//获得登录用户的uuid
					String mUuid = member.getUuid();
					if(!c.getValue().trim().equalsIgnoreCase(mUuid)){//如果cookies的uuid与实际登录用户的uuid不等，则进行更新
						addCookie(response,"uuid",mUuid,COOKIEAGE,"/");
						addCookie(response,"memberid",""+member.getId(),COOKIEAGE,"/");
						addCookie(response,"password",member.getPassword(),COOKIEAGE,"/");
						session.setAttribute("uuid", mUuid);
					}
				}
			}
			if(cukiMemberId == null){
				addCookie(response,"memberid",""+member.getId(),COOKIEAGE,"/");
			}
			if(cukiPwd == null){
				addCookie(response,"password",member.getPassword(),COOKIEAGE,"/");
			}
		}
//		for(Cookie c : cookies){
//			if(c.getName().trim().equalsIgnoreCase("uuid")){
//			}
//		}
	}
	
	/**
	 * 增加一个Cookie
	 * @param response
	 * @param ckName
	 * @param ckValue
	 * @param maxAge
	 * @param path
	 */
	private void addCookie(HttpServletResponse response, String ckName,String ckValue,int maxAge,String path){
//		log.debug("add cookie "+ckName+" ... ");
		Cookie cookie = new Cookie(ckName,ckValue);
		cookie.setMaxAge(maxAge);
		cookie.setPath(path);
		response.addCookie(cookie);
	}

	public void destroy() {

	}

	public void init() {

	}

	public void setSv(SessionValService sv) {
		this.sv = sv;
	}
	public void setMs(MemberService ms) {
		this.ms = ms;
	}
}
