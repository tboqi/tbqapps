package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.LabelRules;

public interface LabelRulesService {

	public void insert(String[] rule, String name, String type);

	public void delete(String[] value);
	
	public List getAll();
	
	public List<LabelRules> getRulesByType(String type);
}
