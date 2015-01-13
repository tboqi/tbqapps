package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.FriendDAO;
import com.cc.cw.domain.Friend;

/**
 * 
 * @author pwb
 *
 */
public class FriendDAOImpl extends SqlMapClientDaoSupport implements FriendDAO{
	
	Log log = LogFactory.getLog(FriendDAOImpl.class);
	public Object add(Friend friend,int state) {
		friend.setState(state);
		return this.getSqlMapClientTemplate().insert("friend.add", friend);
	}

	public Object updateState(int id, int state){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("state", state);
		Object obj =  this.getSqlMapClientTemplate().update("friend.update", map);

		return obj;
	}
	
	@SuppressWarnings("unchecked")
	public List<Friend> getAllFriends(int myId, int page, int count) {
		int start = (page - 1)*count;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("myId", myId);
		map.put("start", start);
		map.put("count", count);

		return (List<Friend>)this.getSqlMapClientTemplate().queryForList("friend.getAllFriends", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Friend> getGivenStateFriends(int myId, int state, int page, int count) {
		int start = (page - 1)*count;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("myId", myId);
		map.put("state", state);
		map.put("start", start);
		map.put("count", count);
		
		return (List<Friend>)this.getSqlMapClientTemplate().queryForList("friend.getGivenStateFriends", map);
	}

	public Object showFriend(int myId, int friendId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("myId", myId);
		map.put("friendId", friendId);
		
		return this.getSqlMapClientTemplate().queryForObject("friend.getState", map);
	}

	public Object getAllCount(int myId){
		return this.getSqlMapClientTemplate().queryForObject("friend.getAllCount", myId);
	}
	
	public Object getGivenStateCount(int myId, int state){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("myId", myId);
		map.put("state", state);
		return this.getSqlMapClientTemplate().queryForObject("friend.getGivenStateCount", map);
	}

	public void delete(int myId, int friendId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("myId", myId);
		map.put("friendId", friendId);
		this.getSqlMapClientTemplate().update("friend.delete", map);
	}


}
