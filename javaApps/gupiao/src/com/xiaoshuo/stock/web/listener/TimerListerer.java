package com.xiaoshuo.stock.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TimerListerer  implements ServletContextListener {
	private static Log log = LogFactory.getLog(TimerListerer.class);

    private java.util.Timer timer = null;
    private SampleTask sampleTask = null; 

    public void contextInitialized(ServletContextEvent event) {
        // todo auto-generated method stub
        timer = new java.util.Timer(true);
        sampleTask =  new SampleTask(event.getServletContext());
        System.out.println("gupiao timer started");
        timer.schedule(sampleTask, 0, 1 * 5 * 60 * 1000);
        System.out.println("gupiao task added");
    }

 

    public void contextDestroyed(ServletContextEvent event) {
        // todo auto-generated method stub
        timer.cancel();
        log.info("¶¨Ê±Æ÷Ïú»Ù");
    }
}
