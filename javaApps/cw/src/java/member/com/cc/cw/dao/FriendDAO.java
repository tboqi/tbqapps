package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Friend;

public interface FriendDAO{
	
	/**
	 * 请求加为好友关系
	 * @param friend
	 * @return Object(Integer)
	 */
	public Object add(Friend friend,int state);

	
	/**
	 * 更新好友关系
	 * @param myId
	 * @param friendId
	 * @return Object(Integer)
	 */
	public Object updateState(int id, int state);
	
	/**
	 * 获得指定会员某一类型的好友列表
	 * @param myId
	 * @param state: 0：等待验证的好友 | 1：通过验证的好友 | -1：被屏蔽的好友  
	 * @param page
	 * @param count
	 * @return List(Friend)
	 */
	public List<Friend> getGivenStateFriends(int myId, int state, int page, int count);
	
	/**
	 * 获取指定会员所有状态的好友列表
	 * @param myId
	 * @param page
	 * @param count
	 * @return List(Friend)
	 */
	public List<Friend> getAllFriends(int myId, int page, int count);
	
	/**
	 * 获得指定所有状态的好友数量
	 * @param myId
	 * @param state
	 * @return Object(Integer)
	 */
	public Object getAllCount(int myId);
	
	/**
	 * 获得指定状态的好友数量
	 * @param myId
	 * @param state
	 * @return Object(Integer)
	 */
	public Object getGivenStateCount(int myId, int state);
	
	/**
	 * 查询我的某个好友
	 * @param myId
	 * @param friendId
	 * @return Object(Friend)
	 */
	public Object showFriend(int myId, int friendId);
	
	public void delete(int myId, int friendId);
	
}
