package com.xiaoshuo.stock.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.Stockholder;
import com.xiaoshuo.stock.impl.StockManagerImpl;
import com.xiaoshuo.stock.impl.StockholderManagerImpl;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.Source;

/**
 * @author ÌÆ²®çù
 *
 */
public class StockholderParser {
	private static Log logger = LogFactory.getLog(StockholderManagerImpl.class);
	public static void parse(String stockNum){
		String url = buildUrl(stockNum);
		try {
			Source source = new Source(new URL(url));
			Element e,e1;
			List list = source.findAllElements("bgcolor", "#FFFFFF", true);
			List l ;
			for(int i =0; i<list.size();i++){
				e = (Element) list.get(i);
				l = e.getChildElements();
				e1 = (Element) l.get(0);
				String holderName = e1.getTextExtractor().toString();
				e1 = (Element) l.get(1);
				String stockCount = e1.getTextExtractor().toString();
				e1 = (Element) l.get(2);
				String stockScale = e1.getTextExtractor().toString();
				e1 = (Element) l.get(3);
				String stockKind = e1.getTextExtractor().toString();
				Stockholder sh = new Stockholder();
				sh.setStockNum(stockNum);
				sh.setStockCount(stockCount);
				sh.setStockKind(stockKind);
				sh.setStockScale(stockScale);
				sh.setHolderName(holderName);
				StockholderManagerImpl.add(sh);
				logger.info("get stockholder " + stockNum + ":" + holderName);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		String stockNum;
		List<String> list = StockManagerImpl.getAllStockNum();
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			stockNum = (String) iter.next();
			parse(stockNum);
		}
	}

	private static String buildUrl(String stockNum) {
		return "http://stockdata.stock.hexun.com/urwh/company/owner/"+stockNum+".shtml#Menu=ChildMenu1";
	}
}
