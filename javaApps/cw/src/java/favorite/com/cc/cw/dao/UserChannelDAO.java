package com.cc.cw.dao;

import java.util.List;

public interface UserChannelDAO {

	public List getUserChannels(String uuid, int start, int count);

	public int getUserChannelsCount(String uuid);

	public List getChannelsByUserChannel(String uuid, int start, int count);

	public int getChannelsCountByUserChannel(String uuid);
}
