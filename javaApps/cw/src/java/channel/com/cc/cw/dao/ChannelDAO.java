package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Channel;

/**
 * 频道dao
 * @author lsd037
 *
 */
public interface ChannelDAO {

	/**
	 * 添加channel
	 * @param channel
	 * @return
	 */
	public int add(Channel channel);
	
	/**
	 * 修改channel
	 * @param channel
	 * @return
	 */
	public int update(Channel channel);
	
	/**
	 * 删除channel
	 * @param id
	 * @return
	 */
	public int remove(int channelId);
	
	/**
	 * 根据id获得channel
	 * @param id
	 * @return
	 */
	public Channel getById(int channelId);
	
	/**
	 * 根据id更新票数
	 * @param id
	 * @param voteCategory
	 * @return
	 */
	public int updateVoteCount(int id,String voteCategory);
	
	/**
	 * 获得所有channel
	 * @param channelId
	 * @return List<Channel> 
	 */
	public List<Channel> getAllChannels();
	
	/**
	 * 获得所有大于参数ID的channel
	 * @param id
	 * @return List<Channel>
	 */
	public List<Channel> getNewChannels(int id);
	
	/**
	 * 得到新增频道的数量
	 * @param id
	 * @return int
	 */
	public int getNewChannelsCount(int id);
	
	/**
	 * 获取最热频道
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Channel> getHotChannels(int start,int count);
	/** 获取最热频道总数 */
	public int getHotChannelsCount();
	
	public List<Channel> getChannels(int start, int count);
	
	public int getChannelCount(int state);
	
	/**
	 * 获得最新频道
	 * @param count 返回的纪录数量
	 * @return List<Channel> 
	 */
	public List<Channel> getNewChannelsOrderByDate(int count);
	
	/**
	 * 获得状态为1的所有频道
	 * @return List<Channel>
	 */
	public List<Channel> getChannelsByStateOrderByDate(int start ,int count, int state);
	public int getChannelCountByState(int state);
	
	/**
	 * 通过用户ID获得所创建的频道
	 * @param memberId
	 * @param state
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Channel> getChannelsByMemberId(int memberId, int state, int start, int count);
	
	/**
	 * 根据用户ID获得创建频道总数
	 * @param memberId
	 * @param state
	 * @return
	 */
	public int getChannelCountByMemberId(int memberId, int state);
	
	/**
	 * 根据用户id获取频道列表
	 * @param page
	 * @param count
	 * @param memberId
	 * @return
	 */
	public List<Channel> getByMemberId(int start,int count,int memberId);
	public int getCountByMemberId(int memberId);
	
	/**
	 * 添加到指定频道
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	public boolean addToChannel(int articleId,int channelId);
	
	/**
	 * 添加引用到指定频道
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	public boolean addReferenceToChannel(int articleId,int channelId);

	/**
	 * 获得最热文章，并排出提供的Id
	 * @param start
	 * @param count
	 * @param notIn
	 * @return
	 */
	public List<Channel> getHotChannels(int start, int count,
			String notIn);
	
	/**
	 * 检查是否已经收录此文章
	 * @param articleId
	 * @param memberId
	 * @return
	 */
	public int haveThisReference(int articleId,int memberId);

	public List<Channel> search(String key,int start,int count);
	
	public int searchCount(String key);
	
	public int count();
	public List<Channel> find(int start, int num);

	public int countLikeKey(String key);

	public List<Channel> findLikeKey(String key, int start, int num);

	public void screen(int id, int state);

	public void tuijian(int id, int tuijian);

	public List<Channel> getHotChannelsTuijian(int start, int count);

	public List<Channel> getHotChannelsTuijian(int start, int count, String notIn);
}
