package com.cc.cw.web.interceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.xwork.interceptor.Interceptor;

/**
 * 创建uuid拦截器
 * @author dzh
 * 下午03:16:42
 */
public class CreateUUIDInterceptor implements Interceptor {

	private static final long serialVersionUID = -7134342869063436306L;
	Log log = LogFactory.getLog(CreateUUIDInterceptor.class);

	public String intercept(ActionInvocation action) throws Exception {
		log.info("in CreateUUIDInterceptor....");
		return action.invoke();
	}
	
	public void destroy() {}

	public void init() {}

}
