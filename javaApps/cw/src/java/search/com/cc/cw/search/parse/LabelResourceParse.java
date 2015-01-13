package com.cc.cw.search.parse;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.service.LabelService;

public class LabelResourceParse extends ResourceParseImpl {

	private LabelService service = null;
	
	public LabelResourceParse() {
		
	}
	public void setService(LabelService service) {
		this.service = service;
	}

	public String getPath(){
		return FILEPATH+"cwLabelIndexedRecord.txt";
	}

	public boolean haveNewResource(String id) {
		if(id != null && !(id.equals(""))){
			return service.havaNewLabels(Integer.parseInt(id));
		}
		return false;
	}

	public List parseResource(String from) {
		try{
			if(from != null && !(from.equals(""))){
				return service.getNewLabels(Integer.parseInt(from));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	

	public static void main(String[] args) {
		final Log log = LogFactory.getLog(LabelResourceParse.class);
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml","dataAccessContext-local.xml","indexContext.xml" });
		LabelResourceParse parse = (LabelResourceParse)ctx.getBean("labelParser");
		
//		log.info("haveNewResource --> "+parse.haveNewResource("20"));
		log.info("path --> "+parse.getPath());
	}
}
