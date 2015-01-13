package com.cc.cw.service.impl;

import java.util.List;
import java.util.Map;

import com.cc.cw.dao.BroadcastDAO;
import com.cc.cw.domain.Broadcast;
import com.cc.cw.service.BroadcastService;

public class BroadcastServiceImpl implements BroadcastService {
	private BroadcastDAO broadcastdao;

	public int add(Broadcast broadcast) {
		return broadcastdao.add(broadcast);
	}

	public List<Broadcast> getBroadcastOrderByDate(int page, int count) {
		int start = 0;
		if (page != 0)
			start = (page - 1) * count;
		return broadcastdao.getBroadcastOrderByDate(start, count);
	}

	public BroadcastDAO getBroadcastdao() {
		return broadcastdao;
	}

	public void setBroadcastdao(BroadcastDAO broadcastdao) {
		this.broadcastdao = broadcastdao;
	}

	public List<Broadcast> getBroadcastOrderByDate(String string, String key,
			int start, int count) {
		return broadcastdao.getBroadcastOrderByDate(string, key, start, count);
	}

	public List<Broadcast> getBroadcastOrderByDate(Map<String, Object> map,
			int start, int count) {
		return broadcastdao.getBroadcastOrderByDate(map, start, count);
	}

	public int getCount(String string, String key) {
		return broadcastdao.getCount(string, key);
	}

	public int getCount(Map<String, Object> map) {
		return broadcastdao.getCount(map);
	}

	public int getCount() {
		return broadcastdao.getCount();
	}

	public void deleteByIds(String ids) {
		broadcastdao.deleteByIds(ids);
	}

	public Broadcast get(int id) {
		return broadcastdao.get(id);
	}
}
