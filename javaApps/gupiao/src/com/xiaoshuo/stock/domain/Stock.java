package com.xiaoshuo.stock.domain;

import java.util.Date;

public class Stock {

	private int id;

	private String name;

	private String stockId;

	private Date updateTime;

	private float price;

	private float priceChange;

	private float priceChangePercent;// 变动百分�?

	private long tradingVolume; // 交易�?

	public Stock(int id, String name, String stockId, Date updateTime, float price,
			float priceChange, float priceChangePercent, long tradingVolume) {
		super();
		this.id = id;
		this.name = name;
		this.stockId = stockId;
		this.updateTime = updateTime;
		this.price = price;
		this.priceChange = priceChange;
		this.priceChangePercent = priceChangePercent;
		this.tradingVolume = tradingVolume;
	}

	public String toString() {
		return "name->" + name + "\n" + "stockId->" + stockId + "\n" + "updateTime->"
				+ updateTime + "\n" + "price->" + price + "\n"
				+ "priceChange->" + priceChange + "\n" + "priceChangePercent->"
				+ priceChangePercent + "\n" + "tradingVolume->" + tradingVolume;
	}

	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStockId() {
		return stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getPriceChange() {
		return priceChange;
	}

	public void setPriceChange(float priceChange) {
		this.priceChange = priceChange;
	}

	public float getPriceChangePercent() {
		return priceChangePercent;
	}

	public void setPriceChangePercent(float priceChangePercent) {
		this.priceChangePercent = priceChangePercent;
	}

	public long getTradingVolume() {
		return tradingVolume;
	}

	public void setTradingVolume(long tradingVolume) {
		this.tradingVolume = tradingVolume;
	}
}
