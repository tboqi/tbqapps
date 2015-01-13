package com.cc.cw.service.impl;

import java.util.Date;
import java.util.List;

import com.cc.cw.dao.LabelRulesDAO;
import com.cc.cw.domain.LabelRules;
import com.cc.cw.service.LabelRulesService;

public class LabelRulesServiceImpl implements LabelRulesService {
	private LabelRulesDAO dao;

	public void insert(String[] rule, String name, String type) {
		String[] r;
		LabelRules lr = new LabelRules();
		lr.setCreateTime(new Date());
		lr.setDisuseTime(new Date());
		lr.setOperatorName(name);
		lr.setType(type);
		for (int i = 0; i < rule.length; i++) {
			r = rule[i].split("--");
			if (dao.isEqual(r[0], r[1]) <= 0) {
				lr.setSourceTags(r[0]);
				lr.setTargetTags(r[1]);
				dao.insert(lr);
			}
		}
	}

	public void delete(String[] value) {
		String v = value[0];
		for (int i = 1; i < value.length; i++) {
			v = v + "," + value[i];
		}
		dao.delete(v);
	}

	public List getAll() {
		return dao.getAll();
	}
	
	public static void main(String[] args) {

	}


	public LabelRulesDAO getDao() {
		return dao;
	}

	public void setDao(LabelRulesDAO dao) {
		this.dao = dao;
	}

	public List<LabelRules> getRulesByType(String type) {
		return dao.getRulesByType(type);
	}

}
