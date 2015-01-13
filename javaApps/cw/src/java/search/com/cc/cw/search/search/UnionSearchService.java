package com.cc.cw.search.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cjk.CJKAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.MultiReader;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.Query;

import com.cc.cw.search.index.ArticleIndexManager;
import com.cc.cw.search.index.ChannelIndexManager;
import com.cc.cw.search.index.IndexHelper;
import com.cc.cw.search.index.LabelIndexManager;
import com.cc.cw.search.index.RemarkIndexManager;
import com.cc.cw.util.Convert;

public class UnionSearchService extends SearchServiceImpl {

	private ChannelIndexManager channelManager;
	private ArticleIndexManager articleManager;
	private RemarkIndexManager remarkManager;
	private LabelIndexManager labelManager;
	
	@SuppressWarnings("unchecked")
	public SearchResult search(String queryString, int startPos, int endPos) {
		if(queryString==null || queryString.trim().equals("")){
			return null;
		}
		SearchResult result = new SearchResult();
		Analyzer analyzer = new CJKAnalyzer();
		
		String labelIndexDir = IndexHelper.getCurrentDotDone(labelManager.getIndexDir());
		String channelIndexDir = IndexHelper.getCurrentDotDone(channelManager.getIndexDir());
		String articleIndexDir = IndexHelper.getCurrentDotDone(articleManager.getIndexDir());
		String remarkIndexDir = IndexHelper.getCurrentDotDone(remarkManager.getIndexDir());
		
		if(channelIndexDir.equals("") || articleIndexDir.equals("") || remarkIndexDir.equals("")){
			return null;
		}
		channelIndexDir = channelIndexDir.substring(0, channelIndexDir.indexOf("."));
		articleIndexDir = articleIndexDir.substring(0, articleIndexDir.indexOf("."));
		remarkIndexDir = remarkIndexDir.substring(0, remarkIndexDir.indexOf("."));
		labelIndexDir = labelIndexDir.substring(0, labelIndexDir.indexOf("."));

		IndexReader labelReader = null;
		IndexReader channelReader = null;
		IndexReader articleReader = null;
		IndexReader remarkReader = null;
		MultiReader reader = null;
		try {
			channelReader = IndexReader.open(channelIndexDir);
			articleReader = IndexReader.open(articleIndexDir);
			remarkReader = IndexReader.open(remarkIndexDir);
			labelReader = IndexReader.open(labelIndexDir);
			reader = new MultiReader(new IndexReader[] { channelReader,articleReader,remarkReader,labelReader }); 
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		
		if(reader == null){
			log.info("没有任何索引库");
			return null;
		}
		MultiFieldQueryParser multiQuery = new MultiFieldQueryParser(
				new String[] { "title","content","author","label" }, analyzer);
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
				String value = Convert.getHtmlRealText(field.stringValue());
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

	public static void main(String[] args) {

	}

	public void setArticleManager(ArticleIndexManager articleManager) {
		this.articleManager = articleManager;
	}

	public void setChannelManager(ChannelIndexManager channelManager) {
		this.channelManager = channelManager;
	}

	public void setRemarkManager(RemarkIndexManager remarkManager) {
		this.remarkManager = remarkManager;
	}

	public void setLabelManager(LabelIndexManager labelManager) {
		this.labelManager = labelManager;
	}
}
