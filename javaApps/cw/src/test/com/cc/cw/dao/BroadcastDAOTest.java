package com.cc.cw.dao;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Broadcast;

public class BroadcastDAOTest extends BaseTest {
	BroadcastDAO dao = null;
	
	@BeforeTest
	public void setup(){
		dao = (BroadcastDAO)ctx.getBean("broadcastDAO");
	}
	
	@AfterTest
	public void tearDown(){
		
	}
	
	@Test
	public void testAdd(){
		Broadcast b = new Broadcast();
		b.setArticleTitle("test");
		b.setFlag(1);
		b.setArticleId(1);
		b.setMemberId(1);
		b.setMemberName("test");
		b.setSort(1);
		dao.add(b);
	}
}
