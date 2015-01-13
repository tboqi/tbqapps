package com.cc.cw.dao.impl;

import java.util.HashMap;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.IndexPicDAO;
import com.cc.cw.domain.IndexPic;

public class IndexPicDAOImpl extends SqlMapClientDaoSupport implements
		IndexPicDAO {

	@SuppressWarnings("unchecked")
	public void save(IndexPic pic) {
		HashMap map = new HashMap();
		map.put("oldName", pic.getOldName());
		map.put("newName", pic.getNewName());
		map.put("addTime", pic.getAddTime());
		map.put("link", pic.getLink());
		getSqlMapClientTemplate().insert("indexPic.insert", map);
	}

	public IndexPic getIndexPic() {
		return (IndexPic) getSqlMapClientTemplate().queryForObject(
				"indexPic.getIndexPic", null);
	}

}
