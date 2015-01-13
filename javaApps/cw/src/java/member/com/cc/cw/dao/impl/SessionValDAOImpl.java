package com.cc.cw.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.cc.cw.dao.SessionValDAO;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.util.DateTimeUtil;

public class SessionValDAOImpl extends SqlMapClientDaoSupport implements SessionValDAO{

	public SessionVal get(int id) {
		// TODO Auto-generated method stub
		return (SessionVal)this.getSqlMapClientTemplate().queryForObject("sessionVal.get", id);
	}

	public SessionVal getByMemberId(int memberId) {
		// TODO Auto-generated method stub
		return (SessionVal)this.getSqlMapClientTemplate().queryForObject("sessionVal.getByMemberId", memberId);
	}

	public SessionVal getByHostId(String hostId) {
		// TODO Auto-generated method stub
		return (SessionVal)this.getSqlMapClientTemplate().queryForObject("sessionVal.getByHostId", hostId);
	}

	public int getIPs(String hostId) {
		// TODO Auto-generated method stub
		return (Integer)this.getSqlMapClientTemplate().insert("sessionVal.getIPs",hostId);
	}

	public int getMaxId() {
		// TODO Auto-generated method stub
		return (Integer)this.getSqlMapClientTemplate().queryForObject("sessionVal.getMaxId",null);
	}

	public int add(SessionVal item) {
		// TODO Auto-generated method stub
		return (Integer)this.getSqlMapClientTemplate().insert("sessionVal.add",item);
	}

	@SuppressWarnings("unchecked")
	public boolean setState(String hostId, int state) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("state", state);
		map.put("hostId", hostId);
		return (Integer)this.getSqlMapClientTemplate().update("sessionVal.setState",map)>0;
	}

	@SuppressWarnings("unchecked")
	public boolean incVotes(String hostId, int nVotes) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("votes", nVotes);
		map.put("hostId", hostId);
		return (Integer)this.getSqlMapClientTemplate().update("sessionVal.incVotes",map)>0;
	}

	public boolean del(int id) {
		// TODO Auto-generated method stub
		return (Integer)this.getSqlMapClientTemplate().update("sessionVal.del",id)>0;
	}

	@SuppressWarnings("unchecked")
	public int setLastVisitTime(String hostId,Long time) {
		// TODO Auto-generated method stub
		String vtime = time + "";
		Map map = new HashMap();
		map.put("time", vtime);
		map.put("hostId", hostId);
		return (Integer)this.getSqlMapClientTemplate().update("sessionVal.setVisitime",map);
	}

	@SuppressWarnings("unchecked")
	public boolean setMemberId(String hostId, int memberId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("hostId", hostId);
		return (Integer)this.getSqlMapClientTemplate().update("sessionVal.setMemberId",map)>0;
	}

	public int update(SessionVal sessionVal) {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().update("sessionVal.update", sessionVal);
	}

	@SuppressWarnings("unchecked")
	public boolean isTodayLogin(String ip) {
		// TODO Auto-generated method stub
		String begin_time = DateTimeUtil.parseDateToString(new Date(), "yyyy-MM-dd 00:00:00");
		String begintime = DateTimeUtil.parseStringToDate(begin_time, "yyyy-MM-dd HH:mm:ss").getTime()+"";
		String endtime = new Date().getTime()+"";
		Map map = new HashMap();
		map.put("ip", ip);
		map.put("begintime", begintime);
		map.put("endtime", endtime);
		return (Integer)this.getSqlMapClientTemplate().queryForObject("sessionVal.isTodayLogin", map)>0?true:false;
	}

}
