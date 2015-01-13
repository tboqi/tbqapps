package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.SimpleArticleDAO;
import com.cc.cw.dao.UserDMLabelDAO;
import com.cc.cw.service.UserDMLabelService;

public class UserDMLabelServiceImpl implements UserDMLabelService {
	private UserDMLabelDAO dao;

	private SimpleArticleDAO sadao;

	public List getFavoriteLabelArticles(String uuid, int labelCount,
			int start, int count) {
		List labelList = dao.getUserLabels(uuid, labelCount);
		List articleList = sadao.getDMLabelArticles(labelList, start, count);

		return articleList;
	}

	public int getFavoriteLabelArticlesCount(String uuid, int labelCount) {
		return dao.getCount(uuid, labelCount);
	}

	public List getFavoriteLabels(String uuid, int labelCount) {
		List list = dao.getUserLabels(uuid, labelCount);
		return list;
	}
	
	public static void main(String args[]) {

	}

	public UserDMLabelDAO getDao() {
		return dao;
	}

	public void setDao(UserDMLabelDAO dao) {
		this.dao = dao;
	}

	public SimpleArticleDAO getSadao() {
		return sadao;
	}

	public void setSadao(SimpleArticleDAO sadao) {
		this.sadao = sadao;
	}

}
