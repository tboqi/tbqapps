package com.xiaoshuo.stock.web.listener;

import java.util.Calendar;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.util.HexunNewsThread;
import com.xiaoshuo.stock.web.StockBuilder;

public class SampleTask  extends TimerTask{
	  @SuppressWarnings("unused")
	private static Log log = LogFactory.getLog(SampleTask.class);
	  @SuppressWarnings("unused")
	private ServletContext context;
	  
	  public SampleTask(ServletContext context){
	      this.context = context;
	  }
	  
	  public void run() {
		  runDown();
		  runNews();
	   }

	  private static boolean isDowning = false;
	  public void runDown(){
	      if (!isDowning) {
		      Calendar cal = Calendar.getInstance();
	          if ((9<=cal.get(Calendar.HOUR_OF_DAY) && 16>cal.get(Calendar.HOUR_OF_DAY))
	        		  && 1<=cal.get(Calendar.DAY_OF_WEEK)
	        		  && 5>=cal.get(Calendar.DAY_OF_WEEK)){
		    	  isDowning = true;
		    	  System.out.println("gupiao start task");
	              //此处添加下载任务
	              StockBuilder.startTask();
	              isDowning = false;
	              System.out.println("gupiao end ttask");
	          }
	      } else {
	    	  System.out.println("preview gupiao task is runing");
	      }
	        
	  }

	  private static boolean isDownNewsing = false;
	  public void runNews(){
	      if (!isDownNewsing) {
		      Calendar cal = Calendar.getInstance();
	          if ((22==cal.get(Calendar.HOUR_OF_DAY))){
	        	  isDownNewsing = true;
		    	  System.out.println("gupiao start get news");
	              //此处添加下载任务
	              HexunNewsThread.startGetNews();
	              isDownNewsing = false;
	              System.out.println("gupiao end get news");
	          }
	      } else {
	    	  System.out.println("preview gupiao get news is runing");
	      }
	        
	  }

}