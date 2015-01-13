package com.cc.cw.service.impl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.cc.cw.dao.ArticleDAO;
import com.cc.cw.dao.SimpleArticleDAO;
import com.cc.cw.dao.VoteDAO;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.SimpleArticleService;

public class SimpleArticleServiceImpl extends ArticleServiceImpl<SimpleArticle> implements SimpleArticleService{

	private SimpleArticleDAO dao ;
	private VoteDAO voteDao;
	
	public SimpleArticleDAO getDao() {
		return dao;
	}

	public void setDao(SimpleArticleDAO dao) {
		this.dao = dao;
	}
	
	public boolean updateVoteCount(int id,String voteCategory){
		return dao.updateVoteCount(id,voteCategory) > 0;
	}
	
	@Override
	public ArticleDAO<SimpleArticle> getResourceDao() {
		return this.dao;
	}
	
	////////////////////////////////////////////////
	public boolean isEndDate(int id){
		SimpleArticle atl = dao.getById(id);
		Date endDate = atl.getEndDate();
		Date now = new Date();
		if(endDate.getTime() - now.getTime() > 0)
			return false;
		return true;
	}
	
	public boolean updateEndDate(int id,Date date){
		return ((SimpleArticleDAO)dao).updateEndDate(id,date) > 0;
	}
	
	/**
	 * 获得票数最多的文章
	 * @param num　数量
	 * @return
	 */
	public List<SimpleArticle> getSupportCountArticles(int page,int count){
		int start = (page - 1) * count;
		return  dao.getSupportCountArticles(start,count); 
	}
	
	/**
	 * 获得最热文章
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SimpleArticle> getHottestArticles(int page,int count){
		int start = (page - 1) * count;
		return dao.getHottestArticles(start, count);
	}
	
	/**
	 * 获得本月最热文章
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SimpleArticle> getMonthHottestArticles(int page, int count){
		int start = (page - 1) * count;
		//获得一个月最热文章id列表
		List<Integer> list = voteDao.getArticleIdList();
		if(list == null || list.size() < 1) return null;
		String idlist = "";
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Integer element = (Integer) iter.next();
			idlist += element + ",";
		}
		idlist = idlist.substring(0, idlist.length() - 2);
		return dao.getMonthHottestArticles(start, count, idlist);
	}
	
	/**
	 * 本周最热文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getWeekHottestArticles(int page, int count){
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		return dao.getWeekHottestArticles(start, count);
	}
	
	/**
	 * 获得最新文章
	 * @param page
	 * @param count
	 * @return
	 */
	public List<SimpleArticle> getNewArticles(int page , int count){
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		return dao.getNewArticles(start, count);
	}
	
	/**
	 * 获得最新文章总数
	 * @return
	 */
	public int getNewArticlesCount(){
		return dao.getNewArticlesCount();
	}

	public int getHottestArticlesCount() {
		return dao.getHottestArticlesCount();
	}

	public int getMonthHottestArticlesCount() {
		return dao.getMonthHottestArticlesCount();
	}

	public int getSupportCountArticlesCount() {
		return dao.getSupportCountArticlesCount();
	}

	public int getWeekHottestArticlesCount() {
		return dao.getWeekHottestArticlesCount();
	}
	
	public List<SimpleArticle> getAll(){
		return dao.getAll();
	}
	
	public List<SimpleArticle> getNewFromId(int id){
		return dao.getNewFromId(id);
	}
	
	/**
	 * 更新文章的状态（开局，未开局）
	 * @param Id
	 * @param Status
	 * @return
	 */
	public boolean updateState(int Id,int Status){
		return dao.updateState(Id, Status) > 0;
	}
	
	public boolean haveNewResource(int id){
		int count = dao.haveNewResource(id);
		return count > 0;
	}

	public List<SimpleArticle> getByMemberId(int id) {
		return dao.getByMemberId(id);
	}
	
	/**
	 * 根据频道id获取文章
	 * @param id
	 * @param page
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getArticlesByChannelId(int id,int page,int count){
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getArticlesByChannelId(id,start, count);
	}
	/** 根据频道id获取文章总数 */
	public int getArticlesCountByChannelId(int id){
		return dao.getArticlesCountByChannelId(id);
	}

	public int getArticlesTotalVoteById(int id) {
		return dao.getArticlesTotalVoteById(id);
	}

	@SuppressWarnings("unchecked")
	public List getArticlesByMemberId(int id, int page, int count) {
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		return dao.getArticlesByMemberId(id,start, count);
	}

	public int getArticlesCountByMemberId(int id) {
		return dao.getArticlesCountByMemberId(id);
	}

	public List<SimpleArticle> getReview(int page, int count) {
		int start = 0;
		if(page != 0){
			start = (page - 1) * count;
		}
		return dao.getReview(start,count);
	}

	public int getReviewCount() {
		return dao.getReviewCount();
	}

	public boolean endArticle(int articleId, int voteResultType, String firstResult) {
		int result = dao.endArticle(articleId, voteResultType, firstResult);
		return result > 0;
	}

	public List<SimpleArticle> getByEndDate(int channelId,String endDate, int page, int count) {
		int start = 0;
		if(page != 0){
			start = (page - 1) * count;
		}
		
		return dao.getByEndDate(channelId,endDate, start, count);
	}

