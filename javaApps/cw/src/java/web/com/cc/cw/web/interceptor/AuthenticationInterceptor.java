package com.cc.cw.web.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.domain.Member;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.Action;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

/**
 * 安全验证的拦截器，如需要通过验证才可以访问的页面可以加入该拦截器即可
 *
 * @author <a href="mailto:xiat@ruc.edu.cn">Gavin XIA</a>
 * @version 1.0
 * @date 2006-7-10 16:39:14
 */
public class AuthenticationInterceptor implements Interceptor {
	
	private static final long serialVersionUID = -5317824930413416698L;
	
	protected Log log = LogFactory.getLog(getClass());

	/** 会员登录后保存到session中的会员对象的引用名称 */
	public static final String MEMBER = "member"; 
	
	public void destroy() {		

	}

	public void init() {		

	}

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Map session = actionInvocation.getInvocationContext().getSession();
		Member member = (Member)session.get(MEMBER);
		if(member==null){
			HttpServletRequest request = ServletActionContext.getRequest();
			String requestPageUri = request.getServletPath() + (request.getQueryString() == null ? "" : "?" +request.getQueryString());
			session.put("requestPageUri", requestPageUri);
			log.info("requestPageUri --> " + requestPageUri);
			return Action.LOGIN;
		}else{
			Action action = (Action) actionInvocation.getAction();
			if(action instanceof MemberAware){
				((MemberAware)action).setMember(member);
			}
			
			return actionInvocation.invoke();
		}
	}

}
