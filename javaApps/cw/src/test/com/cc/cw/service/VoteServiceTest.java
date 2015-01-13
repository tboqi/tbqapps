package com.cc.cw.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Channel;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.Vote;

public class VoteServiceTest extends BaseTest {

	VoteService vs = null;
	ChannelService cs = null;
	SimpleArticleService ss = null;

	@BeforeTest
	public void setup() {
		vs = (VoteService) ctx.getBean("voteService");
		cs = (ChannelService) ctx.getBean("channelService");
		ss = (SimpleArticleService) ctx.getBean("simpleArticleService");
//		int sid, cid, v1id, v2id;
//		// 插入一条文章数据
//
//		sid = addArticle();
//		Assert.assertNotSame(0, sid);
//
//		// 插入一条频道数据
//
//		cid = addChannel();
//		Assert.assertNotSame(0, cid);
//
//		Vote v1 = new Vote();
//		v1.setMemberId(2);
//		v1.setResourceId(cid);
//		v1.setResourceType(Vote.ResourceType.Channel);
//		v1.setVoteCategory(Vote.VoteCategory.Support);
//		v1.setVoteDate(new Date());
//		v1.setVoteNumber(1);
//		Assert.assertNotSame(0, v1id = vs.vote(v1));
//
//		Vote v2 = new Vote();
//		v2.setMemberId(2);
//		v2.setResourceId(sid);
//		v2.setResourceType(Vote.ResourceType.Article);
//		v2.setVoteCategory(Vote.VoteCategory.UnSupport);
//		v2.setVoteDate(new Date());
//		v2.setVoteNumber(1);
//		Assert.assertNotSame(0, v2id = vs.vote(v2));
//
//		Assert.assertTrue(vs.delete(v1id));
//		Assert.assertTrue(vs.delete(v2id));
//		Assert.assertTrue(cs.delete(cid));
//		Assert.assertTrue(ss.delete(sid));

	}

	public int addArticle() {
		SimpleArticle a = new SimpleArticle();
		a.setContent("test");
		a.setCreateDate(new Date());
		a.setEndDate(new Date());
		a.setMemberId(1);
		a.setTitle("test");
		int sid = ss.add(a);
		Assert.assertNotSame(0, sid);
		return sid;
	}

	public int addChannel() {
		Channel c = new Channel();
		c.setCreateDate(new Date());
		c.setMemberId(1);
		c.setName("test");
		c.setState(1);
		int cid = cs.add(c);
		Assert.assertNotSame(0, cid);
		return cid;
	}

	@AfterTest
	public void tearDown() {

	}

//	@Test
	public void testGetVoteListByDate() {
		try {
			int rid = addArticle();
			@SuppressWarnings("unused")
			int id1 = 0;
			@SuppressWarnings("unused")
			int id2 = 0;
			Vote v = new Vote();
			v.setMemberId(1);
			v.setResourceId(rid);
			v.setResourceType("Article");
			v.setVoteCategory("Support");
			v.setVoteNumber(1);
			v.setVoteDate(new SimpleDateFormat("yyyy-MM-dd")
					.parse("2007-06-06"));
			id1 = vs.vote(v);
			v.setMemberId(2);
			v.setVoteDate(new SimpleDateFormat("yyyy-MM-dd")
					.parse("2007-08-07"));
			id2 = vs.vote(v);

			List<Vote> list = vs.getVoteListByDate(2,
					"Article", "2007-06-05", "2007-08-08");
			Assert.assertSame(2, list.size());

//			vs.delete(id1);
//			vs.delete(id2);
//			ss.delete(rid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testVoteFinishProcess(){
		vs.voteFinishProcess();
	}
	
//	@Test
	public void testIsAlreadyVoted(){
		System.out.println("-------------"+vs.isAlreadyVoted(1000004, 11, "Article"));
	}

//	@Test
	public void test(){
		System.out.println("----------"+vs.getVoteListByDate(1, "Article", "2007-04-24 19:13:09", "2007-04-26 19:13:09").size());
	}
//	@Test
	public void testGetAllCountByArticleId(){
		log.info("testGetAllCountByArticleId == "+vs.getAllCountByArticle(11));
		log.info("getArticleSupportVoteCount == "+vs.getArticleSupportVoteCount(11));
		log.info("getArticleUnSupportVoteCount == "+vs.getArticleUnSupportVoteCount(11));
	}
//	@Test
	public void testGetByArticleId(){
		log.info("size == "+vs.getByArticleId(11).size());
	}

	@Test
	public void testhandleInterminateVoteProcess(){
		vs.handleInterminateVoteProcess();
	}
	
}
