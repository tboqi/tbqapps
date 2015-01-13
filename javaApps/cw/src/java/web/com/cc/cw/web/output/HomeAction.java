package com.cc.cw.web.output;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cc.cw.domain.AtomLabel;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UserLabel;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.UserLabelService;
import com.cc.cw.util.Convert;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.data.GlobalData;
import com.opensymphony.webwork.ServletActionContext;

/**
 * 首页action
 * @author dzh
 * 上午10:12:42
 */
public class HomeAction extends SessionActionSupport {

	private static final long serialVersionUID = -2255843022436875843L;
	
	//所需服务
	/** 文章服务 由spring负责实例化 */
	private SimpleArticleService simpleArticleService;
	/** 子标签服务 由spring负责实例化 */
	private AtomLabelService	 atLabelService;
	
	//页面需要的数据
	/** 首页热门标签 */
	private List<AtomLabel> hotLabelList;
	/** 最热文章 */
	private List<SimpleArticle> hottestList;
	/** 最热文章图片 */
	private List<Map<String, Object>> hottestPicList;
	
	/** 本周看点图片 */
	private List<Map<String, String>> weekPicList;
	
	/** 本月最热文章 */
	private List<SimpleArticle> monthList;
	/** 本周最热文章 */
	private List<SimpleArticle> weekList;
	/** 最新文章 */
	@SuppressWarnings("unchecked")
	private List<Map> newListMap;
	/** 精彩回顾 */
	private List<SimpleArticle> reviewList;
	/** 反对有理 */
	private List<SimpleArticle> againstList;
	/** 支持到底 */
	private List<SimpleArticle> suggestList;
	/** 二次投票 */
	private List<SimpleArticle> secondVoteList;
	
	/** 个性化首页服务 */
	private UserLabelService ulService;
	/** 获取静态全局数据的工具类 */
	private GlobalData globalData;

	@SuppressWarnings("unchecked")
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String uuid = "";
		uuid = (String)session.getAttribute("uuid");

		initHotPics();
//		initWeekPic(1);
//		weekList = simpleArticleService.getWeekHottestArticles(1,5);
//		weekPicList = (List)GlobalData.globalData.get("weekPic");
//		weekList = (List)GlobalData.globalData.get("weekList");
		//weekPicList = globalData.getWeekPic();
		weekList = globalData.getWeekList();
		initNewListMap2(1);

//		reviewList = (List) GlobalData.globalData.get("yestodayArticles");
		reviewList = globalData.getYestodayArticles();
		againstList = simpleArticleService.getUnsupportArticles(1, 7);
		suggestList = simpleArticleService.getSupportArticles(1, 7);
		secondVoteList = simpleArticleService.getSecondVoteArticles(1, 3);
		
		//初始化header中的标签
		getLabels(uuid);
		
		//默认首页
		//hottestList = ulService.getFavoriteLabelArticles(uuid, 3, 0, 10, 0);
		hottestList = simpleArticleService.getHottestArticles(1, 12);
		//channelList = channelService.getHotChannels(1, 6);

