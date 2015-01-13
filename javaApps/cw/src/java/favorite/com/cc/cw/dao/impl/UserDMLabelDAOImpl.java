package com.cc.cw.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.UserDMLabelDAO;
import com.cc.cw.dm.dataAnalyze.HashUtil;
import com.cc.cw.domain.UserDMLabel;

public class UserDMLabelDAOImpl extends SqlMapClientDaoSupport implements
		UserDMLabelDAO {

	public int getCount(String uuid, int limit) {
		List labelList = getUserLabels(uuid, limit);
		if (labelList == null || labelList.size() == 0)
			return 0;
		String or = "(Content like '%"
				+ ((UserDMLabel) labelList.get(0)).getLabel() + "%')";
		for (int i = 1; i < labelList.size(); i++) {
			or += " or (Content like '%"
					+ ((UserDMLabel) labelList.get(i)).getLabel() + "%')";
		}
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"userDMLabel.getCount", or);
	}

	public List getUserLabels(String uuid, int limit) {
		int tablePostfix = HashUtil.getHashCode(uuid);
		String tableName = "user_dmlabel_" + tablePostfix;
		Map<String, String> map = new HashMap<String, String>();
		map.put("uuid", uuid);
		map.put("tableName", tableName);
		map.put("limit", new Integer(limit).toString());

		return this.getSqlMapClientTemplate().queryForList(
				"userDMLabel.getUserLabels", map);
	}

	public static void main(String args[]) {
	}
}
