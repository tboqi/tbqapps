package com.cc.cw.service;

import java.util.List;

public interface UserChannelService {

	public List getUserChannels(String uuid, int start, int count);
	public int getUserChannelsCount(String uuid);
}
