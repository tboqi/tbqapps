package com.cc.cw.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.TradeHistoryDAO;
import com.cc.cw.domain.TradeHistory;

public class TradeHistoryDAOImpl extends SqlMapClientDaoSupport implements
		TradeHistoryDAO {

	public void insert(TradeHistory history) {
		getSqlMapClientTemplate().insert("tradeHistory.insert", history);
	}

}
