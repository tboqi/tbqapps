package com.cc.cw.dao;

import java.util.Date;
import java.util.List;

import com.cc.cw.domain.Article;
import com.cc.cw.domain.SimpleArticle;

public interface SimpleArticleDAO extends ArticleDAO<SimpleArticle>{

	public int updateEndDate(int id , Date date);
	
	/**
	 * 根据id更新票数
	 * @param id
	 * @param voteCategory
	 * @return
	 */
	public int updateVoteCount(int id,String voteCategory);
	
	/**
	 * 获得票数最多的文章
	 * @param num　数量
	 * @return
	 */
	public List<SimpleArticle> getSupportCountArticles(int start,int count);
	/**获得票数最多的文章总数*/
	public int getSupportCountArticlesCount();
	/**
	 * 获得最热文章
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SimpleArticle> getHottestArticles(int start,int count);
	/** 获得最热文章总数 */
	public int getHottestArticlesCount();
	/**
	 * 获得本月最热文章
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SimpleArticle> getMonthHottestArticles(int start, int count);
	public List<SimpleArticle> getMonthHottestArticles(int start, int count, String idlist);
	/** 获得本月最热文章总数 */
	public int getMonthHottestArticlesCount();
	public int getMonthHottestArticlesCount(String idlist);
	/**
	 * 本周最热文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getWeekHottestArticles(int start, int count);
	/** 本周最热文章总数 */
	public int getWeekHottestArticlesCount();
	/**
	 * 获得最新文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getNewArticles(int start, int count);
	/** 获得最新文章总数 */
	public int getNewArticlesCount();
	
	/**
	 * 更新文章的状态（开局，未开局）
	 * @param Id
	 * @param Status
	 * @return
	 */
	public int updateState(int Id,int Status);
	
	/**
	 * 找出所有二次投票、并已经到结束日期的文章
	 * @return
	 */
	public List<SimpleArticle> getAllVoteFinishSimpleArticle();
	
	/**
	 * 找出所有一次投票、并已经到结束日期的文章
	 * @return
	 */
	public List<SimpleArticle> getAllFirstVoteFinishSimpleArticle();
	
	/**
	 * 根据频道id获取文章
	 * @param id
	 * @param page
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getArticlesByChannelId(int id,int start,int count);
	/** 根据频道id获取文章总数 */
	public int getArticlesCountByChannelId(int id);

	/**
	 * 根据频道id获取文章
	 * @param id
	 * @param page
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getArticlesByMemberId(int id,int page,int count);
	/** 根据频道id获取文章总数 */
	public int getArticlesCountByMemberId(int id);
	
	/**
	 * 根据文章ID得到参与投票的人数
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
	public List<SimpleArticle> getReview(int start,int count);
	public int getReviewCount();
	@SuppressWarnings("unchecked")
	public List<Article> getLabelArticles(List labelList, int start, int count,int memberId) ;
	
	/**
	 * 根据条件查询是否已有相同的文章
	 * @param column
	 * @param value
	 * @return 相同文章的ID
	 */
	public int sameArticle(String column,Object value);

	@SuppressWarnings("unchecked")
	public List getDMLabelArticles(List labelList, int start, int count);

	/**
	 * 查询指定结束日期的文章
	 * @param endDate
	 * @return List<SimpleArticle>
	 */
	public List<SimpleArticle> getByEndDate(int channelId,String endDate, int start, int count);
	
	/**
	 * 查询指定结束日期的文章总数
	 * @param endDate
	 * @return Object(Integer)
	 */
	public Object getByEndDateCount(int channelId,String endDate);
	
	/**
	 * 结束文章投票
	 * @param voteResultType
	 * @return int
	 */
	public int endArticle(int articleId, int voteResultType, String firstResult);
	
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
	public Object getVoteArticleCountByChannelId(int channelId);
	

	/**
	 * 获得最热文章
	 * @param start
	 * @param end
	 * @param notIn 排出重复id
	 * @return
	 */
	public List<SimpleArticle> getHottestArticles(int start, int count,
			String notIn);
			
	/**
	 * 根据状态查询频道某天的文章
	 * @param channelId
	 * @param endDate
	 * @param state
	 * @return Object(int)
	 */
	public Object getTodaysArticleCountByState(int channelId,String endDate,int state);

	/**
	 * 用于获取未到投票截至日期所有支持票多的文章
	 * @param start
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getSupportArticles(int start, int count);

	/**
	 * 用于获取未到投票截至日期所有反对票多的文章
	 * @param start
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getUnsupportArticles(int start, int count);
	/**
	 * 根据状态查询频道某天的文章
	 * @param channelId
	 * @param endDate
	 * @param state
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getTodaysArticleByState(int channelId,String endDate,int state,int start,int count);

	/**
	 * 根据状态查询文章
	 * @param state
	 * @param start
	 * @param count
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getArticleByState(int state,int start,int count);

	/**
	 * 得到我收藏的所有文章
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getAllMyCollectedArticles(int memberId,int start,int count);
	public int getAllMyCollectedArticlesCount(int memberId); 
	/**
	 * 得到我发起投票的所有文章
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List（SimpleArticle）
	 */
	public List<SimpleArticle> getAllMyVoteArticles(int memberId,int start,int count);
	public int getAllMyVoteArticlesCount(int memberId);
	/**
	 * 根据标签获得相关文章
	 * @param labelList
	 * @param start
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getLabelArticles(List<String> labelList, int start, int count);

	/**
	 * 获得昨日文章列表
	 * @param start
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getYestodayArticle(int start, int count);

	public int getSupportArticlesCount();

	public int getUnsupportArticleCount();

	/**
	 * 对此文章进行二次投票
	 * @param artId - 文章id
	 * @param memId - 申请二次投票用户的id
	 * @param endDate - 最终结束日期
	 * @return int
	 */
	public int beginSecondVote(int artId,int memId,Date endDate);
	/**
	 * 结束二次投票
	 * @param articleId
	 * @param voteResultType
	 * @return int
	 */
	public int endSecondVote(int articleId, int voteResultType);

	/**
	 * 根据id删除link表的收藏文章数据
	 * @param id
	 * @return
	 */
	public int deleteCollectionArticle(int articleId,int channelId);

	/**
	 * 返回用户收录此文章的频道Id
	 * @param articleId
	 * @param memberId
	 * @return
	 */
	public int getCollectArticleChannelId(int articleId, int memberId);
	
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
	 * 更新文章投票结果
	 * @param articleId
	 * @param voteResultType
	 */
	public int updateVoteResultType(int articleId, int voteResultType);

	/**
	 * 自动发起投票
	 * @param voteCycle
	 */
	public void autoInitiateVote(int voteCycle);

	public List<SimpleArticle> getNewArticlesNoTuijian(int start, int count);

	public List<SimpleArticle> getNewArticlesIndex(int start, int count);
	
	public List<SimpleArticle> getArticlesByWhere(String where, String order, int start, int count);
	public int getAritlcesCountByWhere(String where);

	public List<SimpleArticle> getAritcleByTitle(String key);
}
