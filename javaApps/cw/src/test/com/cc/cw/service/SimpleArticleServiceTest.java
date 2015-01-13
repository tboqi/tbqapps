package com.cc.cw.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.util.Convert;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.util.HtmlConvert;

public class SimpleArticleServiceTest extends BaseTest {

	SimpleArticleService service = null;
	
	@BeforeTest
	public void setup() {
		service = (SimpleArticleService) ctx.getBean("simpleArticleService");
		Assert.assertNotNull(service);
	}

	@AfterTest
	public void tearDown() {

	}
	
//	@Test
	public void testAdd() {
		SimpleArticle a = new SimpleArticle();
		a.setContent("test");
		a.setCreateDate(new Date());
		a.setEndDate(new Date());
		a.setMemberId(1);
		a.setTitle("test");
		int id = 0;
		id = service.add(a);
		Assert.assertNotSame(0,id);
		service.delete(id);
	}
	
//	@Test
	public void getById(){
		SimpleArticle a = new SimpleArticle();
		a.setContent("test");
		a.setCreateDate(new Date());
		a.setEndDate(new Date());
		a.setMemberId(1);
		a.setTitle("test");
		int id = 0;
		id = service.add(a);
		Assert.assertNotNull(service.getById(id));
		service.delete(id);
	}
//	@Test
	public void testUpdate(){
		SimpleArticle a = new SimpleArticle();
		a.setContent("test");
		a.setCreateDate(new Date());
		a.setEndDate(new Date());
		a.setMemberId(1);
		a.setTitle("test");
		int id = 0;
		id = service.add(a);
		SimpleArticle a1 = service.getById(id);
		a1.setContent("ttttttttttt");
		Assert.assertTrue(service.update(a1));
		service.delete(id);
	}
	
//	@Test
	public void testIsEndDate(){
		try{
			int id1,id2;
			SimpleArticle a1 = new SimpleArticle();
			a1.setContent("test");
			a1.setCreateDate(new Date());
			a1.setEndDate(new Date(new Date().getTime() + 24*1000*60*60));
			a1.setMemberId(1);
			a1.setTitle("test");
			id1 = service.add(a1);
			SimpleArticle a2 = new SimpleArticle();
			a2.setContent("test");
			a2.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").parse("2007-03-06"));
			a2.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse("2007-03-07"));
			a2.setMemberId(1);
			a2.setTitle("test");
			id2 = service.add(a2);
			Assert.assertFalse(service.isEndDate(id1));//第一个没有到截止日期
			Assert.assertTrue(service.isEndDate(id2));//第二个到截止日期
			service.delete(id1);
			service.delete(id2);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testGetBySupportCount(){
		List list = service.getSupportCountArticles(1, 20);
		System.out.println("---------------- "+list.size());
	}
	
//	@Test
	public void testGetHot(){
		System.out.println(service.getHottestArticles(1, 20).size());
		System.out.println(service.getNewArticles(1, 20).size());
		System.out.println(service.getMonthHottestArticles(1, 20).size());
		System.out.println(service.getWeekHottestArticles(1, 20).size());
	}
	
//	@Test
	public void testGetAll(){
		List list = service.getAll();
		System.out.println("---------------- "+list.size());
	}
	
//	@Test
	public void testGetAllFromID(){
		List list = service.getNewFromId(13);
		System.out.println("---- "+list.size());
	}
	
//	@Test
	public void testGetArticleByMemberId(){
		System.out.println("---------------- "+service.getByMemberId(1000002).size());
	}
	
//	@Test
	public void testGetArticleTotalVote(){
		System.out.println("---------------- "+service.getArticlesTotalVoteById(11));
	}
	
//	@Test
	public void testGetNewArticle(){
//		System.out.println("---------------- "+service.getNewArticles(1, 15).size());
		System.out.println("----------------"+service.getNewFromId(23).size());
	}
	
//	@Test
	public void testConvert(){
			System.out.println(Convert.getText(service.getById(518).getContent()));
			System.out.println("...................");
			System.out.println("...................");
			System.out.println("...................");
			System.out.println(HtmlConvert.html2Text(service.getById(518).getContent()));
	}
//	@Test
	public void testAll(){
		service.getAll();
	}
	
//	@Test
	public void testGet(){
		log.info("getByEndDate == "+service.getByEndDate(29,DateTimeUtil.parseDateToString(new Date(),"yyyy-MM-dd"), 1, 10).size());
		log.info("getByEndDateCount == "+service.getByEndDateCount(29,DateTimeUtil.parseDateToString(new Date(),"yyyy-MM-dd")));
		log.info("endArticle == "+service.endArticle(118, 1, "0:0"));
	}
	
//	@Test
	public void testGetSupportUnSupportArticle(){
		
		List<SimpleArticle> l1 = service.getSupportArticles(1, 5);
		List<SimpleArticle> l2 = service.getUnsupportArticles(1, 5);
		for(SimpleArticle sa : l1){
			log.info("id" + sa.getId());
			log.info("support --> "+sa.getSupportCount()+" votes");
		}
		
		for(SimpleArticle sa : l2){
			log.info("id" + sa.getId());
			log.info("unsupport --> "+sa.getUnSupportCount()+" votes");
		}
	}
	
//	@Test
	public void testGetWeekArticle(){
		List list = service.getWeekHottestArticles(1, 10);
		log.info(list.size());
	}
	
//	@Test
	public void testbeginSecondVote(){
		boolean list = service.beginSecondVote(310, 1000022, new java.util.Date());
		log.info(list);
	}
	
//	@Test
	public void testLookforEndArticles(){
		List list = service.lookforShouldEndArticles(3);
		log.info(list.size());
	}
	
	@Test
	public void testreactiveArticle(){
		log.info("reactive === "+service.reactiveArticle(11));
	}
}
