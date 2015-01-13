package com.cc.cw.web.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.web.ArticleHelper;

/**
 * 全局数据类，将经常使用又不需实时更新的数据存放在静态HashMap中，
 * 将通过UpdateGlobalDataJob任务来更新这些数据
 * @author dzh
 * 上午11:59:42
 */
public class GlobalData {
	
	Log log = LogFactory.getLog(GlobalData.class);
	private static Map<String,Object> globalData;
	
	public ChannelService channelService;
	
	public SimpleArticleService simpleArticleService;
	
	public MemberService memberService;
	
//	private static Date dayUpdateTime;
	
	public GlobalData(ChannelService channelService,SimpleArticleService simpleArticleService,MemberService memberService){
		log.info("global data init ...");
		this.channelService = channelService;
		this.simpleArticleService = simpleArticleService;
		this.memberService = memberService;
		
		globalData = new HashMap<String,Object>();
		
		updateMonthArticles();
		updateWeekArticles();
		updateYestodayArticles();
		
//		dayUpdateTime = new Date();
	}
	
	/**
	 * 更新本月最热文章列表
	 */
	@SuppressWarnings("unchecked")
	public void updateMonthArticles(){
		List monthList = this.simpleArticleService.getMonthHottestArticles(1, 10);
//		List weekPic = initWeekPic(null, 0);
		globalData.put("monthList", monthList);
//		globalData.put("weekPic", new ArrayList());
//		globalData.put("weekPic", weekPic);
	}
	
	/**
	 * 更新本周最热文章列表
	 */
	@SuppressWarnings("unchecked")
	public void updateWeekArticles(){
		List weekList = this.simpleArticleService.getWeekHottestArticles(1, 5);
//		List weekPic = initWeekPic(null, 0);
		globalData.put("weekList", weekList);
//		globalData.put("weekPic", new ArrayList());
//		globalData.put("weekPic", weekPic);
	}
	
	/**
	 * 更新昨日回顾
	 */
	@SuppressWarnings("unchecked")
	public void updateYestodayArticles(){
		List yestodayArticles = this.simpleArticleService.getYestodayArticle(1, 10);
		globalData.put("yestodayArticles", yestodayArticles);
	}
	
	/**
	 * 初始化本周文章的一幅图片
	 * @param weekPicList
	 * @param start
	 * @return
	 */
	@SuppressWarnings({"unchecked","unused"})
	private List initWeekPic(List weekPicList,int start){
		if(weekPicList == null){
			weekPicList = new ArrayList<Map<String,String>>();
		}
		if(start == 0 ){
			start = 1;
		}
		List<SimpleArticle> list = simpleArticleService.getWeekHottestArticles(start, 5);
		if(list == null || list.size()<= 0){
			log.info("do not have article");
			return null;
		}
		for(SimpleArticle article : list){
			Map<String, String> picMap = new HashMap<String, String>();
			if(article==null)continue;
			String title = article.getTitle();
			String content = article.getContent();
			String img = ArticleHelper.getCoverSrc(content);
			//如果没有图片，则取下一条数据
			if(img==null || img.trim().equals("")) continue;
			picMap.put("articleId", ""+article.getId());
			picMap.put("title", title);
			picMap.put("imgSrc", img);
			weekPicList.add(picMap);
			if(weekPicList.size() >= 1){
				return weekPicList;
			}
		}
		//递归调用
		return initWeekPic(weekPicList,start + 1);
	}

	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public List getYestodayArticles(){
//		if(!DateTimeUtil.parseDateToString(new Date(), "yyyy-MM-dd").equals(DateTimeUtil.parseDateToString(dayUpdateTime, "yyyy-MM-dd"))){
//			updateDayTask();
//		}
		return (List) globalData.get("yestodayArticles");
	}
	
	public List getWeekList(){
		return (List) globalData.get("weekList");
	}
	
	public List getMonthList(){
		return (List) globalData.get("monthList");
	}
	
	public List getWeekPic(){
		return (List) globalData.get("weekPic");
	}
	synchronized public void updateDayTask(){
			updateMonthArticles();
			updateWeekArticles();
			updateYestodayArticles();
//			dayUpdateTime = new Date();
	}

}
