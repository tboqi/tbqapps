package com.xiaoshuo.stock.domain;

import java.util.Date;

public class StockUser {
	private long memberId;
	private String name;
	private float balance;
	private int state;			/* 0:nomal, 1:forbid*/
	private int credit;
	private Date creditTime;
	private Date createTime;
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(memberId);
		sb.append("_");
		sb.append(name);
		sb.append("_");
		sb.append(balance);
		sb.append("_");
		sb.append(state);
		sb.append("_");
		sb.append(credit);
		sb.append("_");
		sb.append(createTime);
		return sb.toString();
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public Date getCreditTime() {
		return creditTime;
	}
	public void setCreditTime(Date creditTime) {
		this.creditTime = creditTime;
	}
}
