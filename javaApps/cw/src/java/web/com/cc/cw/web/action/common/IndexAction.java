package com.cc.cw.web.action.common;

import com.cc.cw.search.index.ArticleIndexService;
import com.cc.cw.search.index.ChannelIndexService;
import com.cc.cw.search.index.LabelIndexService;
import com.cc.cw.search.index.RemarkIndexService;

public class IndexAction extends BaseActionSupport {

	private static final long serialVersionUID = 7398570904455144975L;
	
	private ArticleIndexService articelService;
	private ChannelIndexService channelService;
	private LabelIndexService labelService;
	private RemarkIndexService remarkService;
	
	public String execute(){
		if(true){
			log.info("unknown call of index start...");
			return NONE;
		}
		boolean complete = false;
		complete = articelService.index();
			log.info("index article completed ....................");
		if(complete){
			complete = false;
			complete = channelService.index();
			log.info("index channel completed ....................");
		}
		if(complete){
			complete = false;
			complete = labelService.index();
			log.info("index cwLabel completed ....................");
		}
		if(complete){
			complete = false;
			complete = remarkService.index();
			log.info("index remark completed ....................");
		}
		
		
		if(complete){
			complete = articelService.deleteOldIndex();
			log.info("delete article oldindex completed ....................");
		}
		if(complete){
			complete = false;
			complete = channelService.deleteOldIndex();
			log.info("delete channel oldindex completed ....................");
		}
		if(complete){
			complete = false;
			complete = labelService.deleteOldIndex();
			log.info("delete cwLabel oldindex completed ....................");
		}
		if(complete){
			complete = false;
			complete = remarkService.deleteOldIndex();
			log.info("delete remark oldindex completed ....................");
		}
		return NONE;
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
