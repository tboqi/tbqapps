package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.Friend;
import com.cc.cw.exception.ServiceException;

public interface FriendService {
	
	/**
	 * 请求加为好友
	 * @param friend
	 * @return boolean 
	 */
	public int apply(Friend friend) throws ServiceException;
	
	/**
	 * 根据用户id和好友id屏蔽好友
	 * @param myId
	 * @param friendId
	 * @return boolean
	 * @throws ServiceException
	 */
	public boolean remove(int id) throws ServiceException;
	
	/**
	 * 确定为正式的好友关系
	 * @param myId
	 * @param friendId
	 * @return boolean
	 */
	public boolean confirm(int id) throws ServiceException;
	
	/**
	 * 获取指定会员所有类型的好友列表
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Friend>
	 */
	public List<Friend> getAllFriends(int myId, int page, int count) throws ServiceException;

	/**
	 * 获得指定会员的处于某一好友状态的好友列表
	 * @param myId
	 * @param state
	 * @param page
	 * @param pageCount
	 * @return List<Friend>
	 */
	public List<Friend> getGivenStateFriends(int myId, int state, int page, int count) throws ServiceException;

	/**
	 * 获得会员的所有好友数量
	 * @param myId
	 * @param state
	 * @return int
	 */
	public int getAllFriendsCount(int myId) throws ServiceException;
	
	/**
	 * 获得会员指定状态的好友数量
	 * @param myId
	 * @param state
	 * @return int
	 */
	public int getGivenStateFriendsCount(int myId, int state) throws ServiceException;
	
	/**
	 * 查询我的某个好友
	 * @param myId
	 * @param friendId
	 * @return Friend
	 */
	public Friend showFriend(int myId, int friendId) throws ServiceException;
	
	public void delete(int myId, int friendId)  throws ServiceException;
}
