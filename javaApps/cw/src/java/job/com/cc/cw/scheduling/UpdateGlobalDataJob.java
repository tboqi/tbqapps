package com.cc.cw.scheduling;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cc.cw.web.data.GlobalData;

public class UpdateGlobalDataJob extends QuartzJobBean {
	Log log = LogFactory.getLog(UpdateGlobalDataJob.class);
	@SuppressWarnings("unused")
	private GlobalData data;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		log.info("data job start ... ");
//		data.updateWeekArticles();
//		data.updateYestodayArticles();
	}
	
	public void setData(GlobalData data) {
		this.data = data;
	}

}
