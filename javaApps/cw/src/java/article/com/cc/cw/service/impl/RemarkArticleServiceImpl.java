package com.cc.cw.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.cc.cw.dao.ArticleDAO;
import com.cc.cw.dao.MemberDAO;
import com.cc.cw.dao.RemarkArticleDAO;
import com.cc.cw.dao.SimpleArticleDAO;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.RemarkArticleService;

public class RemarkArticleServiceImpl extends ArticleServiceImpl<RemarkArticle>
		implements RemarkArticleService {

	private RemarkArticleDAO dao;

	private SimpleArticleDAO articleDAO;

	private MemberDAO memberDao;

	public SimpleArticleDAO getArticleDAO() {
		return articleDAO;
	}

	public void setArticleDAO(SimpleArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	public RemarkArticleDAO getDao() {
		return dao;
	}

	public void setDao(RemarkArticleDAO dao) {
		this.dao = dao;
	}

	// public int add(RemarkArticle article){
	// return dao.add(article);
	// }
	//	
	// public RemarkArticle getById(int id){
	// return dao.getById(id);
	// }
	//	
	// public boolean update(RemarkArticle article){
	// return dao.update(article) > 0;
	// }
	// public boolean delete(int id){
	// return dao.delete(id) > 0;
	// }

	@Override
	public ArticleDAO<RemarkArticle> getResourceDao() {
		return this.dao;
	}

	public List<RemarkArticle> getRemarksByArticleId(int articleId, int page,
			int count) {

		int start = 0;
		if (page > 0)
			start = (page - 1) * count;
		return dao.queryByType(articleId, 0, start, count);
	}

	public int getRemarksCountByArticleId(int articleId) {
		return dao.getRemarksCountByArticleId(articleId);
	}

	public List<RemarkArticle> getAll() {
		return dao.getAll();
	}

	public List<RemarkArticle> getNewFromId(int id) {
		return dao.getNewFromId(id);
	}

	public boolean haveNewResource(int id) {
		int count = dao.haveNewResource(id);
		return count > 0;
	}

	public List<RemarkArticle> getByMemberId(int id) {
		return dao.getByMemberId(id);
	}

	public List<SimpleArticle> getRemarkIdsByMemberId(int memberId, int page,
			int count) {
		int start = (page - 1) * count;
		List<Integer> idList = dao.getRemarkIdsByMemberId(memberId, start,
				count);
		List<SimpleArticle> articleList = new ArrayList<SimpleArticle>();
		for (int id : idList) {
			articleList.add(articleDAO.getById(id));
		}
		return articleList;
	}

	public int getRemarksCountByMemberId(int memberId) {
		return dao.getRemarksCountByMemberId(memberId);
	}

	public boolean updateRemarkLevel(int remarkId, int level) {
		return dao.updateRemarkLevel(remarkId, level) > 0;
	}

	public List<RemarkArticle> getRemarksByMemberIdEx(int memberId, int page,
			int count) {
		int start = (page - 1) * count;
		return dao.queryByType(memberId, 0, start, count);
	}

	public List<RemarkArticle> getClewsByArticleId(int articleId, int page,
			int count) {
		int start = 0;
		if (page > 0)
			start = (page - 1) * count;
		return dao.queryByType(articleId, 1, start, count);
	}

	public List<RemarkArticle> search(String key, int page, int count) {
		int start = 0;
		if (page > 0)
			start = (page - 1) * count;

		return dao.search(key, start, count);
	}

	public int searchCount(String key) {
		return dao.searchCount(key);
	}

	public int count(int type) {
		return dao.count(type);
	}

	public int countByClew(String key, int type) {
		return dao.countByClew(key, type);
	}

	public int countBySourceArticle(String key, int type) {
		String ids = getIds(key);
		if (ids == null)
			return 0;
		return dao.countInSourceArticleIds(ids, type);
	}

	private String getIds(String key) {
		List<SimpleArticle> saList = articleDAO.getAritcleByTitle(key);
		if (saList == null || saList.size() <= 0)
			return null;
		String ids = "";
		for (int i = 0; i < saList.size(); i++) {
			ids += "," + saList.get(i).getId();
		}
		return ids.substring(1);
	}

	public List<RemarkArticle> find(int type, int start, int count) {
		return dao.find(type, start, count);
	}

	public List<RemarkArticle> findByClew(String key, int type, int start,
			int count) {
		return dao.findByClew(key, type, start, count);
	}

	public List<RemarkArticle> findBySourceArticle(String key, int type,
			int start, int count) {
		String ids = getIds(key);
		if (ids == null)
			return null;
		return dao.findInSourceArticleIds(ids, type, start, count);
	}

	public int countLikeAuthor(String key, int type) {
		String authorIds = "";
		List<Member> memberList = memberDao.getMember(key);
		if (memberList == null || memberList.size() < 1)
			return 0;
		for (Iterator iter = memberList.iterator(); iter.hasNext();) {
			Member member = (Member) iter.next();
			authorIds += "," + member.getId();
		}
		authorIds = authorIds.substring(1);
		return dao.countInAuthorIds(authorIds, type);
	}

	public int countLikeContent(String key, int type) {
		return dao.countLikeContent(key, type);
	}

	public List<RemarkArticle> findLikeAuthor(String key, int type, int start,
			int count) {
		String authorIds = "";
		List<Member> memberList = memberDao.getMember(key);
		if (memberList == null || memberList.size() < 1)
			return null;
		for (Iterator iter = memberList.iterator(); iter.hasNext();) {
			Member member = (Member) iter.next();
			authorIds += "," + member.getId();
		}
		authorIds = authorIds.substring(1);
		return dao.findInAuthorIds(authorIds, type, start, count);
	}

	public List<RemarkArticle> findLikeContent(String key, int type, int start,
			int count) {
		return dao.findLikeContent(key, type, start, count);
	}

	public MemberDAO getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
}
