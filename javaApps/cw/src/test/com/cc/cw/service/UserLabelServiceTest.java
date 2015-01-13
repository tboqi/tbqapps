package com.cc.cw.service;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;

public class UserLabelServiceTest extends BaseTest{
	
	UserLabelService us;
	
	@BeforeTest
	public void setup(){
		us = (UserLabelService)ctx.getBean("userLabelService");
		Assert.assertNotNull(us);
	}
	
//	@Test
//	public void testGetCount(){
//		String uuid = "2f2fb3ccada3448cafe0810523343826";
//		System.out.println("count --> " + us.getFavoriteLabelArticlesCount(uuid, 5));
//		
//		List<SimpleArticle> ls = us.getFavoriteLabelArticles(uuid, 5, 1, 10);
//		for(SimpleArticle sa : ls){
//			System.out.println(sa.getTitle());
//		}
//		
//	}
	
	@Test
	public void testgetFavoriteLabelArticles(){
		
		log.info("result == "+us.getFavoriteLabelArticles("adfc2e40c71d4afd882582167fb1a767",5,0,5,1000022).size());
		
	}
}
