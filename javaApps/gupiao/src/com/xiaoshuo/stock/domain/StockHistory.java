package com.xiaoshuo.stock.domain;

import java.util.Date;

public class StockHistory {
	private int id;
	private long memberId;
	private int type;			/* 0:buy, 1:sell */
	private String stockId;
	private int hands;
	private float price;
	private float balance;
	private Date transTime;
	
	public static int BUY = 0, SELL = 1;
	
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public Date getTransTime() {
		return transTime;
	}
	public void setTransTime(Date transTime) {
		this.transTime = transTime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(id);
		sb.append("_");
		sb.append(memberId);
		sb.append("_");
		sb.append(type);
		sb.append("_");
		sb.append(stockId);
		sb.append("_");
		sb.append(hands);
		sb.append("_");
		sb.append(price);
		sb.append("_");
		sb.append(balance);
		sb.append("_");
		sb.append(transTime);
		return sb.toString();
	}
	public int getHands() {
		return hands;
	}
	public void setHands(int hands) {
		this.hands = hands;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
}
