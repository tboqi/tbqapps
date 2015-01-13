package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.FriendLink;

public interface FriendLinkDAO {
	public void insert(FriendLink link);

	public void update(FriendLink link);

	public void delete(int id);

	public int getCount();

	public List<FriendLink> getLink(int start, int num);

	public int getCount(String condition);

	public List<FriendLink> getLink(String condition, int start, int num);
	public List<FriendLink> getLink(String condition);

	public FriendLink get(int i);
}
