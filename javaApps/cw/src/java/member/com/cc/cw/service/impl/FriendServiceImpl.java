package com.cc.cw.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.dao.FriendDAO;
import com.cc.cw.domain.Friend;
import com.cc.cw.exception.ServiceException;
import com.cc.cw.service.FriendService;

public class FriendServiceImpl implements FriendService {
	protected final Log log = LogFactory.getLog(getClass());
	private FriendDAO dao = null;
	
	public void setDao(FriendDAO friendDAO){
		this.dao = friendDAO;
	}

	@SuppressWarnings("unused")
	private FriendDAO getDao(){
		return dao;
	}
		
	public int apply(Friend friend) throws ServiceException{
		int myId = friend.getMyId();
		int friendId = friend.getFriendId();
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}else if(friendId <= 0){
			throw new ServiceException("friendId must bigger than 0!");
		}else if(myId == friendId){
			throw new ServiceException("myId must be different with friendId!");
		}
		
		//首先加对方为好友
		friend.setPassedTime(new Date());
		Object obj = dao.add(friend, 1);
		int id = 0;
		if(obj != null)
			id = (Integer)obj;
		//如果添加成功，则向对方发出好友申请
		if(id > 0){
			Friend f = new Friend();
			f.setMyId(friend.getFriendId());
			f.setFriendId(friend.getMyId());
			f.setComment(friend.getComment());
			
			obj = dao.add(f, 0);
			if(obj != null)
				id = (Integer)obj;
		}
		return id;
	}

	public boolean remove(int id) throws ServiceException {
		if(id <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}
		
		Object obj = dao.updateState(id,Friend.STATE_REFUSED);
		boolean success = false; 
		if(obj != null)
			success = (Integer)obj > 0;
		
		return success;
	}

	public boolean confirm(int id) throws ServiceException {
		if(id <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}
		
		Object obj = dao.updateState(id,Friend.STATE_FRIEND);
		boolean success = false;
		if(obj != null)
			success = (Integer)obj > 0;
			
		return success;
	}
	
	public List<Friend> getAllFriends(int myId, int page, int count) throws ServiceException {
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}else if(page <= 0){
			throw new ServiceException("page must bigger than 0!");
		}else if(count <= 0){
			throw new ServiceException("count must bigger than 0!");
		}
		
		return dao.getAllFriends(myId, page, count);
	}
	
	public List<Friend> getGivenStateFriends(int myId, int state, int page, int count) throws ServiceException {
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}else if(state != Friend.STATE_REFUSED && state != Friend.STATE_APPLYING && state != Friend.STATE_FRIEND ){
			throw new ServiceException("state is wrong!");
	    }else if(page <= 0){
			throw new ServiceException("page must bigger than 0!");
	    }else if(count <= 0){
			throw new ServiceException("count must bigger than 0!");
	    }
		
		return dao.getGivenStateFriends(myId, state, page, count);
	}

	public int getAllFriendsCount(int myId) throws ServiceException {
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}
		
		Object obj = dao.getAllCount(myId);
		int count = 0;
		if(obj != null)
			count = (Integer)obj;
		
		return count;
	}
	
	public int getGivenStateFriendsCount(int myId, int state) throws ServiceException {
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}else if(state != Friend.STATE_REFUSED && state != Friend.STATE_APPLYING && state != Friend.STATE_FRIEND ){
			throw new ServiceException("state is wrong!");
		}
		Object obj = dao.getGivenStateCount(myId, state);
		int count = 0;
		if(obj != null)
			count = (Integer)obj;
		
		return count;
	}

	public Friend showFriend(int myId, int friendId) throws ServiceException {
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}else if(friendId <= 0){
			throw new ServiceException("friendId must bigger than 0!");
		}else if(myId == friendId){
			throw new ServiceException("myId must be different with friendId!");
		}
		Object obj = dao.showFriend(myId, friendId);
		Friend friend = null;
		if(obj != null)
			friend = (Friend)obj;
		
		return friend;
	}

	public void delete(int myId, int friendId) throws ServiceException {
		if(myId <= 0){
			throw new ServiceException("myId must bigger than 0!");
		}else if(friendId <= 0){
			throw new ServiceException("friendId must bigger than 0!");
		}else if(myId == friendId){
			throw new ServiceException("myId must be different with friendId!");
		}
		dao.delete(myId, friendId);
	}
	
}
