package com.cc.cw.domain;

import java.util.Date;

public class Member {

	private int id;
	private String userName;
	private String password;
	private String email;
	private String ip;
	private int privilege;
	private Date lastLoginTime;
	private Date registerTime;
	/** 性别 0保密，1女，2男*/
	private int gender;
	/** 自我介绍 */
	private String descript;
	
	/** 为数据采集提供唯一uuid*/
	private String uuid;
	
	/** 标识用户是否激活 */
	private int state;
	/** 标识用户以激活 */
	public final static int STATE_ENABLE = 1;
	/** 标识用户未激活 */
	public final static int STATE_DISABLE = 0;
	
	/** 用来存放privilege后面小数*1000的值 */
	private int privilegeDecimalValue;
	
	private String coverPath;
	private int commend;
	
	public String getCoverPath() {
		return coverPath;
	}
	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	public int getPrivilegeDecimalValue() {
		return privilegeDecimalValue;
	}
	public void setPrivilegeDecimalValue(int privilegeDecimalValue) {
		this.privilegeDecimalValue = privilegeDecimalValue;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getPrivilege() {
		return privilege;
	}
	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getCommend() {
		return commend;
	}
	public void setCommend(int commend) {
		this.commend = commend;
	}
	
}
