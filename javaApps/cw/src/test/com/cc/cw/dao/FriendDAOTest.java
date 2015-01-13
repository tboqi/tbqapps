package com.cc.cw.dao;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Friend;

public class FriendDAOTest extends BaseTest {

	FriendDAO dao = null;
	@BeforeTest
	public void setup(){
		dao = (FriendDAO)ctx.getBean("friendDAO");
		Assert.assertNotNull(dao);
	}
	
	@AfterTest
	public void tearDown(){
		
	}
	
//	@Test
	public void testAdd(){
		Friend f = new Friend();
		f.setMyId(1000022);
		f.setFriendId(1000007);
		f.setComment("请求加为好友！！！");
		
		log.info("new id == "+dao.add(f,0));
	}
	
//	@Test
	public void testUpdateState(){
		log.info("update record "+dao.updateState(1, 1));
	}
	
//	@Test
	public void getGivenStateFriends(){
		log.info("count === "+dao.getGivenStateCount(1000022, 1));
		log.info("friends ----"+dao.getGivenStateFriends(1000022, 1, 1, 10).size());
	}
//	@Test
	public void testGetALlFriends(){
		log.info("count all == "+dao.getAllCount(1000022));
		log.info("friends all -------"+dao.getAllFriends(1000022, 1, 10).size());
	}
	@Test
	public void test(){
		log.info("state == "+((Friend)dao.showFriend(1000022, 1000007)).getState());
	}
}
