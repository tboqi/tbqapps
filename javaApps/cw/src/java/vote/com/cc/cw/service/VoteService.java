package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.Vote;

public interface VoteService {
	
	
	public int update(Vote vote);
	
	public Vote get(int id);
	
	public boolean delete(int id);
	
	/**
	 * 对资源进行投票，一个用户针对一种资源只可以投一次,并对资源的总票数进行update
	 * @param vote
	 * @return int: 1--投票成功<br>
	 *              2--票数不够<br>
	 *              3--投过票了<br>
	 *              0--未知错误；
	 */
	public int vote(Vote vote);
	
	/**
	 * 根据给定日期，返回所有满足条件的vote
	 * 
	 * @param rsourceId
	 * @param Vote.ResourceType
	 * @param beginDate
	 * @param endDate
	 * @return List<Vote>
	 */
	public List<Vote> getVoteListByDate(int resourceId,String type,String beginDate,String endDate);
	
	/**
	 * 处理所有已经评论过的文章
	 * １．找到所有状态为未开局(status > 0)　并且已经到开局时间的文章
	 * ２．更新这些文章的status = 1
	 * ３．将查出的每一个文章的id，和结果(支持多还是反对多，)找到应了的memberId,和点数
	 * ４．将member的票数更新
	 * @return
	 */
	public void voteFinishProcess();
	
	/**
	 * 处理所有已经评论过的文章
	 * １．找到所有状态为未开局(status > 0)　并且已经到开局时间的文章
	 * ２．更新这些文章的status = 1
	 * ３．将查出的每一个文章的id，和结果(支持多还是反对多，)找到应了的memberId,和点数
	 * ４．将member的票数更新
	 * @return
	 */
	public void firstVoteFinishProcess();
	
	/**
	 * 根据memberId获得所有投过票的文章
	 * @param memberId
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getArticlesByMemberId(int memberId,int page , int count);
	/**
	 * 根据memberId获得所有投过票的文章总数
	 * @param memberId
	 * @return
	 */
	public int getArticlesCountByMemberId(int memberId);
	

	
	public boolean isAlreadyVoted(int memberId, int resourceId, String resourceType);
	
	/**
	 * 根据文章id获得所有投票记录总数
	 * @param articleId
	 * @return List（Vote）
	 */
	public int getAllCountByArticle(int articleId);
	
	/**
	 * 根据文章id获得所有支持票总数
	 * @param articleId
	 * @return List（Vote）
	 */
	public int getArticleSupportVoteCount(int articleId);
	
	/**
	 * 根据文章id获得所有反对票总数
	 * @param articleId
	 * @return List（Vote）
	 */
	public int getArticleUnSupportVoteCount(int articleId);

	/**
	 * 获得某文章的投票记录
	 * @param articleId
	 * @return List（Vote）
	 */
	public List<Vote> getByArticleId(int articleId);
	
	public List<Vote> getVotesListByVoteCategory(int resourceId,String type);
	
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
	 *将超过投票截止日期三天而为被发起者结束的文章流局
	 *
	 */
	public void handleInterminateVoteProcess();
	
	/**
	 * 查询最新的投票记录
	 * @param page
	 * @param count
	 * @return List(vote)
	 */
	public List<Vote> getNewVote(int page , int count);
	
	public int voteArticle(Vote vote);

	public int getVoteCount4Channel(int channelId);

	public void vote4Channel(Vote vote);
}
