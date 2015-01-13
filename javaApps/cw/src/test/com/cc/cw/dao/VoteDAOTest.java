package com.cc.cw.dao;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Vote;

public class VoteDAOTest extends BaseTest {
	
	VoteDAO dao = null;
	SimpleArticleDAO articleDao = null;
	ChannelDAO chDao = null;
	
	@BeforeTest
	public void setup(){
		dao = (VoteDAO)ctx.getBean("voteDAO");
		Assert.assertNotNull(dao);
		
//		Vote v = new Vote();
//		v.setMemberId(1);
//		v.setResourceId(1);
//		v.setResourceType(Vote.ResourceType.Article);
//		v.setVoteCategory(Vote.VoteCategory.Support);
//		v.setVoteDate(new Date());
//		int i = dao.add(v);
//		log.info("id is ----------------> " + i);
		
	}

	@AfterTest
	public void tearDown(){
	}
	
//	@Test
	public void testGetById(){
		Vote v = dao.get(1);
		Assert.assertNotNull(v);
	}
	
	@Test
	public void testIsExist(){
		dao.vote_proc();
	}
}
