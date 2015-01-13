import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;


public class search {

	public static void main(String[] args) throws CorruptIndexException, IOException {
		Directory dir = FSDirectory.open(new File("d:\\indexnew"));
		Searcher searcher = new IndexSearcher(dir, true);
		Document doc = searcher.doc(0);
		System.out.println(doc);
		searcher.close();
	}
	
//	public ArrayList<Document> getQueryDate(String info)
//
//	   throws CorruptIndexException, IOException,
//
//	   org.apache.lucene.queryParser.ParseException {
//
//	  ArrayList<Document> doc = new ArrayList<Document>();
//
//	  String queryString = info;
//	  Hits hits = null;
//	  Query query = null;
//	  QueryParser qp = null;
//	  String dir = "c:\\hujiong"; // 一定要跟你建索引的位置 一致
//
//	  // 建立索引检索对象
//	  IndexSearcher searcher = new IndexSearcher(dir);
//	  // 分词器
//	  Analyzer analyzer = new StandardAnalyzer();
//	  qp = new QueryParser("content", analyzer);// 这里上面只写了一个按Content查找.
//	  下面添加的是title, 查找
//	  query = qp.parse(queryString);
//	  if (searcher != null) {
//		  hits = searcher.search(query);
//		  doc = new ArrayList<Document>();
//		  for (int i = 0; i < hits.length(); i++) {
//			  doc.add(hits.doc(i));
//		  }
//	  }
//
//	  IndexSearcher searcher = new IndexSearcher("c:\\hujiong");
//
//	  Analyzer analyzer = new StandardAnalyzer();
//
//	  Query query = null;
//
//	  if (searcher != null) {
//
//	   // 合并你搜索的字段, 增强你的搜索能力!!
//
//	   BooleanClause.Occur[] clauses = { BooleanClause.Occur.SHOULD,
//
//	     BooleanClause.Occur.SHOULD };
//
//	   query = MultiFieldQueryParser.parse(queryString, new String[] {
//
//	     "title", "content" }, clauses, analyzer);  // 这里就是在两个范围内进行收索 , 不过这些索引的字段必须要在添加数据到索引的时候设置它
//
//	   
//
//	   TopDocCollector collector = new TopDocCollector(5); // 设置返回的最大数目，就返回前100条
//
//	   
//
//	   searcher.search(query, collector);
//
//	   ScoreDoc[] hits1 = collector.topDocs().scoreDocs;
//
//	           // 返回的结果他是一个数组
//
//	   if (hits1.length > 0) {
//
//	    for (int i = 0; i < hits1.length; i++) {
//
//	     Document doc1 = searcher.doc(hits1[i].doc);
//
//	               // 这是从这个返回的数组里面迭代每一个数据，  它的值是Document
//
//	     doc.add(doc1);
//
//	     System.out.println(doc1.get("title") + "-----title");
//
//	     System.out.println(doc1.get("content") + "-------content");
//
//	    }
//
//	   } else {
//
//	    System.out.println("没有数据");
//
//	   }
//
//	  }
//
//	  return doc;
//
//	 }
}
