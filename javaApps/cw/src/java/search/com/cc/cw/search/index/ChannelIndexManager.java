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

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.Member;
import com.cc.cw.search.parse.ChannelResourceParse;
import com.cc.cw.search.search.SearcherHelper;
import com.cc.cw.util.Convert;
import com.cc.cw.util.FileUtil;

public class ChannelIndexManager extends IndexManagerImpl {

	ChannelResourceParse parser = null;
	

	@Override
	public String getIndexDir() {
		return INDEXROOT + "channel/";
	}

	@SuppressWarnings("unchecked")
	public List<Document> constructDocument(String from) {
		List<Channel> resourceList = parser.parseResource(from);
		List<Document> documentList = null;
		if(resourceList.size() > 0){
			documentList = new ArrayList<Document>();
			for(Channel channel : resourceList){
				Member member = memberService.get(channel.getMemberId());
				Document doc = new Document();
				if(member == null) {
					Field idField = new Field("id",""+channel.getId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
					doc.add(idField);
					documentList.add(doc);
					continue;
				}
				
				log.info("id() ==> "+channel.getId());
				Field idField = new Field("id",""+channel.getId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field titleField = new Field("title",channel.getName(),Field.Store.YES,Field.Index.TOKENIZED);
				Field memberIdField = new Field("memberId",""+channel.getMemberId(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field authorField = new Field("author",""+member.getUserName(),Field.Store.YES,Field.Index.TOKENIZED);
				Field contentField = new Field("content",Convert.getText(channel.getDescription()),Field.Store.YES,Field.Index.TOKENIZED);
				Field statusField = new Field("status",""+channel.getState(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field createDateField = new Field("createDate",""+channel.getCreateDate(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field supportCountField = new Field("supportCount",""+channel.getSupportCount(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field unSupportCountField = new Field("unSupportCount",""+channel.getUnSupportCount(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field typeField = new Field("type","channel",Field.Store.YES,Field.Index.UN_TOKENIZED);
				Field articleNumberField = new Field("articleNumber",""+channel.getArticleNums(),Field.Store.YES,Field.Index.UN_TOKENIZED);
				
				
				doc.add(idField);
				doc.add(titleField);
				doc.add(memberIdField);
				doc.add(authorField);
				doc.add(contentField);
				doc.add(statusField);
				doc.add(createDateField);
				doc.add(supportCountField);
				doc.add(unSupportCountField);
				doc.add(typeField);
				doc.add(articleNumberField);
				doc.setBoost(IndexHelper.setBoost(channel.getId()));
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
					lastIndexedRecord = doc.get("id");
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

	public void setParser(ChannelResourceParse parser) {
		this.parser = parser;
	}
}
