package com.cc.cw.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.dao.SimpleArticleDAO;
import com.cc.cw.dao.UserLabelDAO;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UserLabel;
import com.cc.cw.search.search.LabelSearchService;
import com.cc.cw.search.search.SearchResult;
import com.cc.cw.service.UserLabelService;
import com.cc.cw.util.Convert;

public class UserLabelServiceImpl implements UserLabelService {
	protected final Log log = LogFactory.getLog(getClass());

	private UserLabelDAO dao;
	private SimpleArticleDAO sadao;
	
	private LabelSearchService searchService;

	@SuppressWarnings("unchecked")
	public List getFavoriteLabelArticles(String uuid, int labelCount, int start, int count, int memberId) {
		List<UserLabel> labelList = dao.getUserLabels(uuid, labelCount);
		List articleList = null;//sadao.getLabelArticles(labelList, start, count,memberId);
		StringBuffer search = new StringBuffer();
		if(labelList != null && labelList.size() > 0){
			for(UserLabel l : labelList){
				search.append(l.getLabel());
				search.append(" ");
			}
			if(!search.toString().trim().equals("")){
				articleList = sadao.getLabelArticles(labelList, start, count,memberId);
				return articleList;
			}
			SearchResult result = searchService.search(search.toString(), start, count);
			if(result != null && result.getSearchItems() != null && result.getSearchItems().size() > 0){
				articleList = new ArrayList();
				// 存储key值，用于去除重复文章 
				Map<String,String> temp = new HashMap<String, String>();
				for(Map map : result.getSearchItems()){
					if(temp.containsKey((String)map.get("id"))) continue;
					temp.put((String)map.get("id"), (String)map.get("id"));
					SimpleArticle a = new SimpleArticle();
					a.setId(Integer.parseInt((String)map.get("id")));
					a.setTitle(Convert.getText((String)map.get("title")));
					a.setContent((String)map.get("content"));
					
					articleList.add(a);
				}
			}
		}
		return articleList;
	}
	
	public SimpleArticleDAO getSadao() {
		return sadao;
	}

	public void setSadao(SimpleArticleDAO sadao) {
		this.sadao = sadao;
	}

	public int getFavoriteLabelArticlesCount(String uuid, int labelCount, int memberId) {
		
		return dao.getCount(uuid, labelCount, memberId);
	}

	public static void main(String args[]) {

	}

	public List getFavoriteLabels(String uuid, int labelCount) {
		List list = dao.getUserLabels(uuid, labelCount);
		return list;
	}
	public void setSearchService(LabelSearchService searchService) {
		this.searchService = searchService;
	}
	public UserLabelDAO getDao() {
		return dao;
	}
	public void setDao(UserLabelDAO dao) {
		this.dao = dao;
	}
}
