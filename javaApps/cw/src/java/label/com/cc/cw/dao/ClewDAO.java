package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Clew;

public interface ClewDAO {
	public int add(Clew clew);
	
	public Clew get(int id);
	
	public List<Clew> getByTitle(String title,int start,int count);
	
	public int getCountByTitle(String title);
	
	public List<Clew> getByKey(String title);
}
