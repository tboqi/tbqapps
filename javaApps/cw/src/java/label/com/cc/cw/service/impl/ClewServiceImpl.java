package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.ClewDAO;
import com.cc.cw.domain.Clew;
import com.cc.cw.service.ClewService;

public class ClewServiceImpl implements ClewService{

	private ClewDAO dao;
	
	public ClewDAO getDao(){
		return this.dao;
	}
	
	public void setDao(ClewDAO dao){
		this.dao = dao;
	}
	
	public int add(Clew clew) {
		return dao.add(clew);
	}

	public Clew get(int id) {
		return dao.get(id);
	}

	public List<Clew> getByTitle(String title,int page, int count) {
		int start = (page - 1) * count;
		return dao.getByTitle(title,start,count);
	}
	
	public int getCountByTitle(String title){
		return dao.getCountByTitle(title);
	}

	public List<Clew> getByKey(String title) {
		return dao.getByKey(title);
	}

}
