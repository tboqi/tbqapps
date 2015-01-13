package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.RemarkArticle;

public interface RemarkArticleDAO extends ArticleDAO<RemarkArticle>{

	public int getRemarksCountByArticleId(int articleId);

	public List<Integer> getRemarkIdsByMemberId(int memberId,int start,int count);
	
	public int getRemarksCountByMemberId(int memberId);
	
	/**
	 * 更新remark级别
	 * @param remarkId
	 * @param level
	 * @return
	 */
	public int updateRemarkLevel(int remarkId,int level);
	
	/**
	 * 根据类型查询普通评论或线索
	 * @param articleId
	 * @param type ：0：评论 | 1：线索 
	 * @param start
	 * @param count
	 * @return List<RemarkArticle>
	 */
	public List<RemarkArticle> queryByType(int articleId,int type,int start, int count);

	public int count(int type);

	public int countByClew(String key, int type);

	public int countInSourceArticleIds(String ids, int type);

	public List<RemarkArticle> findByClew(String key, int type, int start, int count);

	public List<RemarkArticle> find(int type, int start, int count);

	public List<RemarkArticle> findInSourceArticleIds(String ids, int type, int start, int count);

	public int countInAuthorIds(String authorIds, int type);

	public int countLikeContent(String key, int type);

	public List<RemarkArticle> findInAuthorIds(String authorIds, int type, int start, int count);

	public List<RemarkArticle> findLikeContent(String key, int type, int start, int count);
}
