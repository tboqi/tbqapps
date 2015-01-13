package com.cc.cw.domain;

import java.util.Date;

public class TradeHistory {

	private int id;

	private int memberId;

	private int cuserId;

	private Date tradeTime;

	private String message;

	public int getCuserId() {
		return cuserId;
	}

	public void setCuserId(int cuserId) {
		this.cuserId = cuserId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}
}
