package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.pic.PicUtils;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.RemarkArticleService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.util.article.ArticlePage;
import com.cc.cw.web.data.AdvertiseData;
import com.cc.cw.web.data.GlobalData;
import com.cc.cw.web.interceptor.MemberAware;
import com.cc.cw.web.thread.ImageDownloadThread;
import com.opensymphony.webwork.ServletActionContext;

public class SimpleArticleAction extends SessionActionSupport implements MemberAware {

	private static final long serialVersionUID = 2625724193045760881L;
	public static final String RUMOUR = "rumour";
	public static final String LISTARTICLES = "list";

	//#######################文章相关类和服务############################
	private SimpleArticleService simpleArticleService;
	private SimpleArticle article;
	//文章作者
	private String articleAuthor;
	private List<Map<String,List>> mapList;
	private String endDate;
	private String title;
	private String content;
	private int memberId;
	private String descript;
	/** 文章公开类型 */
	private int publishType;
	@SuppressWarnings("unused")
	private String rate;

	//#######################频道相关类和服务############################
	/** 频道ID，用来标识是否是从频道列表进入的 */
	@SuppressWarnings("unused")
	private int channelId;
	private ChannelService channelService;
	private Channel channel;
	private List<Channel> channelList;
	
	//#######################标签相关类和服务############################
	private LabelService labelService;
	private List<String> allLabels;

	//#######################回复相关类和服务############################
	private RemarkArticleService rmkService;
	private List<Map> allRemark;
	private RemarkArticle remark;
	/** 线索列表 */
	private List<RemarkArticle> clewList;

	//#######################用户相关类和服务############################
	private MemberService memberService;
	private Member member;
	
	//#######################投票相关类和服务############################
	//该文章的投票总数
	private int voteCount;
	/** 支持票数，用于真假图片显示 */
	private int supportCount;
	/** 反对票数，用于真假图片显示 */
	private int unSupportCount;
	
	//#######################页面属性############################
	private int articleId;
	@SuppressWarnings("unused")
	private String Submit;
	private int result;
	private int pn = 1;
	private int totalPage;
	private String pagnation;
	private String errorMsg;
	/** 投票时间，频道主指定 */
	private String voteDate;
	/** 投票结果提示信息 */
	private String voteMsg;
	/** 相关文章列表 */
	private List<SimpleArticle> sameArticleList;
	/** 昨日回顾文章列表 */
	private List<SimpleArticle> yestodayArticleList;
	/** 本周最热文章列表 */
	private List<SimpleArticle> weekList;
	/** 获取静态全局数据的工具类 */
	private GlobalData globalData;
	
	private String fromUrl;
	
	/** 获得文章页面广告列表 */
	private List<Map<String,String>> adsList;
	
	private ArticlePage articlePage;
	private int currentPage;

	@SuppressWarnings("unchecked")
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		member = (Member)session.get("member");

		if(member != null){
			//获得用户频道列表
			int count = channelService.getChannelCountByMemberId(member.getId(), 1);
			channelList = channelService.getByMemberId(1, count, member.getId());
		}
		
		//根据id得到具体文章
		article = simpleArticleService.getById(articleId);
		if(article == null){
			addActionError("此文章不存在！");
			return ERROR;
		}
		fromUrl = article.getFromUrl();
		
		//获取文章描述
		descript = article.getContent().replaceAll("<script/?[^/]+</script>", "");
		descript = descript.replaceAll("<[^>]+>|&[^;]+;", "");
		descript = descript.replaceAll("\r\n","");
		descript = descript.replaceAll("\n","");
		descript = descript.replaceAll("\r","");
		descript = descript.replaceAll("\t","");
		descript = descript.replaceAll("　", "");
		descript = descript.replaceAll(" ", "");
		descript = descript.replaceAll("-->", "");
		descript = descript.substring(0, descript.length()>100?100:descript.length()).trim();
		
