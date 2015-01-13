package com.cc.cw.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AjaxProcessor {
	String ENCODER = "UTF-8";
	public void process(HttpServletRequest request, HttpServletResponse response);
}
