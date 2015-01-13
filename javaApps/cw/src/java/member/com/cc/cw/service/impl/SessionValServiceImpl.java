package com.cc.cw.service.impl;

import java.util.Date;

import com.cc.cw.dao.SessionValDAO;
import com.cc.cw.domain.SessionVal;
import com.cc.cw.service.SessionValService;


public class SessionValServiceImpl  implements SessionValService{

	private SessionValDAO dao;
	
	public SessionValDAO getDao(){
		return dao;
	}
	
	public void setDao(SessionValDAO dao){
		this.dao = dao;
	}
	
	public SessionVal get(int id) {
		// TODO Auto-generated method stub
		return dao.get(id);
	}

	public int getIPs(String hostId) {
		// TODO Auto-generated method stub
		return dao.getIPs(hostId);
	}

	public String allocHostId() {
		// TODO Auto-generated method stub
		return (new Date()).getTime()+"";
	}

	public int add(SessionVal item) {
		// TODO Auto-generated method stub
		return dao.add(item);
	}

	public boolean setState(String hostId, int state) {
		// TODO Auto-generated method stub
		return dao.setState(hostId, state);
	}

	public SessionVal getByMemberId(int memberId) {
		// TODO Auto-generated method stub
		return dao.getByMemberId(memberId);
	}

	public SessionVal getByHostId(String hostId) {
		// TODO Auto-generated method stub
		return dao.getByHostId(hostId);
	}

	public int getMaxId() {
		// TODO Auto-generated method stub
		return dao.getMaxId();
	}

	public boolean del(int id) {
		// TODO Auto-generated method stub
		return dao.del(id);
	}

	public int setLastVisitTime(String hostId,Long time) {
		// TODO Auto-generated method stub
		return dao.setLastVisitTime(hostId,time);
	}

	public boolean incVotes(String hostId, int nVotes) {
		// TODO Auto-generated method stub
		return dao.incVotes(hostId, nVotes);
	}

	public boolean setMemberId(String hostId, int memberId) {
		// TODO Auto-generated method stub
		return dao.setMemberId(hostId,memberId);
	}

	public int update(SessionVal sessionVal) {
		// TODO Auto-generated method stub
		return dao.update(sessionVal);
	}

	/**
	 * 查看改IP是否在今日有非注册用户的历史
	 * @param ip
	 * @return
	 */
	public boolean isTodayLogin(String ip) {
		return dao.isTodayLogin(ip);
	}

}