	public int getByEndDateCount(int channelId,String endDate) {
		Object obj = dao.getByEndDateCount(channelId,endDate);
		if(obj != null)	
			return (Integer)obj;
		else
			return 0;
	}

	public List<SimpleArticle> getVoteArticleByChannelId(int channelId, int page, int count) {
		int start = 0;
		if(page != 0){
			start = (page - 1) * count;
		}
		
		return dao.getVoteArticleByChannelId(channelId, start, count);
	}

	public int getVoteArticleCountByChannelId(int channelId) {
		Object obj = dao.getVoteArticleCountByChannelId(channelId);
		if(obj != null)	
			return (Integer)obj;
		else
			return 0;
	}
	
	public List<SimpleArticle> getHottestArticles(int page, int count , String notIn){
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getHottestArticles(start, count,notIn);
	}
	
	public int getTodaysArticleCountByState(int channelId, String endDate, int state) {
		Object obj = dao.getTodaysArticleCountByState(channelId, endDate, state);
		if(obj != null)	
			return (Integer)obj;
		else
			return 0;
	}

	public List<SimpleArticle> getTodaysArticleByState(int channelId, String endDate, int state, int page, int count) {
		int start = 0;
		if(page != 0){
			start = (page - 1) * count;
		}
		
		return dao.getTodaysArticleByState(channelId, endDate, state, start, count);
	}

	public List<SimpleArticle> getSupportArticles(int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		
		return dao.getSupportArticles(start,count);
	}

	public List<SimpleArticle> getUnsupportArticles(int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getUnsupportArticles(start,count);
	}

	public List<SimpleArticle> getSecondVoteArticles(int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		return dao.getArticleByState(2, start, count);
	}

	public List<SimpleArticle> getAllMyCollectedArticles(int memberId, int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		
		return dao.getAllMyCollectedArticles(memberId, start, count);
	}

	public List<SimpleArticle> getAllMyVoteArticles(int memberId, int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		
		return dao.getAllMyVoteArticles(memberId, start, count);
	}
	
	public List<SimpleArticle> getArticleByLabels(List<String> labelList,int page,int count){
		
		int start = 0;
		if(page > 0){
			start = (page-1) * count;
		}
		return dao.getLabelArticles(labelList, start, count);
	}

	public List<SimpleArticle> getYestodayArticle(int page, int count) {
		int start = 0;
		if(page > 0){
			start = (page-1)*count;
		}
		return dao.getYestodayArticle(start,count);
	}

	public int getSupportArticlesCount() {
		return dao.getSupportArticlesCount();
	}

	public int getUnsupportArticleCount() {
		return dao.getUnsupportArticleCount();
	}

	public int getAllMyCollectedArticlesCount(int memberId) {
		return dao.getAllMyCollectedArticlesCount(memberId);
	}

	public int getAllMyVoteArticlesCount(int memberId) {
		return dao.getAllMyVoteArticlesCount(memberId);
	}

	public boolean beginSecondVote(int artId, int memId, Date endDate) {
		return dao.beginSecondVote(artId, memId, endDate) > 0;
	}

	public boolean endSecondVote(int articleId, int voteResultType) {
		return dao.endSecondVote(articleId, voteResultType) > 0;
	}

	public boolean deleteCollectionArticle(int articleId,int channelId) {
		return dao.deleteCollectionArticle( articleId, channelId) > 0;
	}

	public int getCollectArticleChannelId(int articleId, int memberId) {
		return dao.getCollectArticleChannelId(articleId, memberId);
	}

	public List<SimpleArticle> lookforShouldEndArticles(int interval) {
		return dao.lookforShouldEndArticles(interval);
	}

	public boolean reactiveArticle(int articleId) {
		return dao.reactiveArticle(articleId);
	}

	public List<SimpleArticle> search(String key, int page, int count) {
		int start = 0;
		if(page > 0)
			start = (page - 1) * count;
		
		return dao.search(key, start, count);
	}

	public int searchCount(String key) {
		return dao.searchCount(key);
	}

	public void autoInitiateVote(int voteCycle) {
		dao.autoInitiateVote(voteCycle);
	}

	public List<SimpleArticle> getAllFirstVoteFinishSimpleArticle() {
		return dao.getAllFirstVoteFinishSimpleArticle();
	}

	public List<SimpleArticle> getAllVoteFinishSimpleArticle() {
		return dao.getAllVoteFinishSimpleArticle();
	}

	public VoteDAO getVoteDao() {
		return voteDao;
	}

	public void setVoteDao(VoteDAO voteDao) {
		this.voteDao = voteDao;
	}

	public List<SimpleArticle> getNewArticlesNoTuijian(int page, int count) {
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		return dao.getNewArticlesNoTuijian(start, count);
	}

	public List<SimpleArticle> getNewArticlesIndex(int page, int count) {
		int start = 0;
		if(page!=0)
			start = (page - 1) * count;
		return dao.getNewArticlesIndex(start, count);
	}

	public int getAritlcesCountByWhere(String where) {
		return dao.getAritlcesCountByWhere(where);
	}

	public List<SimpleArticle> getArticlesByWhere(String where, String order, int start, int count) {
		return dao.getArticlesByWhere(where, order, start, count);
	}
	
}
