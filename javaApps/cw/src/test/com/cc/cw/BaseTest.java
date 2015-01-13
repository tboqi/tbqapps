package com.cc.cw;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;


public class BaseTest {
	protected final Log log = LogFactory.getLog(getClass());
	protected ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml", 
    "dataAccessContext-local.xml","indexContext.xml" });
	
	@BeforeSuite
	public void setUpSuite(){
		log.info("********************************");
		PropertyConfigurator.configure( "log4j-ibatis.properties" );
	}
	
	@AfterSuite
	public void tearDownSuite(){
		log.info("********************************");
	}
}
