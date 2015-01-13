package com.cc.cw.dao;

import java.util.Date;

import com.cc.cw.domain.ClickLog;

/**
 * 负责将用户点击信息入库
 * @author dzh
 * 上午11:03:43
 */
public interface ClickLogDAO {
	
	public int add(ClickLog log);
	
	public int createTableTest(String tableName);
	
	public String getCurrentTableTest();
	
	/**
	 * 更新uuid
	 * @param uuid
	 * @param oldUuid
	 * @return
	 */
	public boolean updateUUID(String uuid,String oldUuid);

	/**
	 * 查询相同uuid和articleId记录的数量
	 * @param uuid
	 * @param articleId
	 * @return
	 */
	public int countSameRecord(String uuid, int articleId);
	
	/**
	 * 更新点击时间
	 * @param uuid
	 * @param articleId
	 * @param date
	 * @return
	 */
	public int updateClickTime(String uuid,int articleId,Date date);
}
