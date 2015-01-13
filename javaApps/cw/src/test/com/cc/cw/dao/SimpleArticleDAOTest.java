package com.cc.cw.dao;

import java.util.Date;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.SimpleArticle;

public class SimpleArticleDAOTest extends BaseTest {

	SimpleArticleDAO dao = null;
	int id ;
	int mId = 1;
	@BeforeTest
	public void setup() {
		dao = (SimpleArticleDAO) ctx.getBean("simpleArticleDAO");
	}
	
	@AfterTest
	public void tearDown() {

	}
	
	private int add(){
		SimpleArticle sa = new SimpleArticle();
		sa.setChannelId(0);
		sa.setContent("content");
		sa.setCreateDate(new Date());
		sa.setMemberId(mId);
		sa.setTitle("title");
		id = dao.add(sa);
		return id;
	}
	
//	@Test
	public void testAddGet(){
		int id = add();
		Assert.assertNotNull(dao.getById(id));
	}
	
//	@Test(dependsOnMethods={"testAddGet"})
	public void testGetByMemberId(){
		List<SimpleArticle> list = dao.getByMemberId(mId);
		Assert.assertNotSame(0, list.size());
	}
	
//	@Test(dependsOnMethods={"testAddGet"})
	public void testUpdateResultType(){
		Assert.assertNotSame(0, dao.updateVoteResultType(id,5));
	}
//	@Test
	public void testSearch(){
		System.out.println(dao.search("刘德华", 0, 10).size());
	}
//	@Test
	public void testSearchCount(){
		System.out.println(dao.searchCount("刘德华"));
	}
	@Test
	public void testAutoInitiateVote(){
		dao.autoInitiateVote(11);
	}
}
