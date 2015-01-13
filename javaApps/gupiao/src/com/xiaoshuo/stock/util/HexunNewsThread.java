package com.xiaoshuo.stock.util;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.impl.StockManagerImpl;

/**
 * @author 唐伯琦
 *
 */
public class HexunNewsThread implements Runnable {

	private static Log log = LogFactory.getLog(HexunNewsThread.class);
	private List<String> list;
	private int cthreadnum;
	
	public HexunNewsThread(List<String> list, int cthreadnum){
		this.list = list;
		this.cthreadnum = cthreadnum;
	}
	public void run() {
		log.info("thread " + cthreadnum + " start");
		String stockNum, url;
		for(int i=0;i<list.size();i++){
			stockNum = list.get(i);
			url = HexunNewsList.buildUrl(stockNum);
			//HexunNewsList hnl = new HexunNewsList();
			HexunNewsList.parse(stockNum, url);
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		log.info("thread " + cthreadnum + " stop");
	}
	
	public static void startGetNews(){
		List<String> list = StockManagerImpl.getAllStockNum();
		if(list==null || list.size()<=0)return;
		int count = list.size();
		int threadNum = 0;//每个线程有多少stock
		int threadTotal = 10;//线程数
		threadNum = (int)(count / threadTotal);
		if(count % threadTotal != 0){
			threadTotal = threadTotal + 1;
		}
		//System.out.println("count=" + count);
		//System.out.println("threadTotal=" + threadTotal);
		for(int i=0; i<threadTotal;i++){
			int fromIndex = i * threadNum;
			int toIndex = (i+1) * threadNum;
			if(toIndex>count)toIndex=count;
			//System.out.println(fromIndex + "--" + toIndex);
			List<String> subList = list.subList(fromIndex, toIndex);
			Thread thread = new Thread(new HexunNewsThread(subList, i));
			thread.start();
		}
	}
	
	public static void main(String[] args) {
		List<String> list = StockManagerImpl.getAllStockNum();
		int count = list.size();
		int threadNum = 0;//每个线程有多少stock
		int threadTotal = 10;//线程数
		threadNum = (int)(count / threadTotal);
		if(count % threadTotal != 0){
			threadTotal = threadTotal + 1;
		}
		System.out.println("count=" + count);
		System.out.println("threadTotal=" + threadTotal);
		for(int i=0; i<threadTotal;i++){
			int fromIndex = i * threadNum;
			int toIndex = (i+1) * threadNum;
			if(toIndex>count)toIndex=count;
			System.out.println(fromIndex + "--" + toIndex);
			List<String> subList = list.subList(fromIndex, toIndex);
			Thread thread = new Thread(new HexunNewsThread(subList, i));
			thread.start();
		}
//		List<String> list1 = list.subList(fromIndex, toIndex)
	}
}
