package stock;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StockFetcher {
	private static Log log = LogFactory.getLog(StockFetcher.class);
	public int stockTotal() {
		String url = "http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeStockCount?node=hs_a";
		String s = ChentuUtils.getUrlContent(url);
		s = StringUtils.mid(s, 13, 4);
		int i = Integer.parseInt(s);
		log.info("----------------------total stocks: " + i + " -------------------");
		return i;
	}
	
	public void fetch(int pagenum, int num) {
		String url = "http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeData?page=" +
			pagenum + "&num="+num+"&sort=symbol&asc=1&node=hs_a&_s_r_a=page";
		String s = ChentuUtils.getUrlContent(url);
		s = StringUtils.mid(s, 1, s.length() - 2);
		String[] arr = StringUtils.splitByWholeSeparator(s, "},{");
		ApplicationContext context = new ClassPathXmlApplicationContext("/spring-jdbc.xml");
		StockDao stockDao = (StockDao) context.getBean("stockDao");
		List<Stock> stocks = new ArrayList<Stock>();
		for (String str : arr) {
			if(!str.startsWith("{")) str = "{" + str;
			if(!str.endsWith("}")) str += "}";
			log.info("----------------------" + str + " -------------------");
			JSONObject jsonObject = JSONObject.fromObject( str );  
			Stock stock = (Stock) JSONObject.toBean(jsonObject, Stock.class);
			stock.setFetchtime(new Date());
			stocks.add(stock);
		}
		stockDao.save(stocks);
	}
	
	public static void main(String[] args) {
		StockFetcher sf = new StockFetcher();
		int num = 20;
		int stockTotal = sf.stockTotal();
		int totalPage = (int)stockTotal / num;
		if(stockTotal % num > 0) {
			totalPage++;
		}
		for(int i=1; i<=totalPage; i++) {
			StockFetcherThread sft = new StockFetcherThread(i, num);
			Thread thread = new Thread(sft);
			thread.start();
		}
	}
}
