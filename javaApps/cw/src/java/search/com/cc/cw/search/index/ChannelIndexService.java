package com.cc.cw.search.index;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.search.parse.ChannelResourceParse;

public class ChannelIndexService extends IndexServiceImpl {

	ChannelResourceParse parser = null;
	IndexManager manager = null;
	
	public void deleteIndex(String key, String value) {
		// TODO Auto-generated method stub

	}

	public boolean index() {
		String lastIndexId = parser.getLastIndexedId();
		log.info("lastIndexId == "+lastIndexId);
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

	public void setParser(ChannelResourceParse parser) {
		this.parser = parser;
	}
	
	public static void main(String[] args) {

		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml","dataAccessContext-local.xml","indexContext.xml" });
		ChannelIndexService service = (ChannelIndexService)ctx.getBean("channelIndexService");
		service.index();
	}
}
