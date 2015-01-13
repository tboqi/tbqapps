package com.cc.cw.search.index;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.domain.Label;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.search.parse.LabelResourceParse;
import com.cc.cw.search.search.SearcherHelper;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.FileUtil;

public class LabelIndexManager extends IndexManagerImpl {

	private LabelResourceParse parser = null;
	private SimpleArticleService articleService = null;
	
	@Override
	public String getIndexDir() {
		return INDEXROOT + "cwLabel/";
	}

	@SuppressWarnings("unchecked")
	public List<Document> constructDocument(String from) {
		List<Label> resourceList = parser.parseResource(from);
		List<Document> documentList = null;
		if(resourceList!=null && resourceList.size() > 0){
			documentList = new ArrayList<Document>();
			for(Label label : resourceList){
				if(label==null)continue;
				Member member = memberService.get(label.getMemberId());
				SimpleArticle article = articleService.getById(label.getArticleId());
				Document doc = new Document();
				if(article == null | member == null) {
					Field labelIdField = new Field("labelId",""+label.getId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
					doc.add(labelIdField);
					documentList.add(doc);
					continue;
				}
				
				log.info("id ==> "+label.getId());
				Field idField = new Field("id",""+label.getArticleId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field titleField = new Field("title",Convert.getText(article.getTitle()),Field.Store.YES,Field.Index.TOKENIZED);
				Field memberIdField = new Field("memberId",""+label.getMemberId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field authorField = new Field("author",member.getUserName(),Field.Store.YES,Field.Index.TOKENIZED);
				Field labelIdField = new Field("labelId",""+label.getId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field articleContentField = new Field("label",label.getContent(),Field.Store.YES,Field.Index.TOKENIZED);
				Field contentField = new Field("content",Convert.getText(article.getContent()),Field.Store.YES,Field.Index.TOKENIZED);
				Field typeField = new Field("type","label",Field.Store.YES,Field.Index.UN_TOKENIZED);

				doc.add(idField);
				doc.add(titleField);
				doc.add(memberIdField);
				doc.add(authorField);
				doc.add(contentField);
				doc.add(typeField);
				doc.add(labelIdField);
				doc.add(articleContentField);
				doc.setBoost(IndexHelper.setBoostByDate(article.getCreateDate()));
				
				documentList.add(doc);
			}
		}
		return documentList;
	}
	
	@Override
	protected void addDocumentToWriter(IndexWriter writer) {
		String lastIndexedRecord = parser.getLastIndexedId();
		List<Document> docList = null;
		while(true){
			docList = constructDocument(lastIndexedRecord);
			
			//如果list不为空，则循环向writer中添加索引
			if(docList != null){
				for(Document doc : docList){
					this.addDocument(writer,doc);
					lastIndexedRecord = doc.get("labelId");
				}
				
				//检查是否还有新纪录，避免被过滤不规则数据后docList不全
				boolean keepCheck = parser.haveNewResource(lastIndexedRecord);
				if(keepCheck) continue;
				
				//如果size小于10，说明已到达数据库结尾，退出循环
				if(docList.size() < 10){
					//改写最后索引的标签id
					parser.updateIndexRecord(lastIndexedRecord);
					break;
				}
			}else{
				//改写最后索引的标签id
				parser.updateIndexRecord(lastIndexedRecord);
				break;
			}
		}
	}

	public void deleteIndex(Term term) {

	}

	public void removeIndexDB() {
		String indexDir = this.getIndexDir();
		if(indexDir == null || indexDir.trim().equals("")) {
			log.error("无效地址");
			return ;
		}
		try {
			makeIndexInvalidate(indexDir);
		} catch (IOException e) {
			log.error("删除标示失败");
			e.printStackTrace();
			return;
		}
		File db = new File(indexDir);
		IndexReader reader = SearcherHelper.initIndexReader(this);
		log.info("reader === "+reader);
		if (reader != null){
			try {
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(!db.isDirectory()) {
			log.error("指定的位置不是目录");
			return ;
		}

		FileUtil.removeFile(parser.getPath());
		FileUtil.removeDir(db);
	}

	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}

	public void setParser(LabelResourceParse parser) {
		this.parser = parser;
	}

	public static void main(String[] args) {
		final Log log = LogFactory.getLog(LabelIndexManager.class);
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml","dataAccessContext-local.xml","indexContext.xml" });
		LabelIndexManager manager = (LabelIndexManager)ctx.getBean("labelIndexManager");
		
		log.info("getIndexDir == >"+manager.getIndexDir());
		log.info("start .......");
		manager.constructDocument("253");
	}
}
