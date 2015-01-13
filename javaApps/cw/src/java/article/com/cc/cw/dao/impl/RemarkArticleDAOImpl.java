package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.RemarkArticleDAO;
import com.cc.cw.domain.RemarkArticle;

public class RemarkArticleDAOImpl extends SqlMapClientDaoSupport implements
		RemarkArticleDAO {
	@SuppressWarnings("unchecked")
	public List<RemarkArticle> queryByType(int articleId, int type, int start,
			int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("articleId", articleId);
		map.put("type", type);
		map.put("start", start);
		map.put("count", count);
		return this.getSqlMapClientTemplate().queryForList(
				"remark.queryByType", map);
	}

	public int add(RemarkArticle article) {
		return (Integer) this.getSqlMapClientTemplate().insert("remark.add",
				article);
	}

	public int delete(int id) {
		return this.getSqlMapClientTemplate()
		.update("remark.deleteUpdate", id);
	}

	public RemarkArticle getById(int id) {
		return (RemarkArticle) this.getSqlMapClientTemplate().queryForObject(
				"remark.getById", id);
	}

	public int update(RemarkArticle article) {
		return this.getSqlMapClientTemplate().update("remark.update", article);
	}

	/**
	 * 根据传入字段名称和值，查找唯一纪录
	 * 
	 * @param field
	 * @param value
	 * @return
	 */
	public RemarkArticle getObjectByFieldValue(String field, Object value)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("value", value);
		return (RemarkArticle) this.getSqlMapClientTemplate().queryForObject(
				"remark.getByFieldValue", map);
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
				"remark.updateFieldValueById", map);
	}

	public int getRemarksCountByArticleId(int articleId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"remark.getRemarksCountByArticleId", articleId);
		return obj == null ? 0 : (Integer) obj;
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> getAll() {
		return (List<RemarkArticle>) this.getSqlMapClientTemplate()
				.queryForList("remark.getAllRemarks", null);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> getNewFromId(int id) {
		return (List<RemarkArticle>) this.getSqlMapClientTemplate()
				.queryForList("remark.getNewRemarksFromId", id);
	}

	public int haveNewResource(int id) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"remark.haveNewRemark", id);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> getByMemberId(int id) {
		return (List<RemarkArticle>) this.getSqlMapClientTemplate()
				.queryForList("remark.getRemarksByMemberId", id);
	}

	@SuppressWarnings("unchecked")
	public List<Integer> getRemarkIdsByMemberId(int memberId, int start,
			int count) {
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("start", start);
		map.put("count", count);
		return (List<Integer>) this.getSqlMapClientTemplate().queryForList(
				"remark.getRemarkIdsByMemberId", map);
	}

	public int getRemarksCountByMemberId(int memberId) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"remark.getRemarksCountByMemberId", memberId);
	}

	public int updateRemarkLevel(int remarkId, int level) {
		return this.updateFieldValueById(remarkId, "Level", level);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> search(String key, int start, int count) {
		Map map = new HashMap();
		map.put("key", key);
		map.put("start", start);
		map.put("count", count);

		return (List<RemarkArticle>) this.getSqlMapClientTemplate()
				.queryForList("remark.searchRemark", map);
	}

	public int searchCount(String key) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"remark.searchRemarkCount", key);
		int i = 0;
		if (obj != null) {
			i = Integer.parseInt(obj.toString());
		}
		return i;
	}

	public int delete2(int id) {
		return this.getSqlMapClientTemplate()
		.update("remark.deleteUpdate2", id);
	}

	public int count(int type) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"remark.count", new Integer(type));
	}

	public int countByClew(String key, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", new Integer(type));
		map.put("key", key);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"remark.countByClew", map);
	}

	public int countInSourceArticleIds(String ids, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", new Integer(type));
		map.put("ids", ids);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"remark.countInSourceArticleIds", map);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> find(int type, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", new Integer(type));
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		return (List<RemarkArticle>) getSqlMapClientTemplate().queryForList(
				"remark.find", map);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> findByClew(String key, int type, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		map.put("type", new Integer(type));
		map.put("key", key);
		return (List<RemarkArticle>) getSqlMapClientTemplate().queryForList(
				"remark.findByClew", map);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> findInSourceArticleIds(String ids, int type, int start,
			int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		map.put("type", new Integer(type));
		map.put("ids", ids);
		return (List<RemarkArticle>) getSqlMapClientTemplate().queryForList(
				"remark.findInSourceArticleIds", map);
	}

	public int countInAuthorIds(String authorIds, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", new Integer(type));
		map.put("authorIds", authorIds);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"remark.countInAuthorIds", map);
	}

	public int countLikeContent(String key, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", new Integer(type));
		map.put("key", key);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"remark.countLikeContent", map);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> findInAuthorIds(String authorIds, int type, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		map.put("type", new Integer(type));
		map.put("authorIds", authorIds);
		return (List<RemarkArticle>) getSqlMapClientTemplate().queryForList(
				"remark.findInAuthorIds", map);
	}

	@SuppressWarnings("unchecked")
	public List<RemarkArticle> findLikeContent(String key, int type, int start, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", new Integer(start));
		map.put("count", new Integer(count));
		map.put("type", new Integer(type));
		map.put("key", key);
		return (List<RemarkArticle>) getSqlMapClientTemplate().queryForList(
				"remark.findLikeContent", map);
	}

}
