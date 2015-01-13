package com.cc.cw.web.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.util.FileUtil;
import com.cc.cw.web.CwConfiguration;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

public class CooperateInterceptor implements Interceptor {

	private static final long serialVersionUID = 7525706351171394548L;
	protected transient Log log = LogFactory.getLog(getClass());
	protected static final String REFERROOT = CwConfiguration.create().get("refer.dir");
//	private static final String FILESEPARATOR = System.getProperty("file.separator");
	
	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String site = request.getParameter("site");
		String myIP = "";
		myIP = request.getHeader("x-forwarded-for");
		if(myIP == null || myIP.length() == 0 || "unknown".equalsIgnoreCase(myIP)) {
				myIP = request.getHeader("Proxy-Client-IP");
		}
		if(myIP == null || myIP.length() == 0 || "unknown".equalsIgnoreCase(myIP)) {
				myIP = request.getHeader("WL-Proxy-Client-IP");
		}
		if(myIP == null || myIP.length() == 0 || "unknown".equalsIgnoreCase(myIP)) {
				myIP = request.getRemoteAddr();
		}
		String curMonth = DateTimeUtil.parseDateToString(new Date(),"yyyy-MM");
		String logFileName = DateTimeUtil.parseDateToString(new Date(),"yyyyMMdd");
		FileUtil.writeLog(REFERROOT + site + "/", curMonth + "/" + logFileName + ".log", myIP);

		return arg0.invoke();
	}
	
}
