package com.cc.cw.service.impl;

import com.cc.cw.dao.TradeHistoryDAO;
import com.cc.cw.domain.TradeHistory;
import com.cc.cw.service.TradeHistoryService;

public class TradeHistoryServiceImpl implements TradeHistoryService {
	private TradeHistoryDAO tradeHistoryDAO;

	public TradeHistoryDAO getTradeHistoryDAO() {
		return tradeHistoryDAO;
	}

	public void setTradeHistoryDAO(TradeHistoryDAO tradeHistoryDAO) {
		this.tradeHistoryDAO = tradeHistoryDAO;
	}

	public void insert(TradeHistory history) {
		tradeHistoryDAO.insert(history);
	}

}
