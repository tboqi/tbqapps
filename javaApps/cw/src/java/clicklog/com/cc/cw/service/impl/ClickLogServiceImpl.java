package com.cc.cw.service.impl;

import java.util.Date;

import com.cc.cw.dao.ClickLogDAO;
import com.cc.cw.domain.ClickLog;
import com.cc.cw.service.ClickLogService;

public class ClickLogServiceImpl implements ClickLogService {

	private ClickLogDAO clickLogDAO;
	
	public int add(ClickLog log) {
		return clickLogDAO.add(log);
	}

	public void setClickLogDAO(ClickLogDAO dao) {
		this.clickLogDAO = dao;
	}

	public synchronized boolean updateUUID(String uuid, String oldUuid) {
		return clickLogDAO.updateUUID(uuid, oldUuid);
	}

	public boolean haveSameRecord(String uuid, int articleId){
		return clickLogDAO.countSameRecord(uuid, articleId) > 0;
	}
	
	public boolean updateClickTime(String uuid,int articleId,Date date){
		return clickLogDAO.updateClickTime(uuid,articleId,date) > 0;
	}
}
