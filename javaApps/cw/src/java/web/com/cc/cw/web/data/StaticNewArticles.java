package com.cc.cw.web.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.web.ArticleHelper;

/**
 * 负责获得最新文章列表
 * 将由NewArticlesJob调度任务负责更新
 * @author wangyx
 */
public class StaticNewArticles {
	Log log = LogFactory.getLog(StaticNewArticles.class);
	public static Map<String,Object> globalData;
	public SimpleArticleService simpleArticleService;
	private List<Map> newListMap;
	
	public StaticNewArticles(SimpleArticleService simpleArticleService){
		this.simpleArticleService = simpleArticleService;
		globalData = new HashMap<String,Object>();
		
		
		updateNewArticles();
	}

	public void updateNewArticles(){
		newListMap = new ArrayList<Map>();
		initNewListMap2(0);
	}
	
	/**
	 * 初始化新闻章列表，新文章显示时，需要将文章中的图片列在最前面的位置，此方法将负责处理文章对象中的图片，
	 * 如果没有图片，则取下面一条文章。
	 * @param list
	 * @return
	 */
	private void initNewListMap2(int start){
		if(start == 0){
			start = 1;
		}
		
		List<SimpleArticle> list = simpleArticleService.getNewArticlesIndex(start,3);
		
		if(list == null || list.size()<= 0){
			log.info("do not have article");
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
			Map<String, Object> map = new HashMap<String, Object>();
			title = title.replaceAll("\"", "");
			map.put("id", article.getId());
			map.put("title",title);
			map.put("imgSrc", img);
			map.put("content", content);
			newListMap.add(map);
			globalData.put("newListMap", newListMap);
			if(newListMap.size() >=4)return;
		}
		
		initNewListMap2(start + 1);
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
}
