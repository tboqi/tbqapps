package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.ArticleHelper;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionSupport;

public class WeekListAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	public List articleMapList;
	private int pn;
	
	private SimpleArticleService sas;
	private String pagnation;
	private MemberService ms;
	private LabelService ls;
	private ChannelService cs;
	private List<Channel> hotChannelList;
	private List<SimpleArticle> newList;
	
	public List<SimpleArticle> getNewList() {
		return newList;
	}

	@SuppressWarnings("unchecked")
	public String execute(){
		hotChannelList = cs.getHotChannels(1, 10);
		newList = sas.getNewArticles(1, 10);
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getWeekHottestArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/againstlist.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getWeekHottestArticles(pn, 10);
		if(list != null && list.size() > 0){
			if(articleMapList == null)
				articleMapList = new ArrayList<Map>();
			for(SimpleArticle sa : list){
				if(sa == null)continue;
				String title = sa.getTitle();
				String content = sa.getContent();
				if(title==null)title="无标题";
				title = Convert.getHtmlRealText(title);
				if(content==null)content="无内容";
				content=Convert.getHtmlRealText(content);
				if(content.length()>100)content=content.substring(0,100)+"...";
				Map map = new HashMap();
				map.put("articleId", sa.getId());
				map.put("articleTitle", title);
				map.put("articleContent",content);
				map.put("member", ms.get(sa.getMemberId()));
				map.put("label", ls.getContentByArticleId(sa.getId()));
				map.put("channelId", sa.getChannelId());
				map.put("rate", sa.getRate());
				map.put("state", sa.getState());
				map.put("voteResultType", sa.getVoteResultType());
				String imgSrc = ArticleHelper.getCoverSrc(sa.getContent());
				if(imgSrc == null || imgSrc.equals(""))
					imgSrc = "";
				map.put("imgSrc" , imgSrc);
				articleMapList.add(map);
			}
		}
		return SUCCESS;
	}
	
	/*get set */

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public List getArticleMapList() {
		return articleMapList;
	}

	public String getPagnation() {
		return pagnation;
	}

	public void setSas(SimpleArticleService sas) {
		this.sas = sas;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public void setLs(LabelService ls) {
		this.ls = ls;
	}

	public void setCs(ChannelService cs) {
		this.cs = cs;
	}

	public List<Channel> getHotChannelList() {
		return hotChannelList;
	}
}
