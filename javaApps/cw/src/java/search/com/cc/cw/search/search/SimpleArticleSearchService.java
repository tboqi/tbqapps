package com.cc.cw.search.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cjk.CJKAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.search.index.ArticleIndexManager;


public class SimpleArticleSearchService extends SearchServiceImpl{

	private ArticleIndexManager manager;
	
	/**
	 * 搜索方法
	 * 1、初始化IndexReader，失败返回null<br>
	 * 2、搜索，根据"title", "author", "content"
	 */
	@SuppressWarnings("unchecked")
	public SearchResult search(String queryString, int startPos, int endPos) {
		SearchResult result = new SearchResult();
		Analyzer analyzer = new CJKAnalyzer();
		IndexReader reader = SearcherHelper.initIndexReader(manager);
		if(reader == null){
			log.info("没有任何索引库");
			return null;
		}
		MultiFieldQueryParser multiQuery = new MultiFieldQueryParser(
				new String[] { "title", "author", "content"}, analyzer);
		Query query = null;
		try {
			query = multiQuery.parse(queryString);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		long beforeSearch = new Date().getTime();

		Hits hits = this.search(reader, query);
		long searchTime = new Date().getTime() - beforeSearch;

		List<Map<String, String>> searchItems = new ArrayList<Map<String, String>>();
		int totalCount = 0;
		totalCount = hits.length();
		int totalPage = 0;
		totalPage = totalCount / endPos;
		if (totalCount % endPos != 0)
			totalPage += 1;
		int start = (startPos - 1) * endPos;// 开始位置
		int HITS_PER_PAGE = startPos * endPos;
		int end = Math.min(hits.length(), HITS_PER_PAGE);// 结束位置
		for (int i = start; i < end; i++) {
			Document document = null;
			try {
				document = hits.doc(i);
			} catch (IOException e) {
				e.printStackTrace();
			}
			List<Field> list = document.getFields();
			Iterator<Field> it = list.iterator();
			Map<String, String> map = new HashMap<String, String>();
			while (it.hasNext()) {
				Field field = it.next();
				String key = field.name();
				String value = field.stringValue();
				map.put(key, SearcherHelper.highLight(key, value, analyzer,
						query));
			}
			searchItems.add(map);
		}
		result.setSearchItems(searchItems);
		result.setTotalItemCount(totalCount);
		result.setUsedTime(searchTime);
		result.setCurrentPos(startPos);
		return result;
	}

	public void setManager(ArticleIndexManager manager) {
		this.manager = manager;
	}

	public static void main(String[] args) {
		Log log = LogFactory.getLog(SimpleArticleSearchService.class);
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml","dataAccessContext-local.xml","indexContext.xml" });
		SimpleArticleSearchService service = (SimpleArticleSearchService)ctx.getBean("articleSearchService");
		log.info("start search......");
		SearchResult result = service.search("ggg 3 2 4 1", 1, 10);
		log.info("result.size=="+result.getSearchItems().size());
	}
}
