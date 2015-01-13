package com.cc.cw.web;

import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.service.VoteService;

public class VoteResultTaske implements ServletContextListener{
	protected final Log log = LogFactory.getLog(getClass());
	private java.util.Timer timer = null;

	public void contextInitialized(ServletContextEvent event) {
		log.info("timer start");
		timer = new java.util.Timer(true);
		final ServletContextEvent e = event;
		timer.schedule(new TimerTask(){
			public void run(){
				WebApplicationContext ctx = 
					WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
				VoteService vs = (VoteService)ctx.getBean("voteService");
				vs.voteFinishProcess();
			}
		}, 0, 60*60*1000);
	}

	public void contextDestroyed(ServletContextEvent event) {
		timer.cancel();
		log.debug("timer cancel");
	}
}
