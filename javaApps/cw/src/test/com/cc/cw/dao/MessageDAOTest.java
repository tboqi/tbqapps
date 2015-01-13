package com.cc.cw.dao;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Message;

public class MessageDAOTest extends BaseTest {

	MessageDAO dao = null;
	int id;
	@BeforeTest
	public void setup(){
		dao = (MessageDAO)ctx.getBean("messageDAO");
		Assert.assertNotNull(dao);
	}
	
	@AfterTest
	public void tearDown(){
		Assert.assertNotSame(0, dao.delete(id));
	}
	
	public int add(){
		Message msg = new Message();
		msg.setContent("msg test");
		msg.setMsgType(1);
		msg.setReceiveId(10000017);
		msg.setSenderId(10000013);
		msg.setState(0);
		msg.setTitle("first msg test!!!");
		return dao.add(msg);
	}
	
	@Test
	public void testAddGet(){
		id = add();
		Assert.assertNotNull(dao.get(id));
	}
	
	@Test(dependsOnMethods={"testAddGet"})
	public void testUpdateState(){
		Assert.assertNotSame(0, dao.updateState(id, 1));
	}
	
}
