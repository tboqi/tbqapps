package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.UserChannelDAO;
import com.cc.cw.service.UserChannelService;

public class UserChannelServiceImpl implements UserChannelService {
	private UserChannelDAO dao;

	public UserChannelDAO getDao() {
		return dao;
	}

	public void setDao(UserChannelDAO dao) {
		this.dao = dao;
	}

	public List getUserChannels(String uuid, int start, int count) {
		//List list = dao.getUserChannels(uuid, start, count);
		List list = dao.getChannelsByUserChannel(uuid, start, count);
		return list;
	}

	public int getUserChannelsCount(String uuid) {
		
		//return dao.getUserChannelsCount(uuid);
		return dao.getChannelsCountByUserChannel(uuid);
	}

	public static void main(String args[]) {

	}
}
