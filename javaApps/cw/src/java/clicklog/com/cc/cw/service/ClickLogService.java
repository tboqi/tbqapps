package com.cc.cw.service;

import java.util.Date;

import com.cc.cw.domain.ClickLog;

/**
 * 负责将用户点击信息入库
 * @author dzh
 * 下午02:13:07
 */
public interface ClickLogService {

	public int add(ClickLog log);
	
	public boolean updateUUID(String uuid,String oldUuid);
	
	/**
	 * 根据uuid和文章id查询是否有重复记录
	 * @param uuid
	 * @param articleId
	 * @return
	 */
	public boolean haveSameRecord(String uuid, int articleId);
	
	public boolean updateClickTime(String uuid,int articleId,Date date);
}
