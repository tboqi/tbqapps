package com.cc.cw.search.index;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.search.parse.ArticleResourceParse;
import com.cc.cw.search.search.SearcherHelper;
import com.cc.cw.util.Convert;
import com.cc.cw.util.FileUtil;

public class ArticleIndexManager extends IndexManagerImpl {

	ArticleResourceParse parser = null;
	
	
	@Override
	public String getIndexDir() {
		return INDEXROOT + "article/";
	}

	public List<Document> constructDocument(String from) {
		List<SimpleArticle> resourceList = parser.parseResource(from);
		List<Document> documentList = null;
		if(resourceList.size() > 0){
			documentList = new ArrayList<Document>();
			for(SimpleArticle article : resourceList){
				Member member = memberService.get(article.getMemberId());
				Document doc = new Document();
				if(member == null) {
					Field idField = new Field("id",""+article.getId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
					doc.add(idField);
					documentList.add(doc);
					continue;
				}
				
				log.info("id ==> "+article.getId());
				Field idField = new Field("id",""+article.getId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field titleField = new Field("title",article.getTitle(),Field.Store.YES,Field.Index.TOKENIZED);
				Field memberIdField = new Field("memberId",""+article.getMemberId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field authorField = new Field("author",member.getUserName(),Field.Store.YES,Field.Index.TOKENIZED);
				Field contentField = new Field("content",Convert.getText(article.getContent()),Field.Store.YES,Field.Index.TOKENIZED);
				Field statusField = new Field("status",""+article.getState(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field createDateField = new Field("createDate",""+article.getCreateDate(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field endDateField = new Field("endDate",""+article.getEndDate(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field supportCountField = new Field("supportCount",""+article.getSupportCount(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field unSupportCountField = new Field("unSupportCount",""+article.getUnSupportCount(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field typeField = new Field("type","article",Field.Store.YES,Field.Index.UN_TOKENIZED);
				
				doc.add(idField);
				doc.add(titleField);
				doc.add(memberIdField);
				doc.add(authorField);
				doc.add(contentField);
				doc.add(statusField);
				doc.add(createDateField);
				doc.add(endDateField);
				doc.add(supportCountField);
				doc.add(unSupportCountField);
				doc.add(typeField);
				doc.setBoost(IndexHelper.setBoost(article.getSupportCount()+article.getUnSupportCount()));
				documentList.add(doc);
			}
		}
		return documentList;
	}
	
	public void addDocumentToWriter(final IndexWriter writer){
		String lastIndexedRecord = parser.getLastIndexedId();
		List<Document> docList = null;
		while(true){
			docList = constructDocument(lastIndexedRecord);
			
			//如果list不为空，则循环向writer中添加索引
			if(docList != null){
				for(Document doc : docList){
					this.addDocument(writer,doc);
					lastIndexedRecord = doc.get("id");
					
				}
				log.info("lastIndexedRecord == "+lastIndexedRecord);
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
		// TODO Auto-generated method stub

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

	public void setParser(ArticleResourceParse parser) {
		this.parser = parser;
	}

}
