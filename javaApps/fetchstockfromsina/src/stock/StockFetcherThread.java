package stock;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StockFetcherThread implements Runnable {
	private static Log log = LogFactory.getLog(StockFetcher.class);
	private int threadnum;
	private int num;
	public StockFetcherThread(int threadnum, int num){
		this.threadnum = threadnum;
		this.num = num;
	}

	@Override
	public void run() {
		log.info("--------------fetch page" + this.threadnum + " start -----------");
		StockFetcher sf = new StockFetcher();
		sf.fetch(threadnum, num);
		log.info("--------------fetch page" + this.threadnum + " end -----------");
	}

}
