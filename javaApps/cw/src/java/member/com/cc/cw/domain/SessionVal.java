package com.cc.cw.domain;


/**
 * 只有机器能获得票数,机器的标识由cookie进行
 * 每次打开本网站,检查是否存在cookie,如果不存在,分配hostId,记录信息并入库
 * 如果存在,则检查是否需要发票
 * 未登录的用户,是可以获得票数的,因此票数与用户无关
 * 一旦用户注册登录,则不再使用本表,以后的信息,都记录在cookie与用户表中
 * 投票,也只有cookiez中的票数有效
 * @author Administrator
 *
 */

public class SessionVal {
	private int id;
	private int memberId;
	private String hostId;			//分配的hostid
	private String firstVisitTime;
	private String lastVisitTime;
	private String fromIP;
	private int privilege;			//未注册用户的票数
	private int state;				//状态，用户未注册前，活跃 1，注册之后，非活跃 0
	
	public String getFirstVisitTime() {
		return firstVisitTime;
	}
	public void setFirstVisitTime(String firstVisitTime) {
		this.firstVisitTime = firstVisitTime;
	}
	public String getFromIP() {
		return fromIP;
	}
	public void setFromIP(String fromIP) {
		this.fromIP = fromIP;
	}
	public String getHostId() {
		return hostId;
	}
	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLastVisitTime() {
		return lastVisitTime;
	}
	public void setLastVisitTime(String lastVisitTime) {
		this.lastVisitTime = lastVisitTime;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.id);
		sb.append("_");
		sb.append(this.memberId);
		sb.append("_");
		sb.append(this.getHostId());
		sb.append("_");
		sb.append(this.getPrivilege());
		sb.append("_");
		sb.append(this.getState());
		return sb.toString();
	}
}