		return SUCCESS;

	}
	
	/**
	 * 初始化标签列表，用户最喜欢的标签和最热标签
	 * @param uuid
	 */
	@SuppressWarnings("unchecked")
	public void getLabels(String uuid){
		int labelCount = 20;
		StringBuffer sb = new StringBuffer();
		if(uuid != null && !uuid.trim().equals("")){
			List<UserLabel> labels = ulService.getFavoriteLabels(uuid, 3);
			hotLabelList = new ArrayList();
			if(labels!=null){
				for(int i = 0 ; i < labels.size(); i++){
					if(i<labels.size()-1){
						sb.append("'"+labels.get(i).getLabel()+"'");
						sb.append(",");
					}else{
						sb.append("'"+labels.get(i).getLabel()+"'");
					}
					AtomLabel alb = new AtomLabel();
					alb.setContent(labels.get(i).getLabel());
					hotLabelList.add(alb);
				}
				//log.info("labels --> " + sb.toString());
				if(!sb.toString().trim().equals("")){
					List<AtomLabel> hotLabels = atLabelService.getHotAtomLabel(1,labelCount - hotLabelList.size(),sb.toString());
					hotLabelList.addAll(hotLabels);
				}else{
					hotLabelList = atLabelService.getHotAtomLabel(1, labelCount);
				}
			}
		}else{
			hotLabelList = atLabelService.getHotAtomLabel(1, labelCount);
		}
	}
	
	/**
	 * 初始化新闻章列表，新文章显示时，需要将文章中的图片列在最前面的位置，此方法将负责处理文章对象中的图片，
	 * 如果没有图片，则取下面一条文章。
	 * @param list
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void initNewListMap2(int start){
		if(newListMap == null){
			newListMap = new ArrayList();
		}
		
		if(start == 0){
			start = 1;
		}
		
		List<SimpleArticle> list = simpleArticleService.getNewArticles(start,3);
		
		if(list == null || list.size()<= 0){
			return;
		}
			
		for(SimpleArticle article : list){
			if(article==null)continue;
			
			String title = article.getTitle();
			String content = article.getContent();
			String img = ArticleHelper.getCoverSrc(content);
			if(img==null || img.trim().equals(""))continue;
			
			if(title==null)title="无标题";
			title = Convert.getText(title);
			
			if(content==null)content="无内容";
			content=Convert.getText(content);
			
			if(content.length()>100)content=content.substring(0,100)+"...";
			Map map = new HashMap();
			map.put("id", article.getId());
			map.put("title",title);
			map.put("imgSrc", img);
			map.put("content", content);
			newListMap.add(map);
			if(newListMap.size() >=3)return;
		}
		
		initNewListMap2(start + 1);
	}
	
	/**
	 * 得到五张最热文章的图片
	 * 
	 * @param hotPicList
	 * @return List<Map<String, String>>
	 * @throws MalformedURLException
	 */
	private void initHotPics() {
		if (hottestPicList == null) {
			hottestPicList = new ArrayList<Map<String, Object>>();
		}
		int start = 1;
		while(hottestPicList.size() <= 6){
			List<SimpleArticle> list = getHotArticles(start, 5);
			if (list == null || list.size() <= 0) {
				return;
			}
			for(int i = 0 ; i < list.size() ; i++){
				if(i == list.size()-1){
					start += 1;
				}
				Map<String, Object> picMap = new HashMap<String, Object>();
				SimpleArticle article = list.get(i);
				if (article == null)
					continue;
				String title = article.getTitle();
				String content = article.getContent();
				String img = ArticleHelper.getCoverSrc(content);
				// 如果没有图片，则取下一条数据
				if (img == null || img.trim().equals(""))
					continue;
				picMap.put("articleId", "" + article.getId());
				picMap.put("title", title);
				picMap.put("imgSrc", img);
				picMap.put("iWidth", 84);
				picMap.put("iHeight", 84);
				hottestPicList.add(picMap);
				if (hottestPicList.size() >= 6) {
					return;
				}
			}
		}
	}
	
	private List<SimpleArticle> getHotArticles(int page,int count){
		return simpleArticleService.getHottestArticles(page,count);
	}

	//所有数据的get方法和服务的set方法
	
	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
	
	public List<SimpleArticle> getMonthList() {
		return monthList;
	}

	public List<SimpleArticle> getWeekList() {
		return weekList;
	}

	public List<AtomLabel> getHotLabelList(){
		return hotLabelList;
	}
	
	public void setAtLabelService(AtomLabelService labelService){
		this.atLabelService = labelService;
	}

	@SuppressWarnings("unchecked")
	public List<Map> getNewListMap() {
		return newListMap;
	}

	public List<SimpleArticle> getReviewList() {
		return reviewList;
	}

	public List<Map<String, Object>> getHottestPicList() {
		return hottestPicList;
	}

	public void setUlService(UserLabelService ulService) {
		this.ulService = ulService;
	}

	public List<SimpleArticle> getHottestList() {
		return hottestList;
	}
	
	public static void main(String[] args) {
		String [] arr = {"1","2","3","4","5","6","7","8","9","10",};
		StringBuffer sb = new StringBuffer();
		for(int i = 0 ; i < arr.length ; i++){
			if(i<arr.length-1){
				sb.append(arr[i]);
				sb.append(",");
			}else{
				sb.append(arr[i]);
			}
		}
	}
	public List<SimpleArticle> getAgainstList() {
		return againstList;
	}
	public List<SimpleArticle> getSuggestList() {
		return suggestList;
	}
	public List<Map<String, String>> getWeekPicList() {
		return weekPicList;
	}
	public void setHottestPicList(List<Map<String, Object>> hottestPicList) {
		this.hottestPicList = hottestPicList;
	}
	public List<SimpleArticle> getSecondVoteList() {
		return secondVoteList;
	}

	public void setGlobalData(GlobalData globalData) {
		this.globalData = globalData;
	}
	
}
