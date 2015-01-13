package com.cc.cw.service;

import java.util.Date;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.RemarkArticle;

public class RemarkArticleServiceTest extends BaseTest {

	RemarkArticleService service = null;
	
	@BeforeTest
	public void setup() {
		service = (RemarkArticleService) ctx.getBean("remarkArticleService");
		Assert.assertNotNull(service);
	}

	@AfterTest
	public void tearDown() {

	}
	
//	@Test
	public void testAdd(){
		RemarkArticle ra = new RemarkArticle();
		ra.setArticleId(1);
		ra.setContent("test");
		ra.setCreateDate(new Date());
		ra.setMemberId(1);
		ra.setTitle("title");
		int id = 0;
		id = service.add(ra);
		Assert.assertNotSame(0,id);
		Assert.assertTrue(service.delete(id));
	}
	
	@Test
	public void testGetById(){
		log.info("-------- "+service.getById(58).getTitle());
	}
	
//	@Test
	public void testGetAll(){
		List list = service.getAll();
		System.out.println("---------------- "+list.size());
	}
	
//	@Test
	public void testGetAllFromID(){
		List list = service.getNewFromId(2);
		System.out.println("---- "+list.size());
	}
	
//	@Test
	public void testGetRemarkByMemberId(){
		System.out.println("---------------- "+service.getRemarksByMemberIdEx(1000013, 1, 10).size());
	}
	
}
