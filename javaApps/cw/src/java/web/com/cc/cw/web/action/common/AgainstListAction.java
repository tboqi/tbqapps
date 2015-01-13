package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.data.GlobalData;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionSupport;

/**
 * 反对有理
 * @author dzh
 * 上午11:49:07
 */
@SuppressWarnings("unchecked")
public class AgainstListAction extends ActionSupport{

	private static final long serialVersionUID = 5356312423073799527L;

	public List articleMapList;
	private int pn;
	
	private SimpleArticleService sas;
	private String pagnation;
	private MemberService ms;
	private LabelService ls;
	private ChannelService cs;
	private List<Channel> hotChannelList;
	private List<SimpleArticle> weekList;
	/** 获取静态全局数据的工具类 */
	private GlobalData globalData;
	
	private static final String SUPPORT = "support";
	private List<Channel> myChannelList;
	
	public String execute(){
		HttpServletRequest request	= ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		if(member != null){
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			myChannelList = cs.getByMemberId(1, count, member.getId());
		}
//		weekList =(List) GlobalData.globalData.get("weekList");
		weekList = globalData.getWeekList();
		hotChannelList = cs.getHotChannels(1, 10);
		if(pn==0)
			pn = 1;
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getUnsupportArticleCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/againstlist.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getUnsupportArticles(pn, 10);
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
	
	public String support(){
		HttpServletRequest request	= ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		if(member != null){
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			myChannelList = cs.getByMemberId(1, count, member.getId());
		}
		hotChannelList = cs.getHotChannels(1, 10);
//		weekList =(List) GlobalData.globalData.get("weekList");
		weekList = globalData.getWeekList();
		if(pn==0)
			pn = 1;
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getSupportArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/supportlist?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getSupportArticles(pn, 10);
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
		return SUPPORT;
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

	public List<SimpleArticle> getWeekList() {
		return weekList;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}

	public List<Channel> getMyChannelList() {
		return myChannelList;
	}

	public void setMyChannelList(List<Channel> myChannelList) {
		this.myChannelList = myChannelList;
	}

}
