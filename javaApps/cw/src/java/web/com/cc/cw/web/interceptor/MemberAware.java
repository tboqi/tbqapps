package com.cc.cw.web.interceptor;

import com.cc.cw.domain.Member;
import com.opensymphony.xwork.ActionInvocation;

/**
 * 会员感知器，对于需要获取登录会员信息的action，应实现该接口.
 * 
 *  {@link AuthenticationInterceptor#intercept(ActionInvocation)} 
 *
 * @author <a href="mailto:xiat@ruc.edu.cn">Gavin XIA</a>
 * @version 1.0
 * @date 2006-7-10 16:46:34
 */
public interface MemberAware {
	public void setMember(Member member);
}
