package com.cc.cw.web.util;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CookieHandle {

	static Log log = LogFactory.getLog(CookieHandle.class);
	
	/**
	 * 从cookie中取uuid，如果没有取到，则创建一个新的uuid，并添加到response中
	 * 最后返回这个uuid
	 * @param request
	 * @param response
	 * @return
	 */
	public static String getUUID(HttpServletRequest request,HttpServletResponse response){
		Cookie [] cookies = request.getCookies();
		String uuid = "";
		if(cookies != null)
			for(Cookie ck : cookies){
				String name = ck.getName();
				if( name!=null && !name.trim().equals("") && name.trim().equals("uuid")){
					uuid = ck.getValue();
				}
			}
		if(uuid == null || uuid.trim().equals("")){
			uuid = UUID.randomUUID().toString();
			uuid = uuid.replaceAll("-", "");
			response.addCookie(new Cookie("uuid",uuid));
		}
		log.info("uuid is --> " + uuid);
		return uuid;
	}
	
	public static void main(String [] args){
		
	}
}
