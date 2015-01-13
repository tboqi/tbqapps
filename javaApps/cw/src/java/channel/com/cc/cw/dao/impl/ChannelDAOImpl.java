package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.ChannelDAO;
import com.cc.cw.domain.Channel;

public class ChannelDAOImpl extends SqlMapClientDaoSupport implements
		ChannelDAO {
	private final Log log = LogFactory.getLog(getClass());

	@SuppressWarnings("unchecked")
	public List<Channel> getHotChannels(int start, int count, String notIn) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("notIn", notIn);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getHotChannelsNotIn", map);
	}
	public List<Channel> getHotChannelsTuijian(int start, int count, String notIn) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("notIn", notIn);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getHotChannelsNotInTuijian", map);
	}

	public int add(Channel channel) {
		return (Integer) this.getSqlMapClientTemplate().insert("channel.add",
				channel);
	}

	public Channel getById(int id) {
		return (Channel) this.getSqlMapClientTemplate().queryForObject(
				"channel.getById", id);
	}

	public int remove(int id) {
		return this.getSqlMapClientTemplate().delete("channel.remove", id);
	}

	public int update(Channel channel) {
		return this.getSqlMapClientTemplate().update("channel.update", channel);
	}

	/**
	 * 根据传入的字段名,id,增加给定的value值
	 * 
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public int increaseFieldValueById(int id, String field, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("field", field);
		map.put("value", value);
		return this.getSqlMapClientTemplate().update(
				"channel.increaseFieldValueById", map);
	}

	public int updateVoteCount(int id, String VoteCategory) {
		String field = "";
		if (VoteCategory.equals("Support")) {
			field = "SupportCount";
		} else if (VoteCategory.equals("UnSupport")) {
			field = "UnSupportCount";
		} else {
			log.error("没有适合的类型");
			return 0;
		}

		return this.increaseFieldValueById(id, field, 1);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getAllChannels() {
		return this.getSqlMapClientTemplate().queryForList(
				"channel.getAllChannels", null);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getNewChannels(int id) {
		return this.getSqlMapClientTemplate().queryForList(
				"channel.getNewChannels", id);
	}

	public int getNewChannelsCount(int id) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"channel.getNewChannelsCount", id);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getHotChannels(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getHotChannels", map);
	}
	@SuppressWarnings("unchecked")
	public List<Channel> getHotChannelsTuijian(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getHotChannelsTuijian", map);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getChannels(int state, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("count", count);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getChannels", map);
	}

	public int getChannelCount(int state) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"channel.getChannelCount", state);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getNewChannelsOrderByDate(int count) {
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getNewChannelsOrderByDate", count);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getChannelsByStateOrderByDate(int start, int count,
			int state) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("count", count);
		map.put("state", state);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getChannelsByStateOrderByDate", map);
	}

	public int getChannelCountByState(int state) {
		int count = 0;
		Object obj = getSqlMapClientTemplate().queryForObject(
				"channel.getChannelCountByState", state);
		if (obj != null)
			count = Integer.parseInt(obj.toString());
		return count;
	}

	public int getHotChannelsCount() {
		int count = 0;
		Object obj = getSqlMapClientTemplate().queryForObject(
				"channel.getHotChannelsCount", null);
		if (obj != null) {
			count = Integer.parseInt(obj.toString());
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getChannelsByMemberId(int memberId, int state,
			int start, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberId", memberId);
		map.put("start", start);
		map.put("count", count);
		map.put("state", state);
		return (List<Channel>) this.getSqlMapClientTemplate().queryForList(
				"channel.getChannelsByMemberId", map);
	}

	public int getChannelCountByMemberId(int memberId, int state) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberId", memberId);
		map.put("state", state);
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"channel.getChannelCountByMemberId", map);
	}

	/**
	 * 根据用户id获取频道列表
	 * 
	 * @param page
	 * @param count
	 * @param memberId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Channel> getByMemberId(int start, int count, int memberId) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("memberId", memberId);
		return getSqlMapClientTemplate().queryForList("channel.getByMemberId",
				map);
	}

	public int getCountByMemberId(int memberId) {
		int count = 0;
		Object obj = getSqlMapClientTemplate().queryForObject(
				"channel.getCountByMemberId", memberId);
		if (obj != null) {
			count = Integer.parseInt(obj.toString());
		}
		return count;
	}

	/**
	 * 添加到指定频道
	 * 
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean addToChannel(int articleId, int channelId) {
		Map map = new HashMap();
		map.put("articleId", articleId);
		map.put("channelId", channelId);
		return getSqlMapClientTemplate().update("channel.addToChannel", map) > 0;
	}

	/**
	 * 添加引用到指定频道
	 * 
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean addReferenceToChannel(int articleId, int channelId) {
		Map map = new HashMap();
		map.put("articleId", articleId);
		map.put("channelId", channelId);
		return getSqlMapClientTemplate().update(
				"channel.addReferenceToChannel", map) > 0;
	}

	@SuppressWarnings("unchecked")
	public int haveThisReference(int articleId, int memberId) {
		Map map = new HashMap();
		map.put("articleId", articleId);
		map.put("memberId", memberId);
		Object obj = getSqlMapClientTemplate().queryForObject(
				"channel.haveThisReference", map);
		return obj == null ? 0 : (Integer) obj;
	}

	@SuppressWarnings("unchecked")
	public List<Channel> search(String key, int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("key", key);
		return getSqlMapClientTemplate().queryForList("channel.searchChannel",
				map);
	}

	public int searchCount(String key) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"channel.searchChannelCount", key);
		int i = 0;
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public int count() {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"channel.count", null);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> find(int start, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return getSqlMapClientTemplate().queryForList("channel.find", map);
	}

	public int countLikeKey(String key) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"channel.countLikeKey", key);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> findLikeKey(String key, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return getSqlMapClientTemplate().queryForList("channel.findLikeKey", map);
	}

	public void screen(int id, int state) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", new Integer(id));
		map.put("state", new Integer(state));
		getSqlMapClientTemplate().update("channel.screen", map);
	}
	
	public void tuijian(int id, int tuijian){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", new Integer(id));
		map.put("tuijian", new Integer(tuijian));
		getSqlMapClientTemplate().update("channel.tuijian", map);
	}
}
