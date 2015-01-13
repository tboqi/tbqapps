package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.UserChannelDAO;
import com.cc.cw.dm.dataAnalyze.HashUtil;

public class UserChannelDAOImpl extends SqlMapClientDaoSupport implements UserChannelDAO {

	public List getUserChannels(String uuid, int start, int count) {
		int tablePostfix = HashUtil.getHashCode(uuid);
		String tableName = "user_channel_" + tablePostfix;
		Map<String, String> map = new HashMap<String, String>();
		map.put("uuid", uuid);
		map.put("tableName", tableName);
		map.put("start", new Integer(start).toString());
		map.put("count", new Integer(count).toString());

		return this.getSqlMapClientTemplate().queryForList(
				"userChannel.getUserChannels", map);
	}

	public int getUserChannelsCount(String uuid) {
		int tablePostfix = HashUtil.getHashCode(uuid);
		String tableName = "user_channel_" + tablePostfix;
		Map<String, String> map = new HashMap<String, String>();
		map.put("uuid", uuid);
		map.put("tableName", tableName);
		return (Integer)this.getSqlMapClientTemplate().queryForObject(
				"userChannel.getUserChannelsCount", map);
	}

	public List getChannelsByUserChannel(String uuid, int start, int count) {
		int tablePostfix = HashUtil.getHashCode(uuid);
		String tableName = "user_channel_" + tablePostfix;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uuid", uuid);
		map.put("tableName", tableName);
		map.put("start", start);
		map.put("count", count);
		
		return this.getSqlMapClientTemplate().queryForList(
				"userChannel.getChannelsByUserChannel", map);
	}
	public int getChannelsCountByUserChannel(String uuid) {
		int tablePostfix = HashUtil.getHashCode(uuid);
		String tableName = "user_channel_" + tablePostfix;
		Map<String, String> map = new HashMap<String, String>();
		map.put("uuid", uuid);
		map.put("tableName", tableName);
		return (Integer)this.getSqlMapClientTemplate().queryForObject(
				"userChannel.getChannelsCountByUserChannel", map);
	}
	public static void main(String args[]) {

	}
}
