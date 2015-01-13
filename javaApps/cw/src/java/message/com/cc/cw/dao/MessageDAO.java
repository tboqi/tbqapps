package com.cc.cw.dao;
import java.util.List;

import com.cc.cw.domain.Message;
public interface MessageDAO {

	/**
	 * 查询用户所有短消息
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Message>
	 */
	public List<Message> getAllMessages(int memberId,  int page, int count);
	
	/**
	 * 查询用户所有已读的短消息
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Message>
	 */
	public List<Message> getReadedMessage(int memberId,  int page, int count);
	
	/**
	 * 查询用户所有未读的短消息
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Message>
	 */
	public List<Message> getUnReadedMessage(int memberId,  int page, int count);
	
	/**
	 * 增加短消息
	 * @param msg
	 * @return int 新增短消息的id
	 */
	public int add(Message msg);
  
	/**
	 * 更新短消息状态
	 * @param id
	 * @param state
	 * @return
	 */
	public int updateState(int id,int state); 
  
	/**
	 * 删除短消息
	 * @param id
	 * @return
	 */
	public int delete(int id);
  
	/**
	 * 查询一条短消息
	 * @param id
	 * @return
	 */
	public Message get(int id);
  
	/**
	 * 查询用户拥有短消息数量
	 * @param memberId
	 * @param state：-1：查询全部 | 0：查询未读 | 1：查询已读
	 * @return int
	 */
	public int getMessageCount(int memberId,int state);
	
	/**
	 * 查询用户的留言
	 * @param memberId
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Message> getForeinMessages(int memberId,int start,int count);
	public int getForeinMessageCount(int memberId);

	public int count(int msgType);

	public int countLikeContent(String key, int msgType);

	public int countInMemberIds(String memberIds, int msgType);

	public void deleteByIds(String ids);

	public List<Message> findLikeContent(String key, int msgType, int start, int count);

	public List<Message> findInMemberIds(String memberIds, int msgType, int start, int count);

	public List<Message> find(int msgType, int start, int count);
}
