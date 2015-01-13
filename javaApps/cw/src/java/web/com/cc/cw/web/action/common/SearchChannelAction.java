package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.URLCoderUtil;
import com.opensymphony.webwork.ServletActionContext;

public class SearchChannelAction extends BaseActionSupport {

	private static final long serialVersionUID = 2023329157547394376L;
	private ChannelService channelService;
	private MemberService memberSerivce;
	private List<Map<String,Object>> rs;
	private String qs;
	private int pn;
	private String pagnation;

	public String execute(){
		List<Channel> channelList = channelService.search(qs, pn, 10);
		int total = 0;
		if(channelList != null && channelList.size() > 0){
			rs = new ArrayList<Map<String,Object>>();
			for(Channel channel : channelList){
				Map<String,Object> map = new HashMap<String,Object>();
				String title = Convert.getText(channel.getName());
				title = title.replaceAll(qs, "<font color=red>"+qs+"</font>");
				channel.setName(title);
				String content = Convert.getText(channel.getDescription());
				content = content.replaceAll(qs, "<font color=red>"+qs+"</font>");
				channel.setDescription(content);
				map.put("channel", channel);
				Member member = memberSerivce.get(channel.getMemberId());
				map.put("member", member);
				
				rs.add(map);
			}
			total = channelService.searchCount(qs);
		}
		
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/search/search.action?qs="+URLCoderUtil.encode(qs,"UTF-8")+"&search=channel&");
		pagnation = p.getPagination();
		return SUCCESS;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getQs() {
		return qs;
	}

	public void setQs(String qs) {
		this.qs = qs;
	}

	public String getPagnation() {
		return pagnation;
	}

	public List<Map<String, Object>> getRs() {
		return rs;
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public void setMemberSerivce(MemberService memberSerivce) {
		this.memberSerivce = memberSerivce;
	}
}
