package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.UserLabelService;
import com.cc.cw.service.VoteService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.data.GlobalData;
import com.opensymphony.webwork.ServletActionContext;

/**
 * 文章列表action
 * 负责所有文章列表页面的数据
 * @author dzh
 * 下午08:57:55
 */
public class ListAction extends SessionActionSupport{
	
	private static final long serialVersionUID = 7383919135174694221L;
	/** action result name  <result name="result" type="freemarker">{path}</result> */
	private String PAGE = "page";
	/** result参数 */
	private String path;
	/** 最新文章列表页面 */
	private static String NEW_ARTICLE_LIST = "/ftl/new_article_list.ftl";
	/** 最热文章列表页面 */
	private static String HOT_ARTICLE_LIST = "/ftl/hot_article_list.ftl";
	
	/** 本月最热文章列表 */
	private static String MONTH_ARTICLE_LIST = "/ftl/month_article_list.ftl";
	/** 本周最热文章列表 */
	private static String WEEK_ARTICLE_LIST = "/ftl/week_article_list.ftl";
	/** 精彩回顾文章列表 */
	private static String REVIEW_ARTICLE_LIST = "/ftl/review_article_list.ftl";
	
	private static String CHANNEL_LIST = "/ftl/channel_list.ftl";
	
	private static String FAVORITE_ARTICLE_LIST = "/ftl/favorite_article_list.ftl";
	
	// new_article_list.ftl
	/** 本周焦点 */
	private List<SimpleArticle> weekList;
	/** 精彩频道 */
	private List<Channel> hotChannelList;
	
	// channel_list.ftl
	/** 本月最热 */
	private List<SimpleArticle> monthList;
	/** 最新频道 */
	private List<Channel> newChannelList;
	/** 位于最新文章列表页面右上角的图片文章 */
	private SimpleArticle newArticle;
	
	//所需服务
	private SimpleArticleService sas;
	private LabelService ls;
	@SuppressWarnings("unused")
	private ChannelService cs;
	private MemberService ms;
	
	private UserLabelService ulService;
	
	@SuppressWarnings("unchecked")
	private List<Map> articleMapList;
	
	@SuppressWarnings("unchecked")
	private List<Map> channelMapList;
	
	//页面所需数据
	private Member member;
	/** 页数 */
	private int pn;
	private String pagnation;
	/** 我所有的频道 */
	private List<Channel> myChannelList;
	
	private List activityMemberList;
	/** 获取静态全局数据的工具类 */
	private GlobalData globalData;
	private VoteService voteService;

	/**
	 * 根据action的名字，来决定调用哪个方法，将文章列表数据初始化
	 */
	public String execute(){
		member = (Member)session.get("member");
		
		HttpServletRequest request	= ServletActionContext.getRequest();
		
		String servletPath = request.getServletPath();
		//log.info("servletPath --> " + servletPath);
		
		if(servletPath != null && !servletPath.equals("")){
			if(servletPath.equals("/newslist.action")){
				getNewArticleList();
				path = NEW_ARTICLE_LIST;
			}else if(servletPath.equals("/hotslist.action")){
				getHotArticleList();
				path = HOT_ARTICLE_LIST;
			}else if(servletPath.equals("/monthlist.action")){
				getMonthArticleList();
				path = MONTH_ARTICLE_LIST;
			}else if(servletPath.equals("/weeklist.action")){
				getWeekArticleList();
				path = WEEK_ARTICLE_LIST;
				
			}else if(servletPath.equals("/reviewlist.action")){
				getReviewArticleList();
				path = REVIEW_ARTICLE_LIST;
			}else if(servletPath.equals("/channellist.action")){
				getChannelList();
				path = CHANNEL_LIST;
			}else if(servletPath.equals("/favoritearticles.action")){
				getFavoriteList();
				path = FAVORITE_ARTICLE_LIST;
			}else{
				getNewArticleList();
				path = NEW_ARTICLE_LIST;
			}
		}else{
			
		}
		
		//log.info("path --> " + path);
		return PAGE;
		
	}
	
