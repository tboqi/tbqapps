package com.cc.cw.service;

import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Friend;
import com.cc.cw.exception.ServiceException;

public class FriendServiceTest extends BaseTest {
	FriendService service = null;
	@BeforeTest
	public void setup(){
		service = (FriendService)ctx.getBean("friendService");
		Assert.assertNotNull(service);
	}
	
//	@Test
	public void testAdd(){
		Friend f = new Friend();
		f.setMyId(1000022);
		f.setFriendId(1000007);
		f.setComment("请求加为好友！！！");
		int result = 0;
		try {
			result = service.apply(f);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		log.info("new id == "+result);
	}
	@Test
	public void testUpdate(){
		try {
			log.info(service.remove(3));
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
