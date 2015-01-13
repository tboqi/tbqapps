package com.cc.cw.service;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Message;

public class MessageServiceTest extends BaseTest {

	private MessageService ms = null;
	
	@BeforeTest
	public void setup(){
		ms = (MessageService)ctx.getBean("messageService");
		System.out.println("ms --------------- "+ms);
		Assert.assertNotNull(ms);
		
	}
	
	@AfterTest
	public void tearDown(){
	}
	
//	@Test
	public void addMsg(){
		Message msg = new Message();
		msg.setContent("msg test");
		msg.setMsgType(1);
		msg.setReceiveId(1000017);
		msg.setSenderId(1000009);
		msg.setState(0);
		msg.setTitle("first msg test!!!");
		System.out.println("new msg id ============= "+ms.add(msg));
	}
	
//	@Test
	public void testGetByMemberId(){
		System.out.println("all----------------------"+ms.getAllMessages(1000017, 1, 10).size());
		System.out.println("readed----------------------"+ms.getReadedMessage(1000017, 1, 10).size());
		System.out.println("unreaded----------------------"+ms.getUnReadedMessage(1000017, 1, 10).size());
	}
	
//	@Test
	public void testUpdateState(){
		System.out.println("----------------------"+ms.updateState(1, 1));
	}
	
//	@Test
	public void testGet(){
		System.out.println("----------------------"+ms.get(2).getTitle());
	}
}
