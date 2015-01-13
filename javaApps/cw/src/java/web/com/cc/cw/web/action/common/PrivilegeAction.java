package com.cc.cw.web.action.common;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SessionValService;
import com.cc.cw.web.util.Constants;
import com.opensymphony.webwork.ServletActionContext;

public class PrivilegeAction extends SessionActionSupport{

	private static final long serialVersionUID = 162456135260649163L;
	private final int COOKIEAGE = 365*24*60*60;
	private String msg;
	
	private SessionValService sv;
	private MemberService ms;
	
	private int nVotes;
	private String password;
	
	/**
	 * 返回header页面
	 * @return
	 */
	public String getHeader(){
		return "header";
	}
	
	/**
	 * 返回header页面
	 * @return
	 */
	public String getHeaderTOP(){
		return "header_top";
	}
	
	/**
	 * 送票:登录用户，往浏览器对应的hostId送票
	 * @return
	 */
	public String givePrivilege(){
		HttpSession session = getSession();
		Member member = (Member) session.getAttribute("member");
		Object o = session.getAttribute("sessionVal");
		if(member==null){
			msg = "用户登录状态出错，请重新登录!";
			return INPUT;
		}
		if(o == null){
			msg = "系统错误,请稍候再试!";
			return INPUT;
		}
		if(member.getPrivilege()<nVotes){
			msg = "您的票数不够，您现有票数为"+member.getPrivilege()+",请输入正确的票数!";
			return INPUT;
		}
		if (o instanceof SessionVal) {
			SessionVal sessionVal = (SessionVal) o;
			sv.incVotes(sessionVal.getHostId(), nVotes);
			sessionVal.setPrivilege(sessionVal.getPrivilege()+nVotes);
			member.setPrivilege(ms.addMemberPrivilege(member.getId(), -nVotes));
		}else if(o instanceof Member){
			Member m = (Member)o;
			if(m.getId() != member.getId()){
				m.setPrivilege(ms.addMemberPrivilege(m.getId(), nVotes));
				member.setPrivilege(ms.addMemberPrivilege(member.getId(), -nVotes));
			}else{
				msg = "您的帐号已经绑定在这台机器上，不需要送票";
				return INPUT;
			}
		}
		msg = "恭喜您，送票成功!";
		return INPUT;
	}
	
	/**
	 * 吸票:登录用户，从非绑定机器中获得机器所有票数
	 * @return
	 */
	public String absorbPrivilege(){
		HttpSession session = getSession();
		Member member = (Member) session.getAttribute("member");
		Object o = session.getAttribute("sessionVal");
		String flag = (String) session.getAttribute("bindflag");
		if(flag!=null && flag.equals("yes")){
			msg = "该机器已经绑定，不允许进行吸票操作!";
			return INPUT;
		}
		if(member==null){
			msg = "用户登录状态出错，请重新登录!";
			return INPUT;
		}
		if(o == null){
			msg = "系统错误,请稍候再试!";
			return INPUT;
		}
		if (o instanceof SessionVal) {
			SessionVal sessionVal = (SessionVal) o;
			member.setPrivilege(ms.addMemberPrivilege(member.getId(), sessionVal.getPrivilege()));
			sessionVal.setPrivilege(0);
			sv.update(sessionVal);
			msg="恭喜您，吸票成功!";
		}else if(o instanceof Member){
			msg = "该机器已经绑定，不允许进行吸票操作!";
		}
		return INPUT;
	}
	
