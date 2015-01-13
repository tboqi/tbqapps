package com.cc.cw.dao;

import java.util.List;
import java.util.Map;

import com.cc.cw.domain.Broadcast;

public interface BroadcastDAO {
	/** 发布一条新广播 */
	public int add(Broadcast broadcast);
	
	/** 根据发布时间倒序取的广播 实现分页 */
	public List<Broadcast> getBroadcastOrderByDate(int start, int count);

	public List<Broadcast> getBroadcastOrderByDate(String string, String key, int start, int count);

	public List<Broadcast> getBroadcastOrderByDate(Map<String, Object> map, int start, int count);

	public int getCount(String string, String key);

	public int getCount(Map<String, Object> map);

	public int getCount();

	public void deleteByIds(String ids);

	public Broadcast get(int id);
	
}