		article.setContent(article.getContent().trim().replaceAll("alt=[\"|'][\"|']", "").replaceAll("<img ", "<img alt=\""+article.getTitle()+"\" "));
		article.setContent(PicUtils.replace(article.getContent()));
		//获得投票总数
		voteCount = simpleArticleService.getArticlesTotalVoteById(articleId);
		//根据文章ID得到文章的作者
		Member author = memberService.get(article.getMemberId());
		if(author != null){
			articleAuthor = author.getUserName();
		}else{
			log.info("the author of the article which id is "+article.getId()+" is not longer exist!");
			articleAuthor = "佚名";
		}
		
		//根据文章id获得标签列表
		allLabels = labelService.getContentByArticleId(articleId);
		sameArticleList = simpleArticleService.getArticleByLabels(allLabels, 1, 4);
//		yestodayArticleList = (List) GlobalData.globalData.get("yestodayArticles");
//		weekList = (List) GlobalData.globalData.get("weekList");
		yestodayArticleList = globalData.getYestodayArticles();
		weekList = globalData.getWeekList();
		
		//根据文章id获得线索列表
		clewList = rmkService.getClewsByArticleId(articleId,pn,10);
		//根据文章id获得回复列表
		List<RemarkArticle> rmkList = rmkService.getRemarksByArticleId(articleId,pn,5);
		allRemark = new ArrayList<Map>();
		if(rmkList != null && rmkList.size() > 0){
			//遍历回复列表查询对应用户信息
			for(RemarkArticle remark : rmkList){
				Map<String, String> rmkMap = new HashMap<String, String>();
				//根据评论ID获得评论者信息
				Member memberTemp = memberService.get(remark.getMemberId());
				if(memberTemp == null) continue;
				
				rmkMap.put("memberId", ""+memberTemp.getId());
				rmkMap.put("memberName", memberTemp.getUserName());
				rmkMap.put("title", remark.getTitle());
				rmkMap.put("content", remark.getContent());
				rmkMap.put("createDate", Convert.formatDate(remark.getCreateDate(),"yyyy-MM-dd HH:mm:ss"));
				allRemark.add(rmkMap);
			}
		}
		
		//获得回复总数，用于分页
		int total = rmkService.getRemarksCountByArticleId(articleId);
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(5);
		p.setUrl(request.getContextPath() + "/rumour/rumour.action?articleId="+articleId+"&currentPage="+currentPage+"&");
		pagnation = p.getPagination();
		totalPage = p.getTotalPage();
		
