package com.cc.cw.search.index;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.search.parse.ArticleResourceParse;

public class ArticleIndexService extends IndexServiceImpl {

	ArticleResourceParse parser = null;
	IndexManager manager = null;

	

	public void deleteIndex(String key, String value) {
		// TODO Auto-generated method stub
		
	}

	public boolean index() {
		String lastIndexId = parser.getLastIndexedId();
		boolean ifIndex = parser.haveNewResource(lastIndexId);
		if(ifIndex){
			manager.createIndexDB();
			return true;
		}else{
			return true;
		}
	}

	public void removeIndexDB() {
		manager.removeIndexDB();
	}
	
	public boolean deleteOldIndex() {
		return manager.deleteOldIndex();
	}

	public void setManager(IndexManager manager) {
		this.manager = manager;
	}

	public void setParser(ArticleResourceParse parser) {
		this.parser = parser;
	}
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml","dataAccessContext-local.xml","indexContext.xml" });
		ArticleIndexService service = (ArticleIndexService)ctx.getBean("articleIndexService");
		service.index();
	}
}
