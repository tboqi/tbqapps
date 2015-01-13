package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Vote;

public interface VoteDAO {

	public int add(Vote vote);
	
	public int update(Vote vote);
	
	public Vote get(int id);
	
	public int remove(int id);
	
	/**
	 * 根据传入参查询是否有符合条件的纪录
	 * @param memberId
	 * @param resourceId
	 * @param type
	 * @return
	 */
	public boolean isExist(int memberId,int resourceId,String type);
	
	public Vote isExistForArticle(String VoteMember,int resourceId,String type);
	
	//public Vote getByResourceIdMemberId(int resourceId,int memberId);
	
	/** 
	 * 根据传入参数返回结果，为freechart提供数据
	 */
	public List<Vote> getVoteListByDate(int resourceId,String type,String beginDate,String endDate);
	
	/**
	 * 根据resourceId category 查询所有vote纪录
	 * @param IdresourceId
	 * @param category
	 * @return
	 */
	public List<Vote> getVotesListByVoteCategory(int resourceId,String type);
	
	/**
	 * 根据memberId获得所有投过票的文章Id
	 * @param memberId
	 * @param start
	 * @param count
	 * @return
	 */
	public List<Integer> getArticlesIdByMemberId(int memberId,int start , int count);
	/**
	 * 根据memberId获得所有投过票的文章总数
	 * @param memberId
	 * @return
	 */
	public int getArticlesCountByMemberId(int memberId);
	
	/**
	 * 调用存储过程方式
	 */
	public void vote_proc();
	
	/**
	 * 根据文章id获得所有投票记录
	 * @param articleId
	 * @return Object(Integer)
	 */
	public Object getAllCountByArticle(int articleId);
	
	/**
	 * 根据文章id和投票种类查询投票记录
	 * @param articleId
	 * @param category
	 * @return Object(Integer)
	 */
	public Object getCountByVoteCategory(int articleId, String category);
	
	/**
	 * 获得某文章的投票记录
	 * @param articleId
	 * @return List（Vote）
	 */
	public List<Vote> getByArticleId(int articleId);

	/**
	 * 根据文章Id获得反对票总数
	 * @param id
	 * @return
	 */
	public int getUnSupportVoteCountByArticleId(int id);

	/**
	 * 根据文章Id获得支持票总数
	 * @param id
	 * @return
	 */
	public int getSupportVoteCountByArticleId(int id);
	
	/**
	 * 查询最新的投票记录
	 * @param page
	 * @param count
	 * @return List(vote)
	 */
	public List<Vote> getNewVote(int start , int count);
	public List<Integer> getArticleIdList();

	public int getVoteCount4Channel(int channelId);

	public void vote4Channel(Vote vote);
}
