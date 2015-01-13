package com.cc.cw.service;

import java.util.List;

import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.domain.SimpleArticle;

public interface RemarkArticleService extends ArticleService<RemarkArticle>{

	/**
	 * 根据文章id获得所有回复
	 * @param articleId
	 * @param page
	 * @param count
	 * @return
	 */
	public List<RemarkArticle> getRemarksByArticleId(int articleId,int page,int count);
	
	public int getRemarksCountByArticleId(int articleId);
	/**
	 * 根据用户id获得所有回复
	 * @param memberId
	 * @param page
	 * @param count
	 * @return List<RemarkArticle>
	 */
	public List<RemarkArticle> getRemarksByMemberIdEx(int memberId,int page , int count);

	public List<SimpleArticle> getRemarkIdsByMemberId(int memberId,int page , int count);
	
	/**
	 * 根据用户ID得到评论数量
	 * @param memberId
	 * @return
	 */
	public int getRemarksCountByMemberId(int memberId);
	
	/**
	 * 更新回复的级别
	 * @param remarkId
	 * @param level
	 * @return
	 */
	public boolean updateRemarkLevel(int remarkId,int level);
	
	/**
	 * 根据文章ID查询所有线索
	 * @param articleId
	 * @param page
	 * @param count
	 * @return List<RemarkArticle>
	 */
	public List<RemarkArticle> getClewsByArticleId(int articleId,int page,int count);

	public List<RemarkArticle> findBySourceArticle(String key, int type, int start, int rowPerPage);

	public int countBySourceArticle(String key, int type);

	public List<RemarkArticle> findByClew(String key, int type, int start, int rowPerPage);

	public int countByClew(String key, int type);

	public List<RemarkArticle> find(int type, int start, int rowPerPage);

	public int count(int type);
	
	public boolean delete(int id);
	public boolean delete2(int id);

	public List<RemarkArticle> findLikeContent(String key, int type, int start, int rowPerPage);

	public int countLikeContent(String key, int type);

	public List<RemarkArticle> findLikeAuthor(String key, int type, int start, int rowPerPage);

	public int countLikeAuthor(String key, int type);
}
