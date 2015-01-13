package com.cc.cw.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.VoteDAO;
import com.cc.cw.domain.Vote;

public class VoteDAOImpl extends SqlMapClientDaoSupport implements VoteDAO {

	public int add(Vote vote) {
		return (Integer) this.getSqlMapClientTemplate()
				.insert("vote.add", vote);
	}

	public Vote get(int id) {
		return (Vote) this.getSqlMapClientTemplate().queryForObject("vote.get",
				id);
	}

	public int update(Vote vote) {
		return this.getSqlMapClientTemplate().update("vote.update", vote);
	}

	public int remove(int id) {
		return this.getSqlMapClientTemplate().delete("vote.remove", id);
	}

	public boolean isExist(int memberId, int resourceId, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("resourceId", resourceId);
		map.put("resourceType", type);
		return this.getSqlMapClientTemplate().queryForObject("vote.isExist",
				map) != null ? true : false;
	}

	public Vote isExistForArticle(String voteMember, int resourceId, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("voteMember", voteMember);
		map.put("resourceId", resourceId);
		map.put("resourceType", type);
		return (Vote) this.getSqlMapClientTemplate().queryForObject(
				"vote.isExistForArticle", map);
	}

	// public Vote getByResourceIdMemberId(int ResourceId,int memberId){
	// Map<String,Integer> map = new HashMap<String,Integer>();
	// map.put("articleId", articleId);
	// map.put("memberId", memberId);
	// return
	// (Vote)this.getSqlMapClientTemplate().queryForObject("vote.getByArticleIdMemberId",
	// map);
	// }
	//	
	@SuppressWarnings("unchecked")
	public List<Vote> getVoteListByDate(int resourceId, String type,
			String beginDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginDate", beginDate);
		map.put("endDate", endDate);
		map.put("resourceId", resourceId);
		map.put("resourceType", type);
		return (List<Vote>) this.getSqlMapClientTemplate().queryForList(
				"vote.getVoteListByDate", map);
	}

	/**
	 * 根据resourceId category 查询所有vote纪录
	 * 
	 * @param IdresourceId
	 * @param category
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Vote> getVotesListByVoteCategory(int resourceId, String type) {
		Map map = new HashMap();
		map.put("resourceId", resourceId);
		map.put("type", type);
		return (List<Vote>) this.getSqlMapClientTemplate().queryForList(
				"vote.getVotesListByVoteCategory", map);
	}

	/**
	 * 根据memberId获得所有投过票的文章Id
	 * 
	 * @param memberId
	 * @param start
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> getArticlesIdByMemberId(int memberId, int start,
			int count) {
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("start", start);
		map.put("count", count);
		return (List<Integer>) getSqlMapClientTemplate().queryForList(
				"vote.getArticlesIdByMemberId", map);
	}

	/**
	 * 根据memberId获得所有投过票的文章总数
	 * 
	 * @param memberId
	 * @return
	 */
	public int getArticlesCountByMemberId(int memberId) {
		int count = 0;
		Object obj = getSqlMapClientTemplate().queryForObject(
				"vote.getArticlesCountByMemberId", memberId);
		if (obj != null) {
			count = Integer.parseInt(obj.toString());
		}
		return count;
	}

	public void vote_proc() {
		getSqlMapClientTemplate().queryForObject("vote.vote_proc", null);
	}

	public Object getAllCountByArticle(int articleId) {
		return getSqlMapClientTemplate().queryForObject(
				"vote.getAllCountByArticle", articleId);
	}

	public Object getCountByVoteCategory(int articleId, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		map.put("category", category);
		return getSqlMapClientTemplate().queryForObject(
				"vote.getCountByVoteCategory", map);
	}

	@SuppressWarnings("unchecked")
	public List<Vote> getByArticleId(int articleId) {
		return (List<Vote>) this.getSqlMapClientTemplate().queryForList(
				"vote.getByArticleId", articleId);
	}

	public int getSupportVoteCountByArticleId(int id) {
		int i = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"vote.getSupportVoteCountByArticleId", id);
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public int getUnSupportVoteCountByArticleId(int id) {
		int i = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"vote.getUnSupportVoteCountByArticleId", id);
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	@SuppressWarnings("unchecked")
	public List<Vote> getNewVote(int start, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("count", count);
		return (List<Vote>) this.getSqlMapClientTemplate().queryForList(
				"vote.getNewVote", map);
	}

	/*
	 * （非 Javadoc） 获得一个月最热文章的id列表
	 * 
	 * @see com.cc.cw.dao.VoteDAO#getArticleIdList()
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> getArticleIdList() {

		return (List<Integer>) this.getSqlMapClientTemplate().queryForList(
				"vote.getArticleIdListMonth", "");
	}

	public int getVoteCount4Channel(int channelId) {
		Object o = getSqlMapClientTemplate().queryForObject(
				"vote.getVoteCount4Channel", channelId);
		if(o == null ) return 0;
		else return (Integer)o;
	}

	public void vote4Channel(Vote vote) {
		if(isExist(vote.getMemberId(), vote.getResourceId(), vote.getResourceType())){
			getSqlMapClientTemplate().update("vote.updateTheExist", vote);
		} else {
			vote.setVoteCategory("Support");
			vote.setVoteDate(new Date());
			vote.setVoteNumber(1);
			getSqlMapClientTemplate().insert("vote.add", vote);
		}
	}

}
