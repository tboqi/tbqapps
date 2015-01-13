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
import com.cc.cw.domain.SessionVal;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.web.util.Constants;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

public class NewCookieInterceptor implements Interceptor{

	private static final long serialVersionUID = 4008895574725678491L;
	
	private SessionValService sv;
	private MemberService ms;
	private MessageService messageService;
	static Log log = LogFactory.getLog(CookieInterceptor.class);
	/** 奖励分数所需停留时间 */
//	private final long INTERVAL = 2 * 60 * 60 * 1000;
	/** cookies有效时间 */
	private final int COOKIEAGE = 365*24*60*60;
	public String intercept(ActionInvocation invocation) throws Exception {
		sv();
		return invocation.invoke();
	}
	
	private void sv() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		if(request==null || response==null)return;
		HttpSession session = request.getSession();
//		Member member = (Member) session.getAttribute("member");
		Object sessionVal = session.getAttribute("sessionVal");
				
		if(sessionVal == null){//用户刚打开传闻网页面，还未创建session
			Cookie[] cookies = request.getCookies();
			if(cookies == null){ //用户COOKIE中没有传闻网信息，用户第一次使用该电脑登录传闻网
				addNewHostId(request, response, session);
			}else{//保留有用户之前登录传闻网的信息
				addSessionByCookie(request, response, session, cookies);
			}
		}
		String bindflag = (String) session.getAttribute("bindflag");
		String uuid = (String) session.getAttribute("uuid");
		Member member = (Member) session.getAttribute("member");
		if(uuid == null && member!=null){
			session.setAttribute("uuid", member.getUuid());
		}
		if(bindflag == null ){
			addSessionFlag(session);
		}
		if(member!=null){
			int unreadCount = messageService.getUnReadMessageCount(member.getId());
			session.setAttribute("unreadCount", new Integer(unreadCount));
		}
	}
	
	/**
	 * 新加一个hostId到cookie中，并将这个非注册用户入库
	 * @param request
	 * @param response
	 * @param session
	 */
	private void addNewHostId(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String hostId = HashUtil.getUUID();
		addCookie(response,"hostId",hostId,COOKIEAGE,"/");
		
		String strFromIP = null;
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
		
//		入非注册用户库(sessionval);
		SessionVal sval = new SessionVal();
		String firstVisitTime = new Date().getTime()+"";
		sval.setFirstVisitTime(firstVisitTime);
		if(strFromIP.length()>15)strFromIP=strFromIP.substring(0,15);
		sval.setFromIP(strFromIP);
		sval.setHostId(hostId);
		sval.setLastVisitTime(firstVisitTime);
		sval.setMemberId(0);
		if(sv.isTodayLogin(strFromIP)){
			sval.setPrivilege(0);
		}else{
			sval.setPrivilege(Constants.FIRSTLOGINUSERPRIVILEGE);
		}
//		sval.setPrivilege(Constants.FIRSTLOGINUSERPRIVILEGE);
		sval.setState(1);
		sv.add(sval);
		
		//用户相应信息放入session中
		session.setAttribute("sessionVal", sval);
	}
	
	/**
	 * 用户浏览器中以存在相关cookie，根据其cookie值进行登录初始化
	 * @param request
	 * @param response
	 * @param session
	 * @param cookies
	 */
	private void addSessionByCookie(HttpServletRequest request, HttpServletResponse response, HttpSession session, Cookie[] cookies){
		Member member = null;
		String memberId = "";
		String password = "";
		String hostId = "";
		for(Cookie c : cookies){
			if(c==null)continue;
			String name = c.getName();
			String value = c.getValue();
			if(name.trim().equalsIgnoreCase("hostId")){
				hostId = c.getValue();
			}else if(name.trim().equalsIgnoreCase("memberid")){
				memberId = value;
			}else if(name.trim().equalsIgnoreCase("password")){
				password = value;
			}
		}
		if(hostId.trim().equals("") || hostId.trim().equals("null")){//处理不存在HOSTID的情况。
			addNew(request, response, session);
			return;
		}
		
		addSessionByHostID(request, response, session, hostId);
		
		if(memberId !=null && !memberId.trim().equals("") && password!=null && !password.trim().equals("")){
			//取得登录用户的相关信息
			//根据cookies中的用户id登录
			member = ms.login(memberId, password, "id");

			if(member != null){//自动登录
				if(session.getAttribute("sessionVal") instanceof Member){
					Member m = (Member) session.getAttribute("sessionVal");
					if(m.getId() == member.getId()){
						session.setAttribute("member", m);
					}else{
						session.setAttribute("member", member);
					}
				}else{
					session.setAttribute("member", member);
				}
			}
		}
	}
	
	/**
	 * 当根据用户cookie中的用户名，密码登录不成功时，根据其cookie中的hostId值进行初始化操作
	 * @param request
	 * @param response
	 * @param session
	 * @param hostId
	 */
	private void addSessionByHostID(HttpServletRequest request, HttpServletResponse response, HttpSession session, String hostId){
		if(hostId==null || hostId.trim().equals(""))return;
		Member mem = ms.getByUUID(hostId);
		if(mem != null){
			session.setAttribute("sessionVal", mem);
		}else{
			SessionVal sval = sv.getByHostId(hostId);
			if(sval!=null){
				session.setAttribute("sessionVal", sval);
			}else{
				addNew(request, response, session);
				return;
			}
		}
	}
	
	/**
	 * cookie中新创建一个hostId,并清楚原来的memberid和password
	 * @param request
	 * @param response
	 * @param session
	 */
	private void addNew(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		addNewHostId(request, response, session);
		addCookie(response,"memberid",null,0,"/");
		addCookie(response,"password",null,0,"/");
	}
	
	/**
	 * session 中加标志，判断当前用户状态
	 * @param session
	 */
	private void addSessionFlag(HttpSession session){
		Object o = session.getAttribute("sessionVal");
		String uuid = (String) session.getAttribute("uuid");
//		Member mem = (Member) session.getAttribute("member");
//		SessionVal sessionVal = null;
//		Member member = null;
		if (o instanceof SessionVal) {
//			sessionVal = (SessionVal) o;
			session.setAttribute("bindflag", "no");
			if(uuid ==null){
				session.setAttribute("uuid", ((SessionVal)o).getHostId());
			}
		}else if(o instanceof Member){
//			member = (Member)o;
			session.setAttribute("bindflag", "yes");
			if(uuid ==null){
				session.setAttribute("uuid", ((Member)o).getUuid());
			}
		}
//		if(mem == null){
//			if(sessionVal != null){
//				//未绑定，未登录
//			}else if(member != null){
//				//以绑定，未登录
//			}
//		}else{
//			if(member != null && member.getUuid().equals(mem.getUuid())){
//				//绑定用户登录
//			}else{
//				//非绑定用户登录
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
		Cookie cookie = new Cookie(ckName,ckValue);
		cookie.setMaxAge(maxAge);
		cookie.setPath(path);
		response.addCookie(cookie);
	}
	
	public void destroy() {
	}

	public void init() {
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public void setSv(SessionValService sv) {
		this.sv = sv;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
}
