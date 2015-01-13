package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.LabelRulesDAO;
import com.cc.cw.domain.LabelRules;

public class LabelRulesDAOImpl extends SqlMapClientDaoSupport implements LabelRulesDAO {

	public void delete(String value) {
		getSqlMapClientTemplate().delete("labelruless.delete", value);
	}

	public List getAll() {
		// TODO 自动生成方法存根
		return getSqlMapClientTemplate().queryForList("labelruless.getAll", null);
	}

	public void insert(LabelRules lr) {
		this.getSqlMapClientTemplate().insert("labelruless.insert", lr);
	}

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				new String[] { "applicationContext.xml",
						"dataAccessContext-local.xml" });
		@SuppressWarnings("unused") LabelRulesDAO dao = (LabelRulesDAO) ctx.getBean("labelRulesDAO");
	}

	@SuppressWarnings("unchecked")
	public int isEqual(String sourceTags, String targetTags) {
		Map map = new HashMap();
		map.put("sourceTags", sourceTags);
		map.put("targetTags", targetTags);
		return (Integer) getSqlMapClientTemplate().queryForObject("labelruless.isEqual", map);
	}

	@SuppressWarnings("unchecked")
	public List<LabelRules> getRulesByType(String type) {
		Map map = new HashMap();
		map.put("type", type);
		return (List<LabelRules>) getSqlMapClientTemplate().queryForList("labelruless.selectRuleByType", map);
	}
}
