package com.cc.cw.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.ClickLogDAO;
import com.cc.cw.domain.ClickLog;

public class ClickLogDAOImpl extends SqlMapClientDaoSupport implements ClickLogDAO {

	@SuppressWarnings("unchecked")
	public int add(ClickLog log) {
		int affectLineCount = 0;
		Map map = new HashMap();
		String tableName = getCurrentTable();
		map.put("tableName", tableName );
		map.put("log", log);
		Object obj = this.getSqlMapClientTemplate().update("clicklog.add", map);
		if(obj != null){
			affectLineCount = Integer.parseInt(obj.toString());
		}
		return affectLineCount;
	}
	
	/**
	 * 获取当前的数据库名称，如果不存在，则创建一个新的
	 * @return
	 */
	private String getCurrentTable(){
		String tableName = "clicklog";
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
		String now = sf.format(date);
		String currentTableName = tableName + "_" + now;
		List<String> tablesList = getTables();
		if(tablesList.contains(currentTableName)){
			tableName = currentTableName;
		}else{
			createTable(currentTableName);
			tableName = currentTableName;
		}
		return tableName;
	}
	
	public String getCurrentTableTest(){
		return getCurrentTable();
	}
	
	/**
	 * 创建一个新的数据库
	 * @param tableName
	 * @return
	 */
	private int createTable(String tableName){
		return this.getSqlMapClientTemplate().update("clicklog.createTables", tableName);
	}
	
	public int createTableTest(String tableName){
		return createTable(tableName);
	}
	
	/**
	 * 获取所有点击信息库的名称
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<String> getTables(){
		List<String> list = this.getSqlMapClientTemplate().queryForList("clicklog.getTables", null);
		return list;
	}
	
	public boolean updateUUID(String uuid,String oldUuid){
		Map<String,String> map = new HashMap<String,String>();
		String tableName = this.getCurrentTable();
		map.put("tableName", tableName);
		map.put("uuid", uuid);
		map.put("oldUuid", oldUuid);
		return this.getSqlMapClientTemplate().update("clicklog.updateUUID", map) > 0;
	}
	
	public int countSameRecord(String uuid, int articleId){
		Map<String,Object> map = new HashMap<String,Object>();
		String tableName = this.getCurrentTable();
		map.put("tableName", tableName);
		map.put("articleId", articleId);
		map.put("uuid", uuid);
		return (Integer)this.getSqlMapClientTemplate().queryForObject("clicklog.countSameRecord", map);
	}
	
	public int updateClickTime(String uuid,int articleId,Date date){
		Map<String,Object> map = new HashMap<String,Object>();
		String tableName = this.getCurrentTable();
		map.put("tableName", tableName);
		map.put("articleId", articleId);
		map.put("uuid", uuid);
		map.put("clickTime", date);
		return this.getSqlMapClientTemplate().update("clicklog.updateClickTime", map);
	}
	
}