		//获得广告
		adsList = AdvertiseData.getAds("article");
		articlePage = new ArticlePage(currentPage, article.getContent());
		//http://localhost:8082/rumour/rumour.action?articleId=8941&currentPage=2
		return SUCCESS;
	}

	private String addCenter2img(String content2) {
		content2 = content2.replaceAll("<img", "<p><center><img");
		content2 = content2.replaceAll("</img>", "</img></center></p>");
		return content2;
	}

	public String toAdd(){
		member = (Member)session.get("member");
		if(member == null){
			addActionError(getText("error_member_null"));
			return ERROR;
		}
		//查询频道总数
		int count = channelService.getChannelCountByMemberId(member.getId(), 1);
		//查询频道列表，用于用户选择
		channelList = channelService.getChannelsByMemberId(member.getId(), 1, 1, count);
		return INPUT;
	}
	/**
	 * 添加文章
	 * @return
	 */
	public String newArticle(){//TODO:newArticle()
		
		try {
			if (!ValidateUtil.checkString(title)) {
				this.addFieldError("articleapply_articlename",
						getText("error_article_namenotnull"));
			}
			if (!ValidateUtil.checkString(content)) {
				this.addFieldError("articleapply_articlecontent",
						getText("error_article_contentnotnull"));
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			return INPUT;
		}
		if(this.getFieldErrors().size() > 0){
			//初始化页面所需数据
			int count = channelService.getChannelCountByMemberId(member.getId(), 1);
			//查询频道列表，用于用户选择
			channelList = channelService.getChannelsByMemberId(member.getId(), 1, 1, count);
			return INPUT;
		}
		
		//查询频道总数
		int count = channelService.getChannelCountByMemberId(member.getId(), 1);
		//查询频道列表，用于用户发表文章时选择
		channelList = channelService.getChannelsByMemberId(member.getId(), 1, 1, count);
		
		SimpleArticle article = new SimpleArticle();
		article.setTitle(title);
		article.setContent(content);
		article.setMemberId(memberId);		
		article.setVoteResultType(0);
		article.setPublishType(publishType);
		article.setChannelId(-1);
		article.setFirstVoteCycle(Integer.parseInt(voteDate));
		article.setEndDate(DateTimeUtil.incDate(new Date(), Calendar.DAY_OF_MONTH, Integer.parseInt(voteDate)));
		
		article.setPublishType(publishType);
		if(fromUrl != null && fromUrl.length() > 0)
			article.setFromUrl(fromUrl);
		
		if(!ValidateUtil.isNumber(voteDate,true)){
			errorMsg = getText("error_article_rate");
			return INPUT;
		}
		int voteDateInt = Integer.parseInt(voteDate);
		article.setChannelId(-1);
		article.setRate(voteDateInt);
		
		GregorianCalendar g1 = new GregorianCalendar();//根据用户填写的天数计算投票截止日期
		g1.add(Calendar.DATE, voteDateInt);
		article.setEndDate(g1.getTime());
		
/*		if(publishType == 0){//任意收藏，只需指定收藏所需票数
			//检查是否是有效数字
			if(!ValidateUtil.isNumber(rate,false)){
				errorMsg = getText("error_article_rate");
				return INPUT;
			}
			article.setChannelId(0);//将频道设为0
			article.setRate(Integer.parseInt(rate.replaceAll(" ", "")));
			article.setEndDate(null);//将在频道主收藏时指定结束时间
		}else if(publishType == 1){//不允许其他频道收藏，无需指定收藏所需票数，但要指定结束时间，并扣除相应票数
			//检查是否是有效数字
			if(!ValidateUtil.isNumber(voteDate,true)){
				errorMsg = getText("error_article_rate");
				return INPUT;
			}
			int voteDateInt = Integer.parseInt(voteDate);

			article.setChannelId(channelId);//将频道设为用户选择的频道
			article.setRate(voteDateInt);//文章价格等于用户指定的投票天数
			
			GregorianCalendar g1 = new GregorianCalendar();//根据用户填写的天数计算投票截止日期
			g1.add(Calendar.DATE, voteDateInt);
			article.setEndDate(g1.getTime());
			
			
			//扣除投票周期对应的票数
			int newPrivilege = member.getPrivilege()-voteDateInt;
			if(newPrivilege < 0){//票数不够支持投票天数
				errorMsg = getText("error_vote_privilege");
				return INPUT;
			}
			//更改用户票数
			memberService.updatePrivilege(memberId, newPrivilege);
		}*/
		articleId = simpleArticleService.add(article);
		
		if(articleId > 0){
			HttpServletRequest request = ServletActionContext.getRequest();
			String serverName = "http://"+request.getServerName()+":"+request.getServerPort();
			
			Thread downloadThread = new Thread(new ImageDownloadThread(serverName,articleId,simpleArticleService));
			downloadThread.start();
			log.info("return rumour");
			return RUMOUR;
		}
		else if(articleId == -1){
			errorMsg = getText("error_add_duplicate");
			return INPUT;
		}else{
			addActionError(getText("error_operation_error"));
			return ERROR;
		}
	}

	
	/*public void validate() {//TODO:validate()
		if(loginFlag){
			log.info("in validate : title == "+title);
			log.info("before --> " + this.getFieldErrors().size());
			try {
				if (!ValidateUtil.checkString(title)) {
					this.addFieldError("articleapply_articlename",
							getText("error_article_namenotnull"));
				}
				if (!ValidateUtil.checkString(content)) {
					this.addFieldError("articleapply_articlecontent",
							getText("error_article_contentnotnull"));
				}
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			log.info("after --> " + this.getFieldErrors().size());
			if(this.getFieldErrors().size() > 0){
				//初始化页面所需数据
				int count = channelService.getChannelCountByMemberId(member.getId(), 1);
				//查询频道列表，用于用户选择
				channelList = channelService.getChannelsByMemberId(member.getId(), 1, 1, count); 
			}
	    }
	}*/
	
	
	/**
	 * 根据频道ID，查询所属文章，用户用户管理中的频道管理
	 * @return LISTARTICLES：/ftl/list_article.ftl
	 */
	@SuppressWarnings("unchecked")
	public String queryMyArticles(){//TODO:queryMyArticles()
		
		//根据频道ID获得频道
		channel = channelService.getById(channelId);
		
		//根据频道ID获得所属文章
		List<SimpleArticle> articleListTmp = simpleArticleService.getArticlesByChannelId(channelId, pn, 10);
		int total = simpleArticleService.getArticlesCountByChannelId(channelId);
		
		if(mapList == null)
			mapList = new ArrayList<Map<String, List>>();
		for(SimpleArticle article : articleListTmp){
			Map map = new HashMap();
			map.put("article", article);
			//根据文章id获得标签列表
			allLabels = labelService.getContentByArticleId(article.getId());
			map.put("allLabels", allLabels);
			map.put("currentDate", new Date());
			
			mapList.add(map);
		}
		//进行分页处理
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/rumour/addrumour!queryMyArticles.action?channelId="+channelId+"&");
		pagnation = p.getPagination();
		return LISTARTICLES;
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
	public void setLabelService(LabelService labelService) {
		this.labelService = labelService;
	}
	public void setRmkService(RemarkArticleService rmkService) {
		this.rmkService = rmkService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public SimpleArticle getArticle() {
		return article;
	}
	public void setArticle(SimpleArticle article) {
		this.article = article;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getArticleId() {
		return articleId;
	}
	public String getEndDate() {
		return endDate;
	}
	public List<String> getAllLabels() {
		return allLabels;
	}
	public List<Map> getAllRemark() {
		return allRemark;
	}
	public void setRemark(RemarkArticle remark) {
		this.remark = remark;
	}
	public void setSubmit(String submit) {
		Submit = submit;
	}
	public RemarkArticle getRemark() {
		return remark;
	}
	public String getArticleAuthor() {
		return articleAuthor;
	}
	public int getVoteCount() {
		return voteCount;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	public List<RemarkArticle> getClewList() {
		return clewList;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getPn() {
		return pn;
	}
	public void setPn(int pn) {
		this.pn = pn;
	}
	public List<Map<String, List>> getMapList() {
		return mapList;
	}
	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}
	public Channel getChannel() {
		return channel;
	}
	public String getPagnation() {
		return pagnation;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public Member getMember() {
		return member;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public void setPublishType(int publishType) {
		this.publishType = publishType;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public List<Channel> getChannelList() {
		return channelList;
	}
	public String getVoteMsg() {
		return voteMsg;
	}
	public void setVoteMsg(String voteMsg) {
		this.voteMsg = voteMsg;
	}
	public void setVoteDate(String voteDate) {
		this.voteDate = voteDate;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPublishType() {
		return publishType;
	}
	public List<SimpleArticle> getSameArticleList() {
		return sameArticleList;
	}
	public List<SimpleArticle> getYestodayArticleList() {
		return yestodayArticleList;
	}
	public List<SimpleArticle> getWeekList() {
		return weekList;
	}
	public int getSupportCount() {
		return supportCount;
	}
	public int getUnSupportCount() {
		return unSupportCount;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}

	public String getDescript() {
		return descript;
	}

	public String getFromUrl() {
		return fromUrl;
	}

	public void setFromUrl(String fromUrl) {
		this.fromUrl = fromUrl;
	}

	public List<Map<String, String>> getAdsList() {
		return adsList;
	}

	public ArticlePage getArticlePage() {
		return articlePage;
	}

	public void setArticlePage(ArticlePage articlePage) {
		this.articlePage = articlePage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
