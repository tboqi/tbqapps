package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.LabelRules;

public interface LabelRulesDAO {

	public List getAll();
	public void insert(LabelRules lr);
	public void delete(String value);
	public int isEqual(String sourceTags, String targetTags);
	public List<LabelRules> getRulesByType(String type);
}
