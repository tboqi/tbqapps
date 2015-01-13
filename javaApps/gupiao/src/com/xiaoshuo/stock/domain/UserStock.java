package com.xiaoshuo.stock.domain;

import java.math.BigDecimal;

public class UserStock {
	private long memberId;
	private String stockId;
	private int amount;
	private float avgPrice;
	
	public float getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(float avgPrice) {
		BigDecimal b = new BigDecimal(avgPrice);
		avgPrice = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		this.avgPrice = avgPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public String getStockId() {
		return stockId;
	}
	public void setStockId(String stockId) {
		this.stockId = stockId;
	}
	
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(memberId);
		sb.append("_");
		sb.append(stockId);
		sb.append("_");
		sb.append(amount);
		sb.append("_");
		sb.append(avgPrice);
		return sb.toString();
	}
}
