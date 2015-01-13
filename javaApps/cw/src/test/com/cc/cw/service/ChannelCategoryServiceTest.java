package com.cc.cw.service;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.ChannelCategory;

public class ChannelCategoryServiceTest extends BaseTest{
	ChannelCategoryService ccs;
	int id = 0;
	String content = "sunnys";
	
	@BeforeTest
	public void setup(){
		ccs = (ChannelCategoryService)ctx.getBean("channelCategoryService");
		Assert.assertNotNull(ccs);
		 
	}
	
	@AfterTest
	public void tearDown(){
		Assert.assertTrue(ccs.delete(id));
	}
	
	@Test
	public void testAdd(){
		ChannelCategory cc = new ChannelCategory();
		cc.setContent(content);
		id = ccs.add(cc);
		Assert.assertNotSame(0, id);
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testExist(){
		Assert.assertTrue(ccs.exist(content));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetById(){
		Assert.assertNotNull(ccs.getById(id));
	}
    
	@Test(dependsOnMethods={"testAdd"})
	public void testUpdateContent(){
		Assert.assertTrue(ccs.updateContent(content, "coco"));
	}
}
