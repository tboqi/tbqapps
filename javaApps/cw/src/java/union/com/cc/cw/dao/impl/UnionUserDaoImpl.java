package com.cc.cw.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.UnionUserDao;
import com.cc.cw.domain.UnionUser;
import com.cc.cw.util.DateTimeUtil;

public class UnionUserDaoImpl extends SqlMapClientDaoSupport implements UnionUserDao {

	@SuppressWarnings("unchecked")
	public UnionUser getConfigMap(String domainName) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("domainName", domainName);
		return (UnionUser) getSqlMapClientTemplate().queryForObject("union.getMap", map);
	}

	@SuppressWarnings("unchecked")
	public int getCount(String ip, String domainName) {
		Map map = new HashMap();
		map.put("ip", ip);
		map.put("domainName", domainName);
		return (Integer)getSqlMapClientTemplate().queryForObject("union.getCount", map);
	}

	@SuppressWarnings("unchecked")
	public void saveIp(String ip, String domainName) {
		Map map = new HashMap();
		map.put("ip", ip);
		map.put("domainName", domainName);
		map.put("time", new Date());
		map.put("date", DateTimeUtil.getDateFormat(new Date()));
		getSqlMapClientTemplate().insert("union.insert", map);
	}

}
