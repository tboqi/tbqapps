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
import com.cc.cw.web.data.AdvertiseData;
import com.cc.cw.web.data.GlobalData;
import com.opensymphony.webwork.ServletActionContext;

public class ChannelListAction extends SessionActionSupport{

	private static final long serialVersionUID = -947168277978391167L;
	
	//action所需服务
	private ChannelService cs;
	private SimpleArticleService sas;
	private MemberService ms;
	private LabelService ls;
	
	private Channel channel;
	
	private int chlId;
	
	private int pn;
	
	/** 本周焦点 */
	private List<SimpleArticle> weekList;
	/** 精彩频道 */
	private List<Channel> hotChannelList;
	
	//页面数据
	@SuppressWarnings("unchecked")
	private List<Map> articleMapList;
	
	private String articlePagnation;
	/** 获取静态全局数据的工具类 */
	private GlobalData globalData;

	/** 获得频道页面广告列表 */
	private List<Map<String,String>> adsList;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		channel = cs.getById(chlId);
		if(channel == null){
			return SUCCESS;
		}
		if(pn == 0){
			pn = 1;
		}
//		weekList =(List) GlobalData.globalData.get("weekList");
		weekList = globalData.getWeekList();
		hotChannelList = cs.getHotChannels(1, 10);
		HttpServletRequest request = ServletActionContext.getRequest();
		List<SimpleArticle> articleList = sas.getArticlesByChannelId(chlId, pn,10);
		Pagination pg = new Pagination();
		pg.setCurrentPage(pn);
		pg.setRowsCount(sas.getArticlesCountByChannelId(chlId));
		pg.setRowsPerPage(10);
		pg.setUrl(request.getContextPath() + "/channelarticlelist.action?chlId="+chlId+"&");
		articlePagnation = pg.getPagination();
		if(articleList != null && articleList.size() > 0){
			if(articleMapList == null)
				articleMapList = new ArrayList<Map>();
			for(SimpleArticle sa : articleList){
				if(sa == null)continue;
				String imgSrc = ArticleHelper.getCoverSrc(sa.getContent());
				String title = sa.getTitle();
				String content = sa.getContent();
				if(title==null)title="无标题";
				title = Convert.getHtmlRealText(title);
				if(content==null)content="无内容";
				content=Convert.getHtmlRealText(content);
				if(content.length()>100)content=content.substring(0,100)+"...";
				if(imgSrc == null || imgSrc.equals(""))
					imgSrc = "/images/chuanwen.gif";
				Map map = new HashMap();
				map.put("articleId", sa.getId());
				map.put("articleTitle", title);
				map.put("voteResultType", sa.getVoteResultType());
				map.put("articleContent",content);
				map.put("state", sa.getState());
				map.put("rate", sa.getRate());
				map.put("imgSrc" , imgSrc);
				map.put("member", ms.get(sa.getMemberId()));
				map.put("label", ls.getContentByArticleId(sa.getId()));
				map.put("createDate",sa.getCreateDate());
				articleMapList.add(map);
			}
		}
		
		//获得广告
		adsList = AdvertiseData.getAds("channel");
		return SUCCESS;
	}
	
	//所有数据get set 方法
	public void setCs(ChannelService cs) {
		this.cs = cs;
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

	@SuppressWarnings("unchecked")
	public List<Map> getArticleMapList() {
		return articleMapList;
	}

	public int getChlId() {
		return chlId;
	}

	public void setChlId(int chlId) {
		this.chlId = chlId;
	}
	
	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getArticlePagnation() {
		return articlePagnation;
	}

	public Channel getChannel() {
		return channel;
	}

	public List<SimpleArticle> getWeekList() {
		return weekList;
	}

	public List<Channel> getHotChannelList() {
		return hotChannelList;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}
	
	public List<Map<String, String>> getAdsList() {
		return adsList;
	}

}