	/**
	 * 本周最热文章列表
	 */
	@SuppressWarnings("unchecked")
	public void getWeekArticleList(){
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getWeekHottestArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/weeklist.action?");
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
				map.put("rate", sa.getRate());
				articleMapList.add(map);
			}
		}
	}
	
	/**
	 * 精彩回顾文章列表
	 */
	@SuppressWarnings("unchecked")
	public void getReviewArticleList(){
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getReviewCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/reviewlist.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getReview(pn, 10);
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
				map.put("rate", sa.getRate());
				articleMapList.add(map);
			}
		}
	}
	
	/**
	 * 最新文章
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void getNewArticleList(){
		member = (Member)session.get("member");
		if(member != null){
			session.remove("requestPageUri");//清空session
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			myChannelList = cs.getByMemberId(1, count, member.getId());
		}
//		weekList =(List) GlobalData.globalData.get("weekList");
		weekList = globalData.getWeekList();
		hotChannelList = cs.getHotChannels(1, 10);
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getNewArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/newslist.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getNewArticles(pn, 10);
		if(list != null && list.size() > 0){
			if(articleMapList == null)
				articleMapList = new ArrayList<Map>();
			for(SimpleArticle sa : list){
				if(sa == null)continue;
				String title = sa.getTitle();
				String content = sa.getContent();
				String imgSrc = ArticleHelper.getCoverSrc(sa.getContent());
				content = Convert.getHtmlRealText(sa.getContent());
				content = content.length() > 100 ? content.substring(0,100)+"...":content;
				if(imgSrc == null || imgSrc.equals(""))
					imgSrc = "";
				else{
					newArticle = sa;
					newArticle.setImgSrc(imgSrc);
					newArticle.setContent(content);
				}
				
				int rate = sa.getRate();
				if(title==null)title="无标题";
				title = Convert.getHtmlRealText(title);
				if(content==null)content="无内容";
				content=Convert.getHtmlRealText(content);
				if(content.length()>100)content=content.substring(0,100)+"...";
				Map map = new HashMap();
				map.put("articleId", sa.getId());
				map.put("articleTitle", title);
				map.put("articleContent",content);
				map.put("createDate", String.format("%1$tY-%1$tm-%1$td %1$tT",sa.getCreateDate()));
				map.put("member", ms.get(sa.getMemberId()));
				map.put("label", ls.getContentByArticleId(sa.getId()));
				map.put("channelId", sa.getChannelId());
				map.put("rate", rate);
				map.put("state", sa.getState());
				map.put("voteResultType", sa.getVoteResultType());
				map.put("imgSrc" , imgSrc);
				articleMapList.add(map);
			}
		}
	}
	
	/**
	 * 最热文章
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void getHotArticleList(){
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getHottestArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/hotslist.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getHottestArticles(pn, 10);
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
				map.put("rate", sa.getRate());
				map.put("member", ms.get(sa.getMemberId()));
				map.put("label", ls.getContentByArticleId(sa.getId()));
				articleMapList.add(map);
			}
		}
	}
	
	/**
	 * 本月最热文章列表
	 */
	@SuppressWarnings("unchecked")
	public void getMonthArticleList(){
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getMonthHottestArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/monthlist.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = globalData.getMonthList();
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
				map.put("rate", sa.getRate());
				articleMapList.add(map);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public void getFavoriteList(){
//		weekList =(List) GlobalData.globalData.get("weekList");
		weekList = globalData.getWeekList();
		hotChannelList = cs.getHotChannels(1, 10);
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		String uuid = "";
		member = (Member)session.get("member");
		int memberId = 0;
		if(member != null){
			uuid = member.getUuid();
			memberId = member.getId();
			//获得用户频道列表
			int count = cs.getChannelCountByMemberId(member.getId(), 1);
			myChannelList = cs.getByMemberId(1, count, member.getId());
		}else{
			uuid = (String)session.get("uuid");
		}
		
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getHottestArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/favoritearticles.action?");
		pagnation = p.getPagination();

		List<SimpleArticle> list = ulService.getFavoriteLabelArticles(uuid, 5, pn, 10 , memberId);
		if(articleMapList == null)
			articleMapList = new ArrayList<Map>();
		if(list != null){
			if(list.size() < 10 ){
				int needCount = 10 - list.size();
				StringBuffer sb = new StringBuffer();
				for(int i = 0 ; i < list.size() ; i++){
					if(i<list.size()-1){
						sb.append(list.get(i).getId());
						sb.append(",");
					}else{
						sb.append(list.get(i).getId());
					}
				}
				if(!sb.toString().equals(""))
					list.addAll(sas.getHottestArticles(pn, needCount,sb.toString()));
				else
					list.addAll(sas.getHottestArticles(pn, needCount));
			}
			for(SimpleArticle sa : list){
				if(sa == null)continue;
				String title = sa.getTitle();
				String content = sa.getContent();
				if(title==null)title="无标题";
				title = Convert.getHtmlRealText(title);
				if(content==null)content="无内容";
				content = Convert.getHtmlRealText(sa.getContent());
				content = content.length() > 100 ? content.substring(0,100)+"...":content;
				
				String imgSrc = ArticleHelper.getCoverSrc(sa.getContent());
				if(imgSrc == null || imgSrc.equals(""))
					imgSrc = "";
				else{
					newArticle = sa;
					newArticle.setImgSrc(imgSrc);
					newArticle.setContent(content);
				}
				
				Map map = new HashMap();
				map.put("articleId", sa.getId());
				map.put("articleTitle", title);
				map.put("state", sa.getState());
				map.put("voteResultType", sa.getVoteResultType());
				map.put("articleContent",content);
				map.put("createDate", String.format("%1$tY-%1$tm-%1$td %1$tT",sa.getCreateDate()));
				map.put("member", ms.get(sa.getMemberId()));
				map.put("label", ls.getContentByArticleId(sa.getId()));
				map.put("rate", sa.getRate());
				map.put("imgSrc" , imgSrc);
				map.put("channelId", sa.getChannelId());
				articleMapList.add(map);
			}
		}else{
			list = sas.getHottestArticles(pn, 10);
			if(list != null){
				for(SimpleArticle sa : list){
					if(sa == null)continue;
					String title = sa.getTitle();
					String content = sa.getContent();
					if(title==null)title="无标题";
					title = Convert.getHtmlRealText(title);
					if(content==null)content="无内容";
					content = Convert.getHtmlRealText(sa.getContent());
					content = content.length() > 100 ? content.substring(0,100)+"...":content;
					
					String imgSrc = ArticleHelper.getCoverSrc(sa.getContent());
					if(imgSrc == null || imgSrc.equals(""))
						imgSrc = "";
					else{
						newArticle = sa;
						newArticle.setImgSrc(imgSrc);
						newArticle.setContent(content);
					}
					
					Map map = new HashMap();
					map.put("articleId", sa.getId());
					map.put("articleTitle", title);
					map.put("state", sa.getState());
					map.put("voteResultType", sa.getVoteResultType());
					map.put("createDate", String.format("%1$tY-%1$tm-%1$td %1$tT",sa.getCreateDate()));
					map.put("articleContent",content);
					map.put("member", ms.get(sa.getMemberId()));
					map.put("label", ls.getContentByArticleId(sa.getId()));
					map.put("rate", sa.getRate());
					map.put("imgSrc" , imgSrc);
					map.put("channelId", sa.getChannelId());
					articleMapList.add(map);
			}
		}
		}
	}
	
	/**
	 * 获得频道列表
	 */
	@SuppressWarnings("unchecked")
	public void getChannelList(){
		monthList = globalData.getMonthList();
		newChannelList = cs.getNewChannelsOrderByDate(8);
		activityMemberList = ms.getActivityMember(1, 6);
		if(pn==0)
			pn = 1;
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(cs.getHotChannelsCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/channellist.action?");
		pagnation = p.getPagination();
		List<Channel> list = cs.getHotChannels(pn, 10);
		if(list != null && list.size() > 0){
			if(channelMapList == null)
				channelMapList = new ArrayList<Map>();
			for(Channel channel : list){
				if(channel == null)continue;
				Map map = new HashMap();
				map.put("channelId", channel.getId());
				map.put("channelVoteCount", voteService.getVoteCount4Channel(channel.getId()));
				map.put("title", channel.getName());
				map.put("description", channel.getDescription());
				map.put("keywords",channel.getKeywords());
				map.put("articleNum", channel.getArticleNums());
				map.put("createDate", Convert.formatDate(channel.getCreateDate(),"yyyy-MM-dd HH:mm:ss"));
				map.put("author", ms.get(channel.getMemberId()));
				channelMapList.add(map);
			}
		}
	}
	
	//所有数据get set方法
	
	public int getPn() {
		return pn;
	}


	public void setPn(int pn) {
		this.pn = pn;
	}

	@SuppressWarnings("unchecked")
	public List<Map> getArticleMapList() {
		return articleMapList;
	}


	public Member getMember() {
		return member;
	}


	public String getPagnation() {
		return pagnation;
	}


	public void setSas(SimpleArticleService sas) {
		this.sas = sas;
	}


	public void setLs(LabelService ls) {
		this.ls = ls;
	}


	public void setCs(ChannelService cs) {
		this.cs = cs;
	}


	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public String getPath() {
		return path;
	}

	public String getPAGE() {
		return PAGE;
	}

	public void setPAGE(String page) {
		PAGE = page;
	}

	@SuppressWarnings("unchecked")
	public List<Map> getChannelMapList() {
		return channelMapList;
	}

	public void setUlService(UserLabelService ulService) {
		this.ulService = ulService;
	}

	public List<SimpleArticle> getWeekList() {
		return weekList;
	}

	public List<Channel> getHotChannelList() {
		return hotChannelList;
	}

	public List<SimpleArticle> getMonthList() {
		return monthList;
	}

	public List<Channel> getNewChannelList() {
		return newChannelList;
	}

	public SimpleArticle getNewArticle() {
		return newArticle;
	}
	public List<Channel> getMyChannelList() {
		return myChannelList;
	}

	public List getActivityMemberList() {
		return activityMemberList;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}

	public VoteService getVoteService() {
		return voteService;
	}

	public void setVoteService(VoteService voteService) {
		this.voteService = voteService;
	}
}
