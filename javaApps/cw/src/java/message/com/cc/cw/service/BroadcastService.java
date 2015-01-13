package com.cc.cw.service;

import java.util.List;
import java.util.Map;

import com.cc.cw.domain.Broadcast;

public interface BroadcastService {
	
	/** 发布一条新广播 */
	public int add(Broadcast broadcast);
	
	/** 根据发布时间倒序取的广播 实现分页 */
	public List<Broadcast> getBroadcastOrderByDate(int page, int count);

	public int getCount(String string, String key);

	public List<Broadcast> getBroadcastOrderByDate(String string, String key, int start, int count);

	public int getCount(Map<String, Object> map);

	public List<Broadcast> getBroadcastOrderByDate(Map<String, Object> map, int start, int count);

	public int getCount();

	public void deleteByIds(String ids);

	public Broadcast get(int id);

}
