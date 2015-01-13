package com.cc.cw.service;

import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.AtomLabel;

public class AtomLabelServiceTest extends BaseTest{
	
	private AtomLabelService as;
	
	@BeforeTest
	public void setup(){
		as = (AtomLabelService)ctx.getBean("atomLabelService");
	}
	
	@AfterTest
	public void tearDown(){
		
	}
	
//	@Test
	public void testAdd(){
		AtomLabel a = new AtomLabel();
		a.setContent("test");
		a.setProviderId(1);
//		int id1 = as.add(a);
		a.setProviderId(2);
//		int id2 = as.add(a);
//		as.delete(id1);
//		as.delete(id2);
	}
	
//	@Test
	public void testGetHotAtomLabel(){
		List<AtomLabel> list = as.getHotAtomLabel(1, 2);
		System.out.println(list.size());
		log.info(as.getHotAtomLabelCount());
		
	}
	
	@Test
	public void testIncreaseCount(){
		boolean boo = as.increaseCountByContent("八卦", 1);
		Assert.assertTrue(boo);
	}

}
