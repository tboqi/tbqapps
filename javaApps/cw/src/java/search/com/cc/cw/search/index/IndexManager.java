package com.cc.cw.search.index;

import java.io.IOException;
import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;

public interface IndexManager {

	/**
	 * 建立索引库
	 *
	 */
	public void createIndexDB();
	
	/**
	 * 删除索引库
	 *
	 */
	public void removeIndexDB(); 
	
	/**
	 * 删除索引
	 * @param term
	 */
	public void deleteIndex(Term term);
	
	/**
	 * 是索引库失效
	 * @param indexName
	 * @throws IOException
	 */
	public void makeIndexInvalidate(String indexName) throws IOException;
	/**
	 * 将信息封装为Field，存入Document对象
	 * @return
	 */
	public List<Document> constructDocument(String from);
	
	/**
	 * 删除旧的索引库文件
	 *
	 */
	public boolean deleteOldIndex();
}
