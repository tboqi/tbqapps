package com.cc.cw.service;
import com.cc.cw.domain.*;

import java.util.*;
public interface MessageService {
	/**
	 * 添加一个发送消息的对象,检索发送的对象是否有效.如果有效.则添加并显示出来
	 * @param msg
	 * @return int -1：代表接收方用户不存在
	 */
	public int add(Message msg);
    
	/**
	 * 修改消息状态(0为未查看,1为已查看)
	 * @param id
	 * @param state
	 * @return true：修改成功 || false：修改失败
	 */
	public boolean updateState(int id, int state); 
	
	/**
	 * 获得用户的所有短消息
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Message>
	 */
	public List<Message> getAllMessages(int memberId,  int page, int count);
	
	/**
	 * 获得用户所有已读短消息
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Message>
	 */
	public List<Message> getReadedMessage(int memberId,  int page, int count);
	
	/**
	 * 获得用户所有未读短消息
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<Message>
	 */
	public List<Message> getUnReadedMessage(int memberId,  int page, int count);
	
	/**
	 * 查询一条短消息
	 * @param id
	 * @return Message
	 */
	public Message get(int id);
	
	/**
	 * 删除短消息
	 * @param id
	 * @return
	 */
	public int delete(int id);
	
	public int getAllMessageCount(int memberId);
	
	public int getUnReadMessageCount(int memberId);
	
	public int getReadedMessageCount(int memberId);

	/**
	 * 查询用户的所有留言
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List(Message)
	 */
	public List<Message> getForeinMessages(int memberId,int page,int count);
	/**
	 * 查询用户的所有留言总数
	 * @param memberId
	 * @return
	 */
	public int getForeinMessageCount(int memberId);
	
	public void sendMessage(int formId,int toId, int messageType, String messageTitle, String content);

	public void deleteByIds(String ids);

	public int countLikeMember(String key, int msgType);

	public List<Message> findLikeMember(String key, int msgType, int start, int count);

	public int countLikeContent(String key, int msgType);

	public List<Message> findLikeContent(String key, int msgType, int start, int count);

	public int count(int msgType);

	public List<Message> find(int msgType, int start, int count);
	
}
