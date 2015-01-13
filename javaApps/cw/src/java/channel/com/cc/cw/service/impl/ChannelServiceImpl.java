package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.ChannelDAO;
import com.cc.cw.domain.Channel;
import com.cc.cw.service.ChannelService;

public class ChannelServiceImpl implements ChannelService {


	public List<Channel> getHotChannels(int page, int count,
			String notIn) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getHotChannels(start,count,notIn);
	}
	public List<Channel> getHotChannelsTuijian(int page, int count,
			String notIn) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getHotChannelsTuijian(start,count,notIn);
	}

	private ChannelDAO dao ;
	
	public ChannelDAO getDao() {
		return dao;
	}

	public void setDao(ChannelDAO dao) {
		this.dao = dao;
	}

	public int add(Channel channel) {
		return dao.add(channel);
	}

	public Channel getById(int channelId) {
		return dao.getById(channelId);
	}

	public boolean delete(int channelId) {
		return dao.remove(channelId) > 0;
	}

	public boolean update(Channel channel) {
		return dao.update(channel) > 0;
	}
	
	public boolean updateVoteCount(int id,String voteCategory){
		return dao.updateVoteCount(id,voteCategory) > 0;
	}
	
	@SuppressWarnings("unchecked")
	public List<Channel> getHotChannels(int page ,int count){
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getHotChannels(start,count);
	}
	
	@SuppressWarnings("unchecked")
	public List<Channel> getHotChannelsTuijian(int page ,int count){
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getHotChannelsTuijian(start,count);
	}
	
	public int getHotChannelsCount(){
		return dao.getHotChannelsCount();
	}
	
	@SuppressWarnings("unchecked")
	public List<Channel> getChannels(int state, int count){
		return dao.getChannels(state, count);
	}
	
	public int getChannelCount(int state){
		return dao.getChannelCount(state);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getAllChannels() {
		return dao.getAllChannels();
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getNewChannels(int id) {
		return dao.getNewChannels(id);
	}

	public boolean havaNewChannel(int id) {
		int count = dao.getNewChannelsCount(id);
		return count > 0;
	}
	
	public List<Channel> getNewChannelsOrderByDate(int count){
		return dao.getNewChannelsOrderByDate(count);
	}
	
	public List<Channel> getChannelsByStateOrderByDate(int page,int count,int state) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getChannelsByStateOrderByDate(start,count,state);
	}
	
	public int getChannelCountByState(int state){
		return dao.getChannelCountByState(state);
	}
	
	public List<Channel> getChannelsByMemberId(int memberId, int state, int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getChannelsByMemberId(memberId, state, start, count);
	}

	public int getChannelCountByMemberId(int memberId, int state) {
		return dao.getChannelCountByMemberId(memberId, state);
	}
	
	/**
	 * 根据用户id获取频道列表
	 * @param page
	 * @param count
	 * @param memberId
	 * @return
	 */
	public List<Channel> getByMemberId(int page,int count,int memberId){
		int start = 0;
		if(page > 0)
			start =( page-1) * count;
		return dao.getByMemberId(start,count,memberId);
	}
	
	public int getCountByMemberId(int memberId){
		return dao.getCountByMemberId(memberId);
	}

	
	/**
	 * 添加到指定频道
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	public boolean addToChannel(int articleId,int channelId){
		return dao.addToChannel(articleId,channelId);
	}
	
	/**
	 * 添加引用到指定频道
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	public boolean addReferenceToChannel(int articleId,int channelId){
		//FIXME need to optimize,we don't have enough time to do 
		boolean flag = dao.addReferenceToChannel(articleId,channelId);
		if(flag){
			Channel c = this.getById(channelId);
			c.setArticleNums(c.getArticleNums() + 1);
			return this.update(c);
		}else{
			return false;
		}
	}

	public boolean haveThisReference(int articleId, int memberId) {
		return dao.haveThisReference(articleId, memberId) > 0;
	}

	public List<Channel> search(String key, int page, int count) {
		int start = 0;
		if(page > 0)
			start =( page-1) * count;
		
		return dao.search(key, start, count);
	}

	public int searchCount(String key) {
		return dao.searchCount(key);
	}
	
	public int count(){
		return dao.count();
	}
	public List<Channel> find(int start, int num){
		return dao.find(start, num);
	}

	public int countLikeKey(String key) {
		return dao.countLikeKey(key);
	}

	public List<Channel> findLikeKey(String key, int start, int num) {
		return dao.findLikeKey(key, start, num);
	}
	
	public void screen(int id, int state){
		dao.screen(id, state);
	}
	
	public void tuijian(int id, int tuijian){
		dao.tuijian(id, tuijian);
	}
}
