package com.cc.cw.dao;

import java.util.Date;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.SimpleArticle;

public class ChannelDAOTset extends BaseTest {

	ChannelDAO dao = null;
	SimpleArticleDAO articleDao = null;
	int channelId = 0;
	int articleId = 0;
	int memberId = 101;
	
	@BeforeTest
	public void setup(){
		dao = (ChannelDAO)ctx.getBean("channelDAO");
		articleDao = (SimpleArticleDAO) ctx.getBean("simpleArticleDAO");
		Assert.assertNotNull(dao);
		Assert.assertNotNull(articleDao);
	}
	
	@AfterTest
	public void tearDown(){
		Assert.assertEquals(1, dao.remove(channelId));
		Assert.assertEquals(1, articleDao.delete(articleId));
		Assert.assertEquals(1, articleDao.deleteCollectionArticle(articleId, channelId));
	}
	@Test
	public void testAdd(){
		Channel c = new Channel();
		c.setCreateDate(new Date());
		c.setName("test");
		c.setMemberId(memberId);
		c.setKeywords("keywords");
		c.setDescription("Description");
		channelId = dao.add(c);
		Assert.assertNotSame(0, channelId);
		
		SimpleArticle a = new SimpleArticle();
		a.setTitle("forchanneltest");
		a.setContent("forchanneltest");
		a.setMemberId(memberId);
		a.setChannelId(channelId);
		a.setEndDate(null);
		a.setRate(101);
		a.setPublishType(SimpleArticle.STATE_OPEN);
		
		articleId = articleDao.add(a);
		Assert.assertNotSame(0, articleDao.add(a));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testAddReferenceToChannel(){
		Assert.assertTrue(dao.addReferenceToChannel(articleId, channelId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testAddToChannel(){
		Assert.assertTrue(dao.addToChannel(articleId, channelId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetAllChannels(){
		List<Channel> list = dao.getAllChannels();
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetById(){
		Assert.assertNotNull(dao.getById(channelId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetByMemberId(){
		List<Channel> list = dao.getByMemberId(0, 10, memberId);
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testGetChannelCountByState"})
	public void testGetChannelCount(){
		Assert.assertNotSame(0, dao.getChannelCount(1));
	}
	
	@Test(dependsOnMethods={"testGetChannelCountByState"})
	public void testGetChannelCountByMemberId(){
		Assert.assertNotSame(0, dao.getChannelCountByMemberId(memberId, 1));
	}
	
	@Test(dependsOnMethods={"testUpdate"})
	public void testGetChannelCountByState(){
		Assert.assertNotSame(0, dao.getChannelCountByState(1));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetChannels(){
		List<Channel> list = dao.getChannels(1, 10);
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testGetCountByMemberId"})
	public void testGetChannelsByMemberId(){
		List<Channel> list = dao.getChannelsByMemberId(memberId, 1, 0, 10);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testGetChannelCount"})
	public void testGetChannelsByStateOrderByDate(){
		List<Channel> list = dao.getChannelsByStateOrderByDate(0, 10, 1);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testAdd"})
	public void testGetCountByMemberId(){
		Assert.assertNotSame(0, dao.getCountByMemberId(memberId));
	}

	@Test(dependsOnMethods={"testGetHotChannelsCount"})
	public void testGetHotChannels(){
		List<Channel> list = dao.getHotChannels(0, 10);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testGetHotChannelsCount"})
	public void testGetHotChannels2(){
		List<Channel> list = dao.getHotChannels(0, 10, "111");
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetHotChannelsCount(){
		Assert.assertNotSame(0, dao.getHotChannelsCount());
	}
	
	@Test(dependsOnMethods={"testGetNewChannelsCount"})
	public void testGetNewChannels(){
		List<Channel> list = dao.getNewChannels(0);
		Assert.assertNotSame(0, list.size());
	}
	
	@Test(dependsOnMethods={"testGetChannelCount"})
	public void testGetNewChannelsCount(){
		int count = dao.getNewChannelsCount(0);
		Assert.assertNotSame(0, count);
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testGetNewChannelsOrderByDate(){
		List<Channel> list = dao.getNewChannelsOrderByDate(10);
		Assert.assertNotSame(0, list.size());
	}

	@Test(dependsOnMethods={"testAddReferenceToChannel"})
	public void testHaveThisReference(){
		Assert.assertNotSame(0, dao.haveThisReference(articleId, memberId));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testUpdate(){
		Channel c = dao.getById(channelId);
		c.setName("update");
		c.setState(1);
		Assert.assertEquals(1, dao.update(c));
	}
	
	@Test(dependsOnMethods={"testAdd"})
	public void testUpdateVoteCount(){
		Assert.assertEquals(1, dao.updateVoteCount(channelId, "Support"));
	}
}
