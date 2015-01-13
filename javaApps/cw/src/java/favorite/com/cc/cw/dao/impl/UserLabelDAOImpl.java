package com.cc.cw.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.UserLabelDAO;
import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.UserLabel;

public class UserLabelDAOImpl extends SqlMapClientDaoSupport implements UserLabelDAO {
	protected final Log log = LogFactory.getLog(getClass());
	
	public List getUserLabels(String uuid, int limit) {
		if(uuid == null){
			return new ArrayList();
		}
		int tablePostfix = HashUtil.getHashCode(uuid);
//		log.debug("uuid --> "+uuid);
		String tableName = "user_label_" + tablePostfix;
//		log.debug("user_label_ --> "+tableName);
		Map<String, String> map = new HashMap<String, String>();
		map.put("uuid", uuid);
		map.put("tableName", tableName);
		map.put("limit", new Integer(limit).toString());

		return this.getSqlMapClientTemplate().queryForList("userLabel.getUserLabels", map);
	}

	public int getCount(String uuid, int limit, int memberId) {
		List labelList = getUserLabels(uuid, limit);
		if(labelList == null || labelList.size() == 0)
			return 0;
		String or = "(Content like '%" + ((UserLabel)labelList.get(0)).getLabel() + "%')";
		for(int i=1; i<labelList.size(); i++) {
			or += " or (Content like '%" + ((UserLabel)labelList.get(i)).getLabel() + "%')";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("or", or);
		map.put("memberId", memberId);
		return (Integer)this.getSqlMapClientTemplate().queryForObject("userLabel.getCount", map);
	}

	public static void main(String args[]) {

	}
}
