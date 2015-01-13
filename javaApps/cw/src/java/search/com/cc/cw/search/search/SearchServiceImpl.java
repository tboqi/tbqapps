package com.cc.cw.search.search;

import java.io.IOException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;

public abstract class SearchServiceImpl implements SearchService {
	protected final Log log = LogFactory.getLog(getClass());
	

	protected Hits search(IndexReader reader, Query query) {
		Searcher searcher = new IndexSearcher(reader);
		Hits hits = null;
		try {
			hits = searcher.search(query);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return hits;
	}
}
