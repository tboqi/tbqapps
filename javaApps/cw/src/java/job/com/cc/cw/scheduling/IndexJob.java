package com.cc.cw.scheduling;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cc.cw.search.index.ArticleIndexService;
import com.cc.cw.search.index.ChannelIndexService;
import com.cc.cw.search.index.LabelIndexService;
import com.cc.cw.search.index.RemarkIndexService;

public class IndexJob extends QuartzJobBean {
	private static final long serialVersionUID = -3518173358325712229L;

	Log log = LogFactory.getLog(IndexJob.class);
	
	@SuppressWarnings("unused")
	private ArticleIndexService articelService;
	@SuppressWarnings("unused")
	private ChannelIndexService channelService;
	@SuppressWarnings("unused")
	private LabelIndexService labelService;
	@SuppressWarnings("unused")
	private RemarkIndexService remarkService;

	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		@SuppressWarnings("unused") boolean complete = false;
//		complete = articelService.index();
//			log.info("index article completed ....................");
//		if(complete){
//			complete = false;
//			complete = channelService.index();
//			log.info("index channel completed ....................");
//		}
//		if(complete){
//			complete = false;
//			complete = labelService.index();
//			log.info("index cwLabel completed ....................");
//		}
//		if(complete){
//			complete = false;
//			complete = remarkService.index();
//			log.info("index remark completed ....................");
//		}
//		
//		
//		if(complete){
//			complete = articelService.deleteOldIndex();
//			log.info("delete article oldindex completed ....................");
//		}
//		if(complete){
//			complete = false;
//			complete = channelService.deleteOldIndex();
//			log.info("delete channel oldindex completed ....................");
//		}
//		if(complete){
//			complete = false;
//			complete = labelService.deleteOldIndex();
//			log.info("delete cwLabel oldindex completed ....................");
//		}
//		if(complete){
//			complete = false;
//			complete = remarkService.deleteOldIndex();
//			log.info("delete remark oldindex completed ....................");
//		}
	}
	

	public void setArticelService(ArticleIndexService articelService) {
		this.articelService = articelService;
	}

	public void setChannelService(ChannelIndexService channelService) {
		this.channelService = channelService;
	}

	public void setLabelService(LabelIndexService labelService) {
		this.labelService = labelService;
	}

	public void setRemarkService(RemarkIndexService remarkService) {
		this.remarkService = remarkService;
	}
	
}
