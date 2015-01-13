package com.cc.cw.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cc.cw.dao.LabelDAO;
import com.cc.cw.domain.Label;
import com.cc.cw.service.LabelService;

public class LabelServiceImpl implements LabelService{

	private LabelDAO dao;
	
	public Label get(int id) {
		return dao.get(id);
	}

	public List<Label> getByArticleId(int articleId) {
		return dao.getByArticleId(articleId);
	}
	
	
	
	public List<String> getContentByArticleId(int articleId){
		List<Label> labelList = dao.getByArticleId(articleId);
		List<String> totalLabelList = new ArrayList<String>();
		if(labelList != null && labelList.size() > 0){
			
			for(Label label : labelList){
				String labels = label.getContent();
				String arr[] = labels.split(";");
				for(String s : arr)
					totalLabelList.add(s);
			}
		}
		return totalLabelList;
	}

	public List<String> getContentByArticleIdMemberId(int articleId,int memberId){
		Label label = dao.getByArticleIdMemberId(articleId, memberId);
		List<String> totalLabelList = new ArrayList<String>();
		if(label == null)
			return null;
		String labels = label.getContent();
		String arr[] = labels.split(";");
		for(String s : arr)
			totalLabelList.add(s);
		return totalLabelList;
	}
	@SuppressWarnings("unchecked")
	public int add(Label label) {
		
		String [] newLabels = label.getContent().split(";");
		Set<String> newLabelSet = new HashSet(Arrays.asList(newLabels));
		
		
		Label lbFromDB = dao.getByArticleIdMemberId(label.getArticleId(), label.getMemberId());
		
		if(lbFromDB == null){//没有对此文章打过标签
			StringBuffer content = new StringBuffer();
			for(String newLabel : newLabelSet)
				content.append(newLabel + Label.SEPARATOR);
			label.setContent(content.toString());
			return dao.add(label);
		}
			
		else{//对此文章打过标签
			String [] oldLabels = lbFromDB.getContent().split(";");
			Set oldLabelSet = new HashSet(Arrays.asList(oldLabels));
			
			boolean needUpdate = false;
			StringBuffer content = new StringBuffer(lbFromDB.getContent());
			for(String newLabel : newLabelSet){
				
				if(oldLabelSet.contains(newLabel))continue;
				content.append(newLabel + Label.SEPARATOR);
				needUpdate = true;
			}
			if(needUpdate){
				lbFromDB.setContent(content.toString());
				dao.update(lbFromDB);
			}
			
			return lbFromDB.getId();
		}
	}

	public boolean remove(int id) {
		return dao.remove(id) > 0;
	}

	public boolean update(Label label) {
		return dao.update(label) > 0;
	}
	
	public LabelDAO getDao() {
		return dao;
	}

	public void setDao(LabelDAO dao) {
		this.dao = dao;
	}
	
	public List<Label> getAllLabels() {
		return dao.getAllLabels();
	}

	public List<Label> getNewLabels(int id) {
		return dao.getNewLabels(id);
	}

	public boolean havaNewLabels(int id) {
		int count = dao.countNewLabels(id);
		return count > 0;
	}

	public List<Label> search(String key, int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		
		return dao.search(key, start, count);
	}

	public int searchCount(String key) {
		return dao.searchCount(key);
	}

	
	
}
