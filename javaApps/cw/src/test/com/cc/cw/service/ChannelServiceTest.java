package com.cc.cw.service;

import java.util.Date;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.SimpleArticle;

public class ChannelServiceTest extends BaseTest {

	private ChannelService cs;
	private SimpleArticleService as;
	int channelId = 0;
	int articleId = 0;
	int memberId = 101;
	
	@BeforeTest
	public void setup(){
		cs = (ChannelService)ctx.getBean("channelService");
		as = (SimpleArticleService)ctx.getBean("simpleArticleService");
		Assert.assertNotNull(cs);
		Assert.assertNotNull(as);


	}
	@AfterTest
	public void tearDown(){
		Assert.assertTrue(cs.delete(channelId));
		Assert.assertTrue(as.delete(channelId));
		Assert.assertTrue(as.deleteCollectionArticle(articleId, channelId));
	}
	
	@Test
	public void testAdd(){
		Channel c = new Channel();
		c.setCreateDate(new Date());
		c.setName("test");
		c.setMemberId(memberId);
		c.setKeywords("keywords");
		c.setDescription("Description");
		channelId = cs.add(c);
		Assert.assertNotSame(0, channelId);
		
		SimpleArticle a = new SimpleArticle();
		a.setTitle("forchanneltest");
		a.setContent("forchanneltest");
		a.setMemberId(memberId);
		a.setChannelId(channelId);
		a.setEndDate(null);
		a.setRate(101);
		a.setPublishType(SimpleArticle.STATE_OPEN);
		
		articleId = as.add(a);
		Assert.assertNotSame(0, as.add(a));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testAddReferenceToChannel(){
		Assert.assertTrue(cs.addReferenceToChannel(articleId, channelId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testAddToChannel(){
		Assert.assertTrue(cs.addToChannel(articleId, channelId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetAllChannels(){
		Assert.assertNotSame(0, cs.getAllChannels().size());
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetById(){
		Assert.assertNotNull(cs.getById(channelId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetByMemberId(){
		List<Channel> list = cs.getByMemberId(0, 10, memberId);
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testGetChannelCountByState"})
	public void testGetChannelCount(){
		Assert.assertNotSame(0, cs.getChannelCount(1));
	}
	
	@Test(dependsOnMethods={"testGetChannelCountByState"})
	public void testGetChannelCountByMemberId(){
		Assert.assertNotSame(0, cs.getChannelCountByMemberId(memberId, 1));
	}
	
	@Test(dependsOnMethods={"testUpdate"})
	public void testGetChannelCountByState(){
		Assert.assertNotSame(0, cs.getChannelCountByState(1));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetChannels(){
		List<Channel> list = cs.getChannels(1, 10);
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testGetCountByMemberId"})
	public void testGetChannelsByMemberId(){
		List<Channel> list = cs.getChannelsByMemberId(memberId, 1, 0, 10);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testGetChannelCount"})
	public void testGetChannelsByStateOrderByDate(){
		List<Channel> list = cs.getChannelsByStateOrderByDate(0, 10, 1);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testAdd"})
	public void testGetCountByMemberId(){
		Assert.assertNotSame(0, cs.getCountByMemberId(memberId));
	}

	@Test(dependsOnMethods={"testGetHotChannelsCount"})
	public void testGetHotChannels(){
		List<Channel> list = cs.getHotChannels(0, 10);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testGetHotChannelsCount"})
	public void testGetHotChannels2(){
		List<Channel> list = cs.getHotChannels(0, 10, "111");
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetHotChannelsCount(){
		Assert.assertNotSame(0, cs.getHotChannelsCount());
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetNewChannels(){
		List<Channel> list = cs.getNewChannels(0);
		Assert.assertNotSame(0, list.size());
	}
	
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetNewChannelsOrderByDate(){
		List<Channel> list = cs.getNewChannelsOrderByDate(10);
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testHavaNewChannel(){
		Assert.assertTrue(cs.havaNewChannel(0));
	}

	@Test(dependsOnMethods={"testAddReferenceToChannel"})
	public void testHaveThisReference(){
		Assert.assertNotSame(0, cs.haveThisReference(articleId, memberId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testUpdate(){
		Channel c = cs.getById(channelId);
		c.setName("update");
		c.setState(1);
		Assert.assertTrue(cs.update(c));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testUpdateVoteCount(){
		Assert.assertTrue(cs.updateVoteCount(channelId, "Support"));
	}
}
