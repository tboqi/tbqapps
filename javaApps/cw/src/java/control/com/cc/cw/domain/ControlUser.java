package com.cc.cw.domain;

import java.util.Date;

public class ControlUser {

	private int id;

	private String account;

	private String password;

	private int level = 0;//等级，1是最高权限可以操作所有权限；默认0根据权限列表操作

	private Date createTime;

	private String role = "";// 权限id的列表以,分开

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
