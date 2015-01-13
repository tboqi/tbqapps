package com.cc.cw.scheduling;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cc.cw.web.data.StaticNewArticles;

public class NewArticlesJob extends QuartzJobBean {
	Log log = LogFactory.getLog(NewArticlesJob.class);
	private StaticNewArticles sna;

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
//		log.info("data job start ... ");
		sna.updateNewArticles();
	}

	public void setSna(StaticNewArticles sna) {
		this.sna = sna;
	}

	
}
