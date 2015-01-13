package com.cc.cw.service;

import java.util.Date;
import java.util.List;

import com.cc.cw.domain.SimpleArticle;

public interface SimpleArticleService extends ArticleService<SimpleArticle> {
	
	/**
	 * 根据id更新票数
	 * @param id
	 * @param voteCategory
	 * @return
	 */
	public boolean updateVoteCount(int id,String voteCategory);
	
	public boolean isEndDate(int id);
	
	public boolean updateEndDate(int id ,Date date);

	/**
	 * 获得票数最多的文章
	 * @param num　数量
	 * @return
	 */
	public List<SimpleArticle> getSupportCountArticles(int page, int count);
	/**获得票数最多的文章总数*/
	public int getSupportCountArticlesCount();
	
	/**
	 * 获得最热文章
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SimpleArticle> getHottestArticles(int page, int count);
	
	/**
	 * 获得最热文章
	 * @param start
	 * @param end
	 * @param notIn 排出重复id
	 * @return
	 */
	public List<SimpleArticle> getHottestArticles(int page, int count , String notIn);
	
	
	/** 获得最热文章总数 */
	public int getHottestArticlesCount();
	
	/**
	 * 获得本月最热文章
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SimpleArticle> getMonthHottestArticles(int page, int count);
	/** 获得本月最热文章总数 */
	public int getMonthHottestArticlesCount();
	
	/**
	 * 本周最热文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getWeekHottestArticles(int page, int count);
	/** 本周最热文章总数 */
	public int getWeekHottestArticlesCount();
	/**
	 * 获得最新文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getNewArticles(int page , int count);
	/** 获得最新文章总数 */
	public int getNewArticlesCount();
	
	/**
	 * 更新文章的状态（开局，未开局）
	 * @param Id
	 * @param Status
	 * @return
	 */
	public boolean updateState(int Id,int Status);
	
	/**
	 * 根据频道id获取文章
	 * @param id
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getArticlesByChannelId(int id,int page,int count);
	/** 根据频道id获取文章总数 */
	public int getArticlesCountByChannelId(int id);

	
	/**
	 * 根据频道id获取文章
	 * @param id
	 * @param page
	 * @param count
	 * @return
	 */
	public List getArticlesByMemberId(int id,int page,int count);
	/** 根据频道id获取文章总数 */
	public int getArticlesCountByMemberId(int id);
	
	/**
	 * 根据文章id获取投票总数
	 * @param id
	 * @return int
	 */
	public int getArticlesTotalVoteById(int id);
	
	/**
	 * 精彩回顾
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getReview(int page,int count);
	public int getReviewCount();
	
	/**
	 * 查询指定结束日期的文章
	 * @param endDate
	 * @return List<SimpleArticle>
	 */
	public List<SimpleArticle> getByEndDate(int channelId,String endDate,int page, int count);
	
	/**
	 * 查询指定结束日期的文章总数
	 * @param endDate
	 * @return int
	 */
	public int getByEndDateCount(int channelId,String endDate);
	
	/**
	 * 结束文章投票
	 * @param voteResultType
	 * @return boolean
	 */
	public boolean endArticle(int articleId, int voteResultType, String firstResult);
	
	/**
	 * 根据频道iD查询所有正式属于该频道的文章
	 * @param channelId
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getVoteArticleByChannelId(int channelId,int page,int count);
	
	/**
	 * 根据频道iD查询所有正式属于该频道的文章总数
	 * @param channelId
	 * @return
	 */
	public int getVoteArticleCountByChannelId(int channelId);
	
	/**
	 * 根据状态查询频道某天的文章数量
	 * @param channelId
	 * @param endDate
	 * @param state
	 * @return int
	 */
	public int getTodaysArticleCountByState(int channelId,String endDate,int state);
	
	/**
	 * 根据状态查询频道某天的文章
	 * @param channelId
	 * @param endDate
	 * @param state
	 * @return List<SimpleArticle>
	 */
	public List<SimpleArticle> getTodaysArticleByState(int channelId,String endDate,int state,int page,int count);
	
	/**
	 * 用于获取未到投票截至日期所有支持票多的文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getSupportArticles(int page,int count);
	public int getSupportArticlesCount();
	
	/**
	 * 用于获取未到投票截至日期所有反对票多的文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getUnsupportArticles(int page,int count);
	public int getUnsupportArticleCount();
	
	/**
	 * 获得二次投票的文章
	 * @param page
	 * @param count
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getSecondVoteArticles(int page,int count);
	
	/**
	 * 得到我收藏的所有文章
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getAllMyCollectedArticles(int memberId,int page,int count);
	public int getAllMyCollectedArticlesCount(int memberId);
	/**
	 * 得到我发起投票的所有文章
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getAllMyVoteArticles(int memberId,int page,int count);
	public int getAllMyVoteArticlesCount(int memberId);
	/**
	 * 根据此文章所对应的标签，找出相关文章
	 * @param labelList
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getArticleByLabels(List<String> labelList,int page,int count);
	
	/**
	 * 获得昨日文章列表
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getYestodayArticle(int page,int count);
	/**
	 * 对此文章进行二次投票
	 * @param artId - 文章id
	 * @param memId - 申请二次投票用户的id
	 * @param endDate - 最终结束日期
	 * @return boolean
	 */
	public boolean beginSecondVote(int artId,int memId,Date endDate);
	/**
	 * 结束二次投票
	 * @param articleId
	 * @param voteResultType
	 * @return boolean
	 */
	public boolean endSecondVote(int articleId, int voteResultType);
	
	/**
	 * 根据id删除link表的收藏文章数据
	 * @param articleId
	 * @param channelId
	 * @return
	 */
	public boolean deleteCollectionArticle(int articleId,int channelId);
	
	/**
	 * 返回用户收录此文章的频道Id
	 * @param articleId
	 * @param memberId
	 * @return
	 */
	public int getCollectArticleChannelId(int articleId,int memberId);
	/**
	 * 寻找今天之前某天未结束投票的文章
	 * @param interval -  间隔天数
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> lookforShouldEndArticles(int interval);
	/**
	 * 重新激活文章，使其可以投票
	 * @param articleId
	 * @return boolean
	 */
	public boolean reactiveArticle(int articleId);

	/**
	 * 自动发起投票
	 * @param voteCycle
	 */
	public void autoInitiateVote(int voteCycle);
	
	/**
	 * 获得所有一次投票结束的文章列表
	 * @return
	 */
	public List<SimpleArticle> getAllFirstVoteFinishSimpleArticle();

	public List<SimpleArticle> getAllVoteFinishSimpleArticle();

	public List<SimpleArticle> getNewArticlesNoTuijian(int page, int num);

	public List<SimpleArticle> getNewArticlesIndex(int start, int i);
	public List<SimpleArticle> getArticlesByWhere(String where, String order, int start, int count);
	public int getAritlcesCountByWhere(String where);

	public boolean delete2(int aid);
}
