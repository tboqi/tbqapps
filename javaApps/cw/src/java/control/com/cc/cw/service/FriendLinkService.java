package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.FriendLink;

public interface FriendLinkService {
	public void insert(FriendLink link);

	public void update(FriendLink link);

	public void delete(int id);

	public int getCount();

	public List<FriendLink> getLink(int start, int num);

	public int getCount(String condition);

	public List<FriendLink> getLink(String condition, int start, int num);

	/*
	 * 获得首页的友情链接
	 */
	public List<FriendLink> getLinkIndex();

	/*
	 * 获得文字的友情链接
	 */
	public List<FriendLink> getLinkForText();

	/*
	 * 获得图片的友情链接
	 */
	public List<FriendLink> getLinkForPic();

	public FriendLink get(int i);

	public List<FriendLink> getUncheckLink(int i, int j);
}
