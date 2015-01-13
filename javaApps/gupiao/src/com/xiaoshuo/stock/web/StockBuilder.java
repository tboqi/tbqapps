package com.xiaoshuo.stock.web;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.impl.StockManagerImpl;
import com.xiaoshuo.util.FileUtil;

public class StockBuilder implements Runnable {
	private static Log log = LogFactory.getLog(BaiduStock.class);
	private static String[] AVAIL_STOCKS = null;
	private static int DOWN_THREADS = 10;
	private int start;
	private int end;
	public StockBuilder(int num) {
		int totals = 0;
		int step = 0;
		if(AVAIL_STOCKS==null)totals=1000;
		else totals = AVAIL_STOCKS.length;
		log.info("total counts: " + totals);
		step = totals/DOWN_THREADS;
		start = num * step;
		if(num<DOWN_THREADS-1)end = start + step - 1;
		else end = totals - 1;
	}
	
	public static void startTask(){
		StockManagerImpl.setState();
		String as = FileUtil.getStringFromFile("/opt/stocks.db");
		int idx = as.indexOf("0");
		if(idx>0)as=as.substring(idx);
		if(as!=null)AVAIL_STOCKS = as.split(",");
		if(AVAIL_STOCKS==null)return;
		for(int i=0; i<DOWN_THREADS; i++){
			Thread downloadThread = new Thread(new StockBuilder(i));
			downloadThread.start();
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		StockManagerImpl.setState();
		String as = FileUtil.getStringFromFile("D:/xiaoshuo.com/stocks.db");
		int idx = as.indexOf("0");
		if(idx>0)as=as.substring(idx);
		if(as!=null)AVAIL_STOCKS = as.split(",");
		if(AVAIL_STOCKS==null)return;
		for(int i=0; i<DOWN_THREADS; i++){
			Thread downloadThread = new Thread(new StockBuilder(i));
			downloadThread.start();
		}
	}
	public void run() {
		log.info(new Date());
		BaiduStock baiduStock = new BaiduStock();
		baiduStock.parseStock(this.getStart(), this.getEnd());
		log.info(new Date());
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}
	public static String[] getAVAIL_STOCKS() {
		return AVAIL_STOCKS;
	}
}
