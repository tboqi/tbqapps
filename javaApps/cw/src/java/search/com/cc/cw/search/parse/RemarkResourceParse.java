package com.cc.cw.search.parse;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.service.RemarkArticleService;

public class RemarkResourceParse extends ResourceParseImpl {
	private RemarkArticleService service = null;

	public String getPath(){
		return FILEPATH+"remarkIndexedRecord.txt";
	}

	public boolean haveNewResource(String id) {
		if(id != null && !(id.equals(""))){
			return service.haveNewResource(Integer.parseInt(id));
		}
		return false;
	}

	public List parseResource(String from) {
		try{
			if(from != null && !(from.equals(""))){
				return service.getNewFromId(Integer.parseInt(from));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public void setService(RemarkArticleService service) {
		this.service = service;
	}

	public static void main(String[] args) {
		final Log log = LogFactory.getLog(RemarkResourceParse.class);
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml","dataAccessContext-local.xml","indexContext.xml" });
		RemarkResourceParse parse = (RemarkResourceParse)ctx.getBean("remarkParser");
		
		log.info("haveNewResource --> "+parse.haveNewResource("20"));
	}
}
