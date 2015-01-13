package com.cc.cw.web.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.ClickLog;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.service.ClickLogService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

/**
 * 负责记录用户点击信息的拦截器
 * @author dzh
 * 下午02:19:15
 */
public class ClickLogInterceptor implements Interceptor {

	private static final long serialVersionUID = 8432103547958046132L;
	protected transient Log log = LogFactory.getLog(getClass());
	
	private ClickLogService logService;
	@SuppressWarnings("unused")
	private SimpleArticleService articleService;
	private MemberService memberService;
	
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;

	public void destroy() {}

	public void init() {}

	public String intercept(ActionInvocation action) throws Exception {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		session = request.getSession();
		int articleId = 0;
		try{
			articleId = Integer.parseInt(request.getParameter("articleId"));
		}catch(Exception e){
			return action.invoke();
		}
//		SimpleArticle sa = articleService.getById(articleId);
		String uuid = (String) session.getAttribute("uuid");
		if(uuid != null) {
			try{
				new SimpleThread(articleId,uuid).start();
			}catch(Exception e){
				return action.invoke();
			}
		}
		return action.invoke();
	}
	
	class SimpleThread extends Thread{
		int sa = 0;
		String uuid = null;
		public SimpleThread(int sa,String uuid){
			this.sa = sa;
			this.uuid = uuid;
		}
		public void run() {
			addLog(sa,uuid);
		}
	}
	/**
	 * 保存用户点击记录
	 * @param sa
	 * @return
	 */
	private synchronized int addLog(int sa,String uuid){
		if(sa > 0){
			/*List<String> labelList = labelService.getContentByArticleId(sa.getId());
			StringBuffer sb = new StringBuffer();
			for(String label : labelList){
				sb.append(label);
				sb.append(" ");
			}*/
			
//			String uuid = getUUID();
			//检查是否存在相同记录，即：同一用户访问同一资源
			boolean exist = logService.haveSameRecord(uuid, sa);
			
			if(!exist){
				ClickLog cLog = new ClickLog();
				cLog.setArticleId(sa);
				cLog.setCategory("");
				cLog.setChannelId(0);
				cLog.setClickTime(new Date());
				cLog.setKeyword("");
				cLog.setTags("");
				cLog.setUuid(uuid);
				
				return logService.add(cLog);
			}else{
				logService.updateClickTime(uuid,sa,new Date());
			}
		}
		return 0;
	}
	
	/**
	 * 获得UUID
	 * @return
	 */
	@SuppressWarnings("unused")
	private String getUUID(){
		Member member = (Member)session.getAttribute("member");
		//如果是注册用户，则返回数据库中的UUID
		if(member != null){
			//log.info("member not null , uuid === "+member.getUuid());
			if(member.getUuid().equals("0")){
				String uuid = (String)session.getAttribute("uuid");
				memberService.updateUUID(member.getId(), uuid);
			}
			return member.getUuid();
		}
		else{
			//非注册用户，则从session中获得UUID
			String uuid = (String)session.getAttribute("uuid");
			if(uuid != null && !uuid.equals("")){
				//log.info("member is null, session's uuid === "+uuid);
				return uuid;
			}else{
				Object o = session.getAttribute("sessionVal");
				if(o != null){
					if (o instanceof SessionVal) {
						uuid = ((SessionVal)o).getHostId();
						session.setAttribute("uuid", uuid);
					}else if(o instanceof Member){
						uuid = ((Member)o).getUuid();
						session.setAttribute("uuid", uuid);
					}
				}else{
					//初次访问的用户，创建一个UUID
					uuid = HashUtil.getUUID();
					//log.info("both member and session are all null , new uuid === "+uuid);
					response.addCookie(new Cookie("hostId",uuid));
					session.setAttribute("uuid", uuid);
				}
				return uuid;
			}
		}
	}

	//所有set get 方法
	public void setLogService(ClickLogService logService) {
		this.logService = logService;
	}
	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}
