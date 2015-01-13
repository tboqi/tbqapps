package com.cc.cw.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.ClickLog;

public class ClickLogDAOTest extends BaseTest{

	private ClickLogDAO dao;
	private String uuid = "uuid";
	private int articleId = 101;
	private String tableName = "";
	
	@BeforeTest
	public void setup(){
		dao = (ClickLogDAO)ctx.getBean("clickLogDAO");
		Assert.assertNotNull(dao);
	}
	
	@Test(dependsOnMethods={"testGetCurrentTable"})
	public void testAdd(){
		ClickLog log = new ClickLog();
		log.setUuid(uuid);
		log.setArticleId(articleId);
		log.setChannelId(1);
		log.setTags("tags");
		log.setKeyword("keyword");
		log.setCategory("category");
		log.setClickTime(new Date());
		
		Assert.assertNotSame(0, dao.add(log));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testCountSameRecord(){
		Assert.assertNotSame(0, dao.countSameRecord(uuid, articleId));
	}

	
	@Test 
	public void testGetCurrentTable(){
		tableName = "clicklog";
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
		String now = sf.format(date);
		String currentTableName = tableName + "_" + now;
		tableName = dao.getCurrentTableTest();
		
		Assert.assertEquals(currentTableName, tableName);
	}
	
	@Test(dependsOnMethods={"testCountSameRecord"})
	public void testUpdateClickTime(){
		Assert.assertEquals(1,dao.updateClickTime(uuid, articleId, new Date()));
	}
	
	@Test(dependsOnMethods={"testCountSameRecord"})
	public void testUpdateUUID(){
		Assert.assertEquals(true,dao.updateUUID("new uuid", uuid));
	}
}