	/**
	 * 领票
	 * @return
	 */
	public String drawPrivilege(){
		HttpSession session = getSession();
		Object o = session.getAttribute("sessionVal");
		if (o instanceof SessionVal) {
			SessionVal sessionVal = (SessionVal) o;
			SessionVal sval = sv.get(sessionVal.getId());
			long time = new Date().getTime() - Long.parseLong(sval.getLastVisitTime());
			if( time > Constants.INTERVAL){
				long i = time/Constants.INTERVAL;
				if(i>3) {
					i=3;
					sval.setPrivilege(sval.getPrivilege()+ 3*Constants.UNREGISTUSERTIMERADDPRIVILEGE);
					sval.setLastVisitTime(new Date().getTime()+"");
				}else{
					sval.setPrivilege(sval.getPrivilege()+ (int)i*Constants.UNREGISTUSERTIMERADDPRIVILEGE);
					sval.setLastVisitTime((Long.parseLong(sval.getLastVisitTime())+i*Constants.INTERVAL)+"");
				}
				sv.update(sval);
				session.setAttribute("sessionVal", sval);
				msg="恭喜您，成功领取"+i+"票！";
			}else{
				msg="您的领票时间未到，请稍候。";
			}
		}else if(o instanceof Member){
			Member m = (Member)o;
			Member m1 = ms.get(m.getId());
			long time = new Date().getTime() - m1.getLastLoginTime().getTime();
			if( time > Constants.INTERVAL){
				long i = time/Constants.INTERVAL;
				if(i>3) {
					i=3;
					m1.setPrivilege(m1.getPrivilege()+3*Constants.UNREGISTUSERTIMERADDPRIVILEGE);
					m1.setLastLoginTime(new Date());
				}else{
					m1.setPrivilege(m1.getPrivilege()+(int)i*Constants.UNREGISTUSERTIMERADDPRIVILEGE);
					m1.setLastLoginTime(new Date((m1.getLastLoginTime().getTime() + i*Constants.INTERVAL)));
				}
				ms.update(m1);
				session.setAttribute("sessionVal", m1);
				Member mem = (Member) session.getAttribute("member");
				if(mem!=null && mem.getId() == m1.getId()){
					session.setAttribute("member", m1);
				}
				msg="恭喜您，成功领取"+i+"票！";
			}else{
				msg="您的领票时间未到，请稍候。";
			}
		}else{
			msg="您的过长时间未操作，刷新页面后再尝试。";
		}
		return INPUT;
	}
	
	/**
	 * 绑定机器
	 * @return
	 */
	public String bindHost(){
		HttpSession session = getSession();
		Member member = (Member) session.getAttribute("member");
		Object o = session.getAttribute("sessionVal");
		String flag = (String) session.getAttribute("bindflag");
		if(flag!=null && flag.equals("yes")){
			msg = "该机器已经绑定，不允许再次绑定，请您先解除该机器的绑定状态后，再进行绑定!";
			return INPUT;
		}
		if(member == null){
			msg = "用户登录状态出错，请重新登录!";
			return INPUT;
		}
		if(o instanceof Member){
			msg = "该机器已经绑定，不允许再次绑定，请您先解除该机器的绑定状态后，再进行绑定!";
			return INPUT;
		}
		if(o instanceof SessionVal){
			HttpServletResponse response = getResponse();
			SessionVal sessionVal = (SessionVal) o;
			member.setPrivilege(ms.addMemberPrivilege(member.getId(), sessionVal.getPrivilege()));
			member.setLastLoginTime(new Date());
			ms.update(member);
			sv.del(sessionVal.getId());
			addCookie(response, "hostId", member.getUuid(), COOKIEAGE, "/");
			addCookie(response, "memberid", member.getId()+"", COOKIEAGE, "/");
			addCookie(response, "password", member.getPassword(), COOKIEAGE, "/");
			session.setAttribute("sessionVal", member);
			session.setAttribute("bindflag", "yes");
			msg = "恭喜您，绑定成功！";
		}
		return INPUT;
	}
	
	/**
	 * 解除绑定
	 * @return
	 */
	public String unBindHost(){
		HttpSession session = getSession();
		Object o = session.getAttribute("sessionVal");
		String flag = (String) session.getAttribute("bindflag");
		if(flag!=null && flag.equals("no")){
			msg = "该机器还未绑定，无法进行解除绑定!";
			return INPUT;
		}
		if (o == null){
			msg = "该机器未设置host，无法进行解除绑定!";
			return INPUT;
		}
		if (o instanceof SessionVal) {
			msg = "该机器还未绑定，无法进行解除绑定!";
			return INPUT;
		}
		if (o instanceof Member){
			Member m = (Member)o;
			if(m.getPassword().equals(password)){
				HttpServletResponse response = getResponse();
				addNewHostId(getRequest(), getResponse(), session);
				addCookie(response, "memberid", null, 0, "/");
				addCookie(response, "password", null, 0, "/");
				session.setAttribute("bindflag", "no");
				msg =  "恭喜您，解除绑定成功!";
			}else{
				msg = "您输入的密码不正确，无法进行解除绑定!";
			}
		}
		return INPUT;
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
//		if(sv.isTodayLogin(strFromIP)){
//			sval.setPrivilege(0);
//		}else{
//			sval.setPrivilege(Constants.FIRSTLOGINUSERPRIVILEGE);
//		}
		sval.setPrivilege(0);
		sval.setState(1);
		sv.add(sval);
		
		//用户相应信息放入session中
		session.setAttribute("sessionVal", sval);
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
	
	private HttpSession getSession(){
		return ServletActionContext.getRequest().getSession();
	}
	
	private HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	
	private HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public void setSv(SessionValService sv) {
		this.sv = sv;
	}

	public void setNVotes(int votes) {
		nVotes = votes;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
