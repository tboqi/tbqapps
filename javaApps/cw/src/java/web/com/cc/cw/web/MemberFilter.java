package com.cc.cw.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cc.cw.domain.Member;

public class MemberFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		Member member = (Member)req.getSession().getAttribute("member");
		if(member == null){
			req.getSession().setAttribute("requestPageUri", req.getServletPath() + (req.getQueryString() == null ? "" : "?" +req.getQueryString()));
			((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/jsp/login.jsp");
		}else{
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
