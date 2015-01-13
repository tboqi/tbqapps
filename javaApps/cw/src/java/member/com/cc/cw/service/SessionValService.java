package com.cc.cw.service;

import com.cc.cw.domain.SessionVal;

public interface SessionValService {

	public SessionVal get(int id);
	
	public SessionVal getByMemberId(int memberId);

	public SessionVal getByHostId(String hostId);
	
	public int getIPs(String hostId);
	
	public int getMaxId();
	
	public String allocHostId();
	
	public int add(SessionVal item);

	public int setLastVisitTime(String hostId, Long time);
	
	/**
	 * 将cookie中的票数存入用户帐户
	 * 一旦用户注册，将状态置为非活跃
	 * @return
	 */
	public boolean setMemberId(String hostId, int memberId);
	
	public boolean setState(String hostId, int state);
	
	public boolean incVotes(String hostId, int nVotes);
	
	public boolean del(int id);
	
	public int update(SessionVal sessionVal);
	
	/**
	 * 查看改IP是否在今日有非注册用户的历史
	 * @param ip
	 * @return
	 */
	public boolean isTodayLogin(String ip);
}
