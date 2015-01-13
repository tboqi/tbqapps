package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.Clew;

public interface ClewService {

	public int add(Clew clew);
	
	public Clew get(int id);
	
	public List<Clew> getByTitle(String title , int page ,int count);

	public int getCountByTitle(String title);
	
	public List<Clew> getByKey(String title);
}
