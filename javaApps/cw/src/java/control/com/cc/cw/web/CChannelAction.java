package com.cc.cw.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.domain.Channel;
import com.cc.cw.service.ChannelService;

@SuppressWarnings("serial")
public class CChannelAction extends CMyAction {

	private ChannelService channelService;

	private List<Channel> list;

	private UrlPage page;

	private String flag;

	private String key;

	private int id;
	
	private int cp;
	
	private Channel channel;
	
	private int tuijian;

	@Override
	public String doExecute() {
		if(StringUtils.equalsIgnoreCase(flag, "tuijian")){
			channelService.tuijian(id, tuijian);
			channel = channelService.getById(id);
			return "message";
		}
		if(StringUtils.equalsIgnoreCase(flag, "screen")){
			channelService.screen(id, 3);
			channel = channelService.getById(id);
			return "message";
		}
		if(StringUtils.equalsIgnoreCase(flag, "unScreen")){
			channelService.screen(id, 1);
			channel = channelService.getById(id);
			return "message";
		}
		if(cp < 1) cp = 1;
		int num = 12;
		int start = (cp - 1) * num;
		int count = 0;
		if(StringUtils.equalsIgnoreCase(flag, "doSearch")){
			count = channelService.countLikeKey(key);
			list = channelService.findLikeKey(key, start, num);
			page = new UrlPage(cp, count, num, "flag=doSearch&key=" + key + "&");
			return SUCCESS;
		}
		count = channelService.count();
		page = new UrlPage(cp, count, num, "");
		list = channelService.find(start, num);
		return SUCCESS;
	}

	public ChannelService getChannelService() {
		return channelService;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<Channel> getList() {
		return list;
	}

	public void setList(List<Channel> list) {
		this.list = list;
	}

	public UrlPage getPage() {
		return page;
	}

	public void setPage(UrlPage page) {
		this.page = page;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public int getTuijian() {
		return tuijian;
	}

	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}

}
