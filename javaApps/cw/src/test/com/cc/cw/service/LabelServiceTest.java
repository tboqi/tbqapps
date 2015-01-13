package com.cc.cw.service;

import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;

public class LabelServiceTest extends BaseTest {
	
	private LabelService ls = null;
	
	@BeforeTest
	public void setup(){
		ls = (LabelService)ctx.getBean("labelService");
		Assert.assertNotNull(ls);
	}
	
	@AfterTest
	public void tearDown(){
	}
	
//	@Test
//	public void testGetAllLabels(){
//		System.out.println("----------all "+ cs.getAllLabels().size());
//	}
//	
//	@Test
//	public void testHaveNewLabels(){
//		System.out.println("-----------haveNewLabels "+cs.havaNewLabels(4));
//	}
//	
//	@Test
//	public void testGetNewLabels(){
//		System.out.println("------------new "+cs.getNewLabels(2).size());
//	}
	@Test
	public void testGetByArticleId(){
		List<String> list = ls.getContentByArticleId(1);
		for(String s : list)
			System.out.println(s);
		List<String> list1 = ls.getContentByArticleIdMemberId(1, 1);
		for(String ss : list1)
			System.out.println(ss);
	}
}
