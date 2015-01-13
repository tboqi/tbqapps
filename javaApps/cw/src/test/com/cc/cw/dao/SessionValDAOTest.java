package com.cc.cw.dao;


import java.util.Date;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.SessionVal;


public class SessionValDAOTest extends BaseTest{
	
	SessionValDAO dao = null;
	@BeforeTest
	public void setup(){
		dao = (SessionValDAO)ctx.getBean("sessionValDAO");
		Assert.assertNotNull(dao);
	}
	
	@AfterTest
	public void tearDown(){
		
	}

	@Test
	public void testAdd(){
		SessionVal item = new SessionVal();
		String hostId = "" + (new Date()).getTime();
		String fromIP = "127.0.0.1";
		item.setHostId(hostId);
		item.setFromIP(fromIP);
		item.setFirstVisitTime(new Date().getTime()+"");
		item.setLastVisitTime(new Date().getTime()+"");
		dao.add(item);
	}
	
	//@Test
	public void testGet(){
		int maxId = dao.getMaxId();
		SessionVal item = dao.get(maxId);
		System.out.println(item.toString());
	}
	
	@Test
	public void testDel(){
		int maxId = dao.getMaxId();
		dao.del(maxId);
	}
}
