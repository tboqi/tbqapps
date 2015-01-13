package com.xiaoshuo.stock.web;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.htmlparser.util.ParserException;

import com.xiaoshuo.stock.domain.Stock;
import com.xiaoshuo.stock.impl.StockManagerImpl;
import com.xiaoshuo.stock.util.HtmlParser;

/**
 * url get role:  http://www.baidu.com/s?pn=1&rn=2&wd=000751&bs=000751
 * 
 * @author tbq
 * 
 */
public class BaiduStock {
	/**
	 * Logger for this class
	 */
	private static Log log = LogFactory.getLog(BaiduStock.class);

	public URLConnection getURLConnectionFromBaidu(String num) {
		String webUrl = "http://www.baidu.com/s?pn=1&rn=2&wd=" + num + "&bs=" + num;
		URL url;
		URLConnection connection = null;
		try {
			url = new URL(webUrl);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("User-agent", "Mozilla/4.0");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return connection;
	}

	public String getRealTimeStockInfo(String num) {
		String webUrl = "http://www.baidu.com/s?pn=1&rn=2&wd=" + num + "&bs=" + num;
		String results[] = new HtmlParser().getData(webUrl);
		String result = null;
		if(results!=null && results.length>0)result = results[0];

		return result;
	}

	public Stock parseStock(String stockNum) {
		if(stockNum == null){
			log.info("null" + stockNum);
			return null;
		}
		Stock stock = new Stock();
		String stockInfo = getRealTimeStockInfo(stockNum);
		if(stockInfo == null){
			log.info("null" + stockNum);
			return null;
		}
		String[] str = stockInfo.split(" ");
		List<String> list = new ArrayList<String>();
		for (String string : str) {
			if(StringUtils.isEmpty(string)) continue;
			list.add(string);
		}
		stock.setName(list.get(0));
		stock.setStockId(stockNum);
		stock.setPrice(NumberUtils.toFloat(list.get(5)));
		stock.setTradingVolume(NumberUtils.toLong(StringUtils.replaceChars(
				list.get(10), ",", "")));
		String date = Calendar.getInstance().get(Calendar.YEAR) + "/" + list.get(2);
		String time = list.get(3);
		try {
			stock.setUpdateTime(DateUtils.parseDate(date + " " + time,
					new String[] { "yyyy/MM/dd HH:mm" }));
		} catch (ParseException e) {
			log.error(e.getMessage());
			stock.setUpdateTime(new Date());
		}
		if (StringUtils.equals("µø", list.get(6))) {
			stock.setPriceChange(0 - NumberUtils.toFloat(list.get(7)));
			stock.setPriceChangePercent(0 - NumberUtils.toFloat(list.get(8)
					.substring(1, 4)));
		} else {
			stock.setPriceChange(NumberUtils.toFloat(list.get(7)));
			stock.setPriceChangePercent(NumberUtils.toFloat(list.get(8).substring(
					1, 4)));
		}

		return stock;
	}

	public void parseStock(int startNum, int endNum){
		Stock stock = null;
		if (startNum < 0)startNum = 0;
		if (endNum > 999999)endNum = 999999;
		for (int i = startNum; i <= endNum; i++) {
			String stockNum = makeStockNum(i);
			stock = this.parseStock(stockNum);
			if (stock == null)
				continue;
			StockManagerImpl.add(stock);
			try {
				Thread.sleep(5);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

	private String makeStockNum(int i) {
		String[] as = StockBuilder.getAVAIL_STOCKS();
		return as[i];
	}

	public static void main(String[] args) throws ParserException {
//		Stock stock = new Stock();
//		BaiduStock baiduStock = new BaiduStock();
//		baiduStock.parseStock(1, 999);
//		String stockNum = "000751";
//		@SuppressWarnings("unused")
//		String stockInfo = baiduStock.getRealTimeStockInfo(stockNum);
//
//		stock = baiduStock.parseStock(stockNum);
//		System.out.println(stock);
	}

	
}
