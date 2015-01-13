package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cc.cw.domain.AtomLabel;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.DateTimeUtil;

public class SiteMapAction extends SessionActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SimpleArticleService simpleArticleService;
	private ChannelService channelService;
	private AtomLabelService atomLabelService;
	private MemberService memberService;
	
	private List<SimpleArticle> articleList;
	private List<Channel> channelList;
	private List<AtomLabel> labelList;
	private List<Member> memberlList;
	
	private String flag;
	private String datetime;

	@SuppressWarnings("unchecked")
	public String execute(){
		datetime = DateTimeUtil.parseDateToString(new Date(), "yyyy-MM-dd");
		if(flag == null || flag.trim().equals("")){
			return SUCCESS;
		}
		if(flag !=null && flag.trim().equals("all")){
			hotChannel();
			hotTag();
			hotUser();
			flag = "article";
		}
		if(flag !=null && flag.trim().equals("article")){
			Set<SimpleArticle> set = new HashSet<SimpleArticle>();
			set.addAll(monthHot());
			set.addAll(weekHot());
			set.addAll(hotArticle(1,30));
			int count = 120 - set.size();
			for (int i = 0; i < (count/20)+1; i++) {
				set.addAll(hotArticle(2+i,20));
			}
			articleList = new ArrayList<SimpleArticle>();
			articleList.addAll(set);
			return SUCCESS;
		}
		if(flag !=null && flag.trim().equals("channel")){
			return hotChannel();
		}
		if(flag !=null && flag.trim().equals("tag")){
			return hotTag();
		}
		if(flag !=null && flag.trim().equals("user")){
			return hotUser();
		}
		return SUCCESS;
	}
	public List<SimpleArticle> monthHot(){
		return simpleArticleService.getMonthHottestArticles(1, 20);
	}
	public List<SimpleArticle> weekHot(){
		return this.simpleArticleService.getWeekHottestArticles(1, 30);
	}
	public List<SimpleArticle> hotArticle(int page, int count){
		return simpleArticleService.getHottestArticles(page,count);
	}
	public String hotChannel(){
		channelList = channelService.getHotChannels(1, 10);
		return SUCCESS;
	}
	public String hotTag(){
		labelList = atomLabelService.getHotAtomLabel(1, 10);
		return SUCCESS;
	}
	public String hotUser(){
		memberlList = memberService.getActivityMember(1,10);
		return SUCCESS;
	}
	public List<SimpleArticle> getArticleList() {
		return articleList;
	}
	public List<Channel> getChannelList() {
		return channelList;
	}
	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}
	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public void setAtomLabelService(AtomLabelService atomLabelService) {
		this.atomLabelService = atomLabelService;
	}
	public List<AtomLabel> getLabelList() {
		return labelList;
	}
	public List<Member> getMemberlList() {
		return memberlList;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}
