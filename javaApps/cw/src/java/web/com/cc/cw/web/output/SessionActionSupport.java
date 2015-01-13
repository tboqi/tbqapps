package com.cc.cw.web.output;

import java.util.Map;

import com.opensymphony.webwork.interceptor.SessionAware;

/**
 * BaseActionSupport的支持session处理的继承类，可以在该类中实现特定方法，方便子类处理
 *
 * @author <a href="mailto:xiat@ruc.edu.cn">Gavin XIA</a>
 * @version 1.0
 * @date 2006-7-9 23:30:56
 */
@SuppressWarnings("unchecked")
public class SessionActionSupport extends BaseActionSupport implements SessionAware {

	private static final long serialVersionUID = -6794631296621687486L;
	protected Map session;
	
	/**
	 * 设置session，供其他地方使用
	 */
	public void setSession(Map session) {
		this.session = session;
	}
	
}
