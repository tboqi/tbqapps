package com.cc.cw.dao;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;

public class LabelDAOTest extends BaseTest {
	LabelDAO dao = null;
	
	@BeforeTest
	public void setup(){
		dao = (LabelDAO)ctx.getBean("labelDAO");
		Assert.assertNotNull(dao);
	}
	
	@AfterTest
	public void tearDown(){
	}
	
	@Test
	public void testGetAllLabels(){
		System.out.println("-------------all "+dao.getAllLabels().size());
	}
	
	@Test
	public void testGetNewLabels(){
		System.out.println("--------------new  "+ dao.getNewLabels(1).size());
	}
	
	@Test
	public void testCountNewLabels(){
		System.out.println("--------------count "+ dao.countNewLabels(1));
	}
}
