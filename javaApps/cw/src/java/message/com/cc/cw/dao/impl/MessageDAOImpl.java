package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.MessageDAO;
import com.cc.cw.domain.Message;

public class MessageDAOImpl extends SqlMapClientDaoSupport implements
		MessageDAO {
	@SuppressWarnings("unchecked")
	public List<Message> getAllMessages(int memberId, int start, int count) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("count", count);
		map.put("id", memberId);
		return (List<Message>) this.getSqlMapClientTemplate().queryForList(
				"message.getAllMessages", map);
	}

	@SuppressWarnings("unchecked")
	private List<Message> getMessageByState(int memberId, int start, int count,
			int state) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("count", count);
		map.put("id", memberId);
		map.put("state", state);
		return (List<Message>) this.getSqlMapClientTemplate().queryForList(
				"message.getMessageByState", map);
	}

	@SuppressWarnings("unchecked")
	public List<Message> getReadedMessage(int memberId, int page, int count) {
		return getMessageByState(memberId, page, count, 1);
	}

	@SuppressWarnings("unchecked")
	public List<Message> getUnReadedMessage(int memberId, int page, int count) {
		return getMessageByState(memberId, page, count, 0);
	}

	public int add(Message msg) {
		return (Integer) this.getSqlMapClientTemplate().insert(
				"message.addMessage", msg);
	}

	public int updateState(int id, int state) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		map.put("state", state);
		return this.getSqlMapClientTemplate()
				.update("message.updateState", map);
	}

	public int delete(int id) {
		int i = this.getSqlMapClientTemplate().delete("message.deleteMessage",
				new Integer(id));
		return i;
	}

	public Message get(int id) {
		return (Message) this.getSqlMapClientTemplate().queryForObject(
				"message.getMessage", new Integer(id));
	}

	public int getMessageCount(int memberId, int state) {
		switch (state) {
		case 1:
			return this.getMessageCountByState(memberId, 1);
		case 0:
			return this.getMessageCountByState(memberId, 0);
		case -1:
			return this.getAllMessageCount(memberId);
		case 2:
			return this.getMessageCountByState(memberId, 2);
		default:
			return 0;
		}
	}

	private int getAllMessageCount(int memberId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"message.getAllMessageCount", memberId);
		return obj == null ? 0 : (Integer) obj;
	}

	private int getMessageCountByState(int memberId, int state) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberId", memberId);
		map.put("state", state);
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"message.getMessageCountByState", map);
		return obj == null ? 0 : (Integer) obj;
	}

	@SuppressWarnings("unchecked")
	public List<Message> getForeinMessages(int memberId, int start, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("count", count);
		map.put("id", memberId);

		return (List<Message>) this.getSqlMapClientTemplate().queryForList(
				"message.getForeinMessages", map);
	}

	public int getForeinMessageCount(int memberId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"message.getForeinMessageCount", memberId);
		return obj == null ? 0 : (Integer) obj;
	}

	public int count(int msgType) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"message.count", new Integer(msgType));
	}

	public int countInMemberIds(String memberIds, int msgType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIds", memberIds);
		map.put("msgType", new Integer(msgType));
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"message.countInMemberIds", map);
	}

	public int countLikeContent(String key, int msgType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("msgType", new Integer(msgType));
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"message.countLikeContent", map);
	}

	public void deleteByIds(String ids) {
		getSqlMapClientTemplate().delete(
				"message.deleteByIds", ids);
	}

	@SuppressWarnings("unchecked")
	public List<Message> find(int msgType, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msgType", new Integer(msgType));
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return getSqlMapClientTemplate().queryForList(
				"message.find", map);
	}
	@SuppressWarnings("unchecked")
	public List<Message> findInMemberIds(String memberIds, int msgType,
			int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIds", memberIds);
		map.put("msgType", new Integer(msgType));
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return getSqlMapClientTemplate().queryForList(
				"message.findInMemberIds", map);
	}
	@SuppressWarnings("unchecked")
	public List<Message> findLikeContent(String key, int msgType, int start,
			int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("msgType", new Integer(msgType));
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return getSqlMapClientTemplate().queryForList(
				"message.findLikeContent", map);
	}

}
