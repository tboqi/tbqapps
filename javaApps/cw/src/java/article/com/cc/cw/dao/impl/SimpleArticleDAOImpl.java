package com.cc.cw.dao.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.SimpleArticleDAO;
import com.cc.cw.domain.Article;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UserDMLabel;
import com.cc.cw.domain.UserLabel;
import com.cc.cw.web.CwConfiguration;

public class SimpleArticleDAOImpl extends SqlMapClientDaoSupport implements
		SimpleArticleDAO {

	@SuppressWarnings("unused")
	private final Log log = LogFactory.getLog(getClass());

	public int add(SimpleArticle article) {
		// 首先按标题判断是否有已存在的文章，有则返回-1
		int existArticleId = this.sameArticle("Title", article.getTitle());
		if (existArticleId > 0)
			return -1;
		return (Integer) this.getSqlMapClientTemplate().insert("article.add",
				article);
	}

	public int delete(int id) {
		return this.getSqlMapClientTemplate()
				.update("article.deleteUpdate", id);
	}
	public int delete2(int id) {
		return this.getSqlMapClientTemplate()
				.update("article.deleteUpdate2", id);
	}

	public SimpleArticle getById(int id) {
		return (SimpleArticle) this.getSqlMapClientTemplate().queryForObject(
				"article.getById", id);
	}

	public int update(SimpleArticle article) {
		return this.getSqlMapClientTemplate().update("article.update", article);
	}

	/**
	 * 根据传入字段名称和值，查找唯一纪录
	 * 
	 * @param field
	 * @param value
	 * @return
	 */
	public SimpleArticle getObjectByFieldValue(String field, Object value)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("value", value);
		return (SimpleArticle) this.getSqlMapClientTemplate().queryForObject(
				"article.getByFieldValue", map);
	}

	/**
	 * 通过Id更新指定字段的值
	 * 
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public int updateFieldValueById(int id, String field, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("field", field);
		map.put("value", value);
		return this.getSqlMapClientTemplate().update(
				"article.updateFieldValueById", map);
	}

	public int updateEndDate(int id, Date date) {
		return this.updateFieldValueById(id, "EndDate", date);
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
				"article.increaseFieldValueById", map);
	}

	public int updateVoteCount(int id, String voteCategory) {
		String field = "";
		if (voteCategory.equals("Support")) {
			field = "SupportCount";
		} else if (voteCategory.equals("UnSupport")) {
			field = "UnSupportCount";
		} else {
			return 0;
		}

		return this.increaseFieldValueById(id, field, 1);
	}

	/**
	 * 获得票数最多的文章
	 * 
	 * @param num
	 *            数量
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getSupportCountArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		return this.getSqlMapClientTemplate().queryForList(
				"article.getSupportCountArticles", map);
	}

	/**
	 * 获得最热文章
	 * 
	 * @param start
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getHottestArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getHottestArticles", map);
	}

	/**
	 * 获得本月最热文章
	 * 
	 * @param start
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getMonthHottestArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getMonthHottestArticles", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getMonthHottestArticles(int start, int count,
			String idlist) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("idlist", idlist);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getMonthHottestArticles", map);
	}

	/**
	 * 本周最热文章
	 * 
	 * @param page
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getWeekHottestArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getWeekHottestArticles", map);
	}

	/**
	 * 获得最新文章
	 * 
	 * @param page
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getNewArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getNewArticles", map);
	}

	/**
	 * 获得最新文章总数
	 * 
	 * @return
	 */
	public int getNewArticlesCount() {
		String line = "";

		String txtFilePath = CwConfiguration.create().get("not.tuijian.log");
		File txtfile = new File(txtFilePath);
		try {
			Reader r = new InputStreamReader(new FileInputStream(txtfile),
					"UTF-8");
			BufferedReader fr = new BufferedReader(r);
			line = fr.readLine();
			r.close();
			if (StringUtils.isEmpty(line)) {
				line = "";
			} else {
				line = line.substring(0, line.length() - 1);
			}
		} catch (FileNotFoundException e) {
			log.error(e.getMessage());
		} catch (IOException e) {
			log.error("-------------读取文件" + txtFilePath + "时发生错误");
		}
		Object obj = null;
		if (line == "") {
			obj = this.getSqlMapClientTemplate().queryForObject(
					"article.getNewArticlesCount", null);
		} else {
			obj = this.getSqlMapClientTemplate().queryForObject(
					"article.getNewArticlesCount2", line);
		}
		return obj == null ? 0 : (Integer) obj;
	}

	public int getHottestArticlesCount() {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getHottestArticlesCount", null);
		return obj == null ? 0 : (Integer) obj;
	}

	public int getMonthHottestArticlesCount() {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getMonthHottestArticlesCount", null);
		return obj == null ? 0 : (Integer) obj;
	}

	@SuppressWarnings("unchecked")
	public int getMonthHottestArticlesCount(String iplist) {
		Map map = new HashMap();
		map.put("iplist", iplist);
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getMonthHottestArticlesCountByIplist", map);
		return obj == null ? 0 : (Integer) obj;
	}

	public int getSupportCountArticlesCount() {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getSupportCountArticlesCount", null);
		return obj == null ? 0 : (Integer) obj;
	}

	public int getWeekHottestArticlesCount() {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getWeekHottestArticlesCount", null);
		return obj == null ? 0 : (Integer) obj;
	}

	/**
	 * 更新文章的状态（开局，未开局）
	 * 
	 * @param Id
	 * @param Status
	 * @return
	 */
	public int updateState(int id, int Status) {
		return this.updateFieldValueById(id, "State", Status);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getAll() {
		return this.getSqlMapClientTemplate().queryForList(
				"article.getAllArticles", null);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getNewFromId(int id) {
		return this.getSqlMapClientTemplate().queryForList(
				"article.getNewArticlesFromId", id);
	}

	public int haveNewResource(int id) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"article.haveNewArticle", id);
	}

	/**
	 * 找出所有二次投票、并已经到结束日期的文章
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getAllVoteFinishSimpleArticle() {
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getAllVoteFinishSimpleArticle", null);
	}

	/**
	 * 找出所有一次投票、并已经到结束日期的文章
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getAllFirstVoteFinishSimpleArticle() {
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getAllFirstVoteFinishSimpleArticle",
						null);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getByMemberId(int id) {
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getArticlesByMemberId", id);
	}

	/**
	 * 根据频道id获取文章
	 * 
	 * @param id
	 * @param page
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getArticlesByChannelId(int id, int start,
			int count) {
		Map map = new HashMap();
		map.put("channelId", id);
		map.put("start", start);
		map.put("count", count);
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getArticlesByChannelId", map);

	}

	/** 根据频道id获取文章总数 */
	public int getArticlesCountByChannelId(int id) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getArticlesCountByChannelId", id);
		int i = 0;
		if (obj != null)
			i = Integer.parseInt(obj.toString());
		return i;
	}

	public int getArticlesTotalVoteById(int id) {
		return (Integer) (this.getSqlMapClientTemplate().queryForObject(
				"article.getArticlesTotalVoteById", id) == null ? 0 : this
				.getSqlMapClientTemplate().queryForObject(
						"article.getArticlesTotalVoteById", id));
	}

	@SuppressWarnings("unchecked")
	public List getArticlesByMemberId(int id, int start, int count) {
		Map map = new HashMap();
		map.put("memberId", id);
		map.put("start", start);
		map.put("count", count);
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getArticlesByMemberIdEx", map);

	}

	public int getArticlesCountByMemberId(int id) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getArticlesCountByMemberId", id);
		int i = 0;
		if (obj != null)
			i = Integer.parseInt(obj.toString());
		return i;
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getReview(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getReview", map);
	}

	public int getReviewCount() {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getReviewCount", null);
		int count = 0;
		if (obj != null)
			count = Integer.parseInt(obj.toString());
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Article> getLabelArticles(List labelList, int start, int count,
			int memberId) {
		if (start <= 0) {
			start = 1;
		}
		start = (start - 1) * count;
		Map<String, Object> map = new HashMap<String, Object>();
		if (labelList != null && labelList.size() > 0) {
			String or = "(Content like '%"
					+ ((UserLabel) labelList.get(0)).getLabel() + "%')";
			for (int i = 1; i < labelList.size(); i++) {
				or += " or (Content like '%"
						+ ((UserLabel) labelList.get(i)).getLabel() + "%')";
			}
			map.put("or", or);
			map.put("count", count);
			map.put("start", start);
			map.put("memberId", memberId);
			List<Article> list = this.getSqlMapClientTemplate().queryForList(
					"article.getLabelArticles", map);

			return list;
		} else {
			return null;
		}
	}

	public int sameArticle(String column, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("value", value);
		int result = (Integer) (this.getSqlMapClientTemplate().queryForObject(
				"article.sameArticle", map) == null ? 0 : this
				.getSqlMapClientTemplate().queryForObject(
						"article.sameArticle", map));
		return result;
	}

	@SuppressWarnings("unchecked")
	public List getDMLabelArticles(List labelList, int start, int count) {
		if (start <= 0) {
			start = 1;
		}
		start = (start - 1) * count;
		Map<String, Object> map = new HashMap<String, Object>();
		String or = "(Content like '%"
				+ ((UserDMLabel) labelList.get(0)).getLabel() + "%')";
		for (int i = 1; i < labelList.size(); i++) {
			or += " or (Content like '%"
					+ ((UserDMLabel) labelList.get(i)).getLabel() + "%')";
		}
		map.put("or", or);
		map.put("count", count);
		map.put("start", start);
		List<Article> list = this.getSqlMapClientTemplate().queryForList(
				"article.getLabelArticles", map);

		return list;
	}

	public int endArticle(int articleId, int voteResultType, String firstResult) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		map.put("voteResultType", voteResultType);
		map.put("firstResult", firstResult);
		return this.getSqlMapClientTemplate().update("article.endArticle", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getByEndDate(int channelId, String endDate,
			int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("channelId", channelId);
		map.put("endDate", endDate);
		map.put("count", count);
		map.put("start", start);

		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getByEndDate", map);
	}

	public Object getByEndDateCount(int channelId, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("channelId", channelId);
		map.put("endDate", endDate);
		return this.getSqlMapClientTemplate().queryForObject(
				"article.getByEndDateCount", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getVoteArticleByChannelId(int channelId,
			int page, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("channelId", channelId);
		map.put("start", page);
		map.put("count", count);
		return (List<SimpleArticle>) this.getSqlMapClientTemplate()
				.queryForList("article.getVoteArticleByChannelId", map);
	}

	public Object getVoteArticleCountByChannelId(int channelId) {
		return this.getSqlMapClientTemplate().queryForObject(
				"article.getVoteArticleCountByChannelId", channelId);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getHottestArticles(int start, int count,
			String notIn) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		map.put("notIn", notIn);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getHottestArticlesNotIn", map);
	}

	@SuppressWarnings("unchecked")
	public Object getTodaysArticleCountByState(int channelId, String endDate,
			int state) {
		Map map = new HashMap();
		map.put("channelId", channelId);
		map.put("endDate", endDate);
		map.put("state", state);
		return this.getSqlMapClientTemplate().queryForObject(
				"article.getTodaysArticleCountByState", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getSupportArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getSupportArticles", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getUnsupportArticles(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getUnsupportArticles", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getTodaysArticleByState(int channelId,
			String endDate, int state, int start, int count) {
		Map map = new HashMap();
		map.put("channelId", channelId);
		map.put("endDate", endDate);
		map.put("state", state);
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getTodaysArticleByState", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getArticleByState(int state, int start, int count) {
		Map map = new HashMap();
		map.put("state", state);
		map.put("start", start);
		map.put("count", count);
		return this.getSqlMapClientTemplate().queryForList(
				"article.getArticleByState", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getAllMyCollectedArticles(int memberId,
			int start, int count) {
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getAllMyCollectedArticles", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getAllMyVoteArticles(int memberId, int start,
			int count) {
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getAllMyVoteArticles", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getLabelArticles(List<String> labelList,
			int start, int count) {
		if (start <= 0) {
			start = 1;
		}
		start = (start - 1) * count;
		Map<String, Object> map = new HashMap<String, Object>();
		if (labelList != null && labelList.size() > 0) {
			String or = "(Content like '%" + labelList.get(0) + "%')";
			for (int i = 1; i < labelList.size(); i++) {
				or += " or (Content like '%" + labelList.get(i) + "%')";
			}
			map.put("or", or);
			map.put("count", count);
			map.put("start", start);
			map.put("memberId", 0);
			List<SimpleArticle> list = this.getSqlMapClientTemplate()
					.queryForList("article.getLabelArticles", map);

			return list;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getYestodayArticle(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		return this.getSqlMapClientTemplate().queryForList(
				"article.getYestodayArticle", map);
	}

	public int getSupportArticlesCount() {
		int i = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getSupportArticlesCount", null);
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public int getUnsupportArticleCount() {
		int i = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getUnsupportArticleCount", null);
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public int getAllMyCollectedArticlesCount(int memberId) {
		int i = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getAllMyCollectedArticlesCount", memberId);
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public int getAllMyVoteArticlesCount(int memberId) {
		int i = 0;
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getAllMyVoteArticlesCount", memberId);
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	@SuppressWarnings("unchecked")
	public int beginSecondVote(int artId, int memId, Date endDate) {
		Map map = new HashMap();
		map.put("id", artId);
		map.put("secVoteMemId", memId);
		map.put("endDate", endDate);

		return this.getSqlMapClientTemplate().update("article.beginSecondVote",
				map);
	}

	@SuppressWarnings("unchecked")
	public int endSecondVote(int articleId, int voteResultType) {
		Map map = new HashMap();
		map.put("id", articleId);
		map.put("voteResultType", voteResultType);

		return this.getSqlMapClientTemplate().update("article.endSecondVote",
				map);
	}

	@SuppressWarnings("unchecked")
	public int deleteCollectionArticle(int articleId, int channelId) {
		Map map = new HashMap();
		map.put("articleId", articleId);
		map.put("channelId", channelId);
		return this.getSqlMapClientTemplate().delete(
				"article.deleteCollectionArticle", map);
	}

	@SuppressWarnings("unchecked")
	public int getCollectArticleChannelId(int articleId, int memberId) {
		Map map = new HashMap();
		map.put("articleId", articleId);
		map.put("memberId", memberId);
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.getCollectArticleChannelId", map);
		int i = 0;
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> lookforShouldEndArticles(int interval) {
		return this.getSqlMapClientTemplate().queryForList(
				"article.lookforShouldEndArticles", interval);
	}

	public boolean reactiveArticle(int id) {
		return this.getSqlMapClientTemplate().update("article.reactiveArticle",
				id) > 0;
	}

	public int updateVoteResultType(int articleId, int voteResultType) {
		return updateFieldValueById(articleId, "VoteResultType", voteResultType);

	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> search(String key, int start, int count) {
		Map map = new HashMap();
		map.put("key", key);
		map.put("start", start);
		map.put("count", count);
		return this.getSqlMapClientTemplate().queryForList(
				"article.searchArticle", map);
	}

	public int searchCount(String key) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"article.searchArticleCount", key);
		int i = 0;
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public void autoInitiateVote(int voteCycle) {
		this.getSqlMapClientTemplate().update("article.autoInitiateVote",
				voteCycle);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getNewArticlesNoTuijian(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);
		return this.getSqlMapClientTemplate().queryForList(
				"article.getNewArticles", map);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getNewArticlesIndex(int start, int count) {
		Map map = new HashMap();
		map.put("start", start);
		map.put("count", count);

		String line = "";

		String txtFilePath = CwConfiguration.create().get("not.tuijian.log");
		File txtfile = new File(txtFilePath);
		try {
			Reader r = new InputStreamReader(new FileInputStream(txtfile),
					"UTF-8");
			BufferedReader fr = new BufferedReader(r);
			line = fr.readLine();
			r.close();
			if (StringUtils.isEmpty(line)) {
				line = "";
			} else {
				line = line.substring(0, line.length() - 1);
			}
		} catch (FileNotFoundException e) {
			log.error("-------------文件" + txtFilePath + "不存在");
		} catch (IOException e) {
			log.error("-------------读取文件" + txtFilePath + "时发生错误");
		}
		if (line == "") {
			return this.getSqlMapClientTemplate().queryForList(
					"article.getNewArticles", map);
		} else {
			map.put("idlist", line);
			return this.getSqlMapClientTemplate().queryForList(
					"article.getNewArticles2", map);
		}
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getArticlesByWhere(String where, String order,
			int start, int count) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("where", where);
		map.put("order", order);
		map.put("start", new Integer(start));
		map.put("num", new Integer(count));
		return getSqlMapClientTemplate().queryForList(
				"article.getArticlesByWhere", map);
	}

	public int getAritlcesCountByWhere(String where) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"article.getAritlcesCountByWhere", where);
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> getAritcleByTitle(String key) {		
		return getSqlMapClientTemplate().queryForList("article.getAritcleByTitle", key);
	}
}
