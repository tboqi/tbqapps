package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.AtomLabelDAO;
import com.cc.cw.domain.AtomLabel;
import com.cc.cw.service.AtomLabelService;

public class AtomLabelServiceImpl implements AtomLabelService {

	private AtomLabelDAO dao;
	
	public AtomLabelDAO getDao() {
		return dao;
	}

	public void setDao(AtomLabelDAO dao) {
		this.dao = dao;
	}

	public int add(AtomLabel atomLabel) {
		if(dao.exists(atomLabel.getContent(),atomLabel.getArticleId())){//存在，count字段加1
			return dao.increaseCountByContentArticleId(atomLabel.getContent(),atomLabel.getArticleId(), 1);
		}else{
				atomLabel.setCount(1);
			return dao.add(atomLabel);
		}
	}

	public boolean delete(int id) {
		return dao.delete(id) > 0;
	}

	public AtomLabel getById(int id) {
		return dao.getById(id);
	}

	public List<AtomLabel> getHotAtomLabel(int page, int count) {
		int start = (page - 1) * count;
		return dao.getHotAtomLabel(start,count);
	}
	
	public int getHotAtomLabelCount(){
		return dao.getHotAtomLabelCount();
	}
	
	public boolean increaseCountByContent(String content,int count){
		if(dao.exists(content, 0)){
			
			return dao.increaseCountByContent(content, 1) > 0;
		}else{
			AtomLabel atomLabel = new AtomLabel();
			atomLabel.setArticleId(0);
			atomLabel.setContent(content.length()>20?content.substring(0,20):content);
			atomLabel.setCount(1);
			atomLabel.setProviderId(0);
			return dao.add(atomLabel) > 0;
		}
	}
	
	public boolean increaseCountByContentArticleId(String content,int articleId, int count){
		if(dao.exists(content, articleId)){
			return dao.increaseCountByContentArticleId(content, articleId, count) > 0;
		}else{
			return false;
		}
	}

	public List<String> getDistinctContent() {
		return dao.getDistinctContent();
	}

	public List<String> getDistinctContentByLike(String label) {
		return dao.getDistinctContentByLike(label);
	}

	public List<AtomLabel> getHotAtomLabel(int page, int count, String notIn) {
		int start = (page - 1) * count;
		return dao.getHotAtomLabel(start,count,notIn);
	}

}
