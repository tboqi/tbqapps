package com.cc.cw.search.search;

import java.io.IOException;
import java.io.StringReader;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;

import com.cc.cw.search.index.IndexHelper;
import com.cc.cw.search.index.IndexManagerImpl;

/**
 * 搜索帮助类
 * @author lsd037
 *
 */
public class SearcherHelper {
	private static Log log = LogFactory.getLog(SearcherHelper.class);
	private static SimpleHTMLFormatter sHtmlF = new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");
	
	private static IndexReader reader = null;
	private static String currentIndexDir = "";
	private static long oldTime = -1;
	
	public static final long UPDATE_INTERVAL = 10000;
	public static boolean started = false;
	
	
	/**
	 * 将结果转化为高亮显示
	 * @param key
	 * @param value
	 * @param analyzer
	 * @param query
	 * @return
	 */
	public static String highLight(String key , String value ,Analyzer analyzer , Query query ){
		Highlighter highlighter = new Highlighter(sHtmlF,new QueryScorer(query));
		highlighter.setTextFragmenter(new SimpleFragmenter(100));
		TokenStream tokenStream = analyzer.tokenStream(key,new StringReader(value));
		String str = "";
		try {
			str = highlighter.getBestFragment(tokenStream, value);
		} catch (IOException e) {
			log.error("转换高亮异常");
			e.printStackTrace();
		}
		
		return str == null ? value : str;
	}
	
	public static boolean compareTime(){
		boolean flag = true;
		if(oldTime > 0){
			long currentTime = new Date().getTime();
			flag = (currentTime - oldTime) >= UPDATE_INTERVAL;
			oldTime = currentTime;
			
			return flag;
		}else{
			oldTime = new Date().getTime();
		}
		return flag;
	}
	
	/**
	 * 根据不同搜索资源的索引库路径得到IndexReader<br>
	 * 得到最新的索引库（通过截取同名的“.done”文件）如果路径错误则返回"NULL"
	 * @param manager － 具体要索引的资源类型
	 * @return IndexReader || null
	 */
	public static IndexReader initIndexReader(IndexManagerImpl manager){
		String indexDir = manager.getIndexDir();
//		boolean falg = compareTime();
		if(true){
			String tempDir = IndexHelper.getCurrentDotDone(indexDir);
			if(tempDir.indexOf(".") < 0) {
				log.error("indexDB not exist");
				return null;
			}
			String newIndexDir = tempDir.substring(0, tempDir.indexOf("."));
			try {
			  if(currentIndexDir.equals(newIndexDir)){
				  if(reader == null){
					log.info("open index at " + newIndexDir);
					reader = IndexReader.open(newIndexDir);
				  }
			  }else{
				  if(reader != null){
					  reader.close();
				  }
				  currentIndexDir = newIndexDir;
				  log.info("open index at " + currentIndexDir);
				  reader = IndexReader.open(newIndexDir);
			  }
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return reader;
	  }
}
