package com.yuqi.blog.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import junit.framework.Assert;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.appengine.api.datastore.Text;
import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.yuqi.blog.domain.Article;

public class ArticleServiceTest {
	private ArticleService articleService;
	private final LocalServiceTestHelper helper =
        new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());
	@Before
	public void setUp() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/config/spring-*.xml");
		articleService = (ArticleService) context.getBean("articleService");
		helper.setUp();
	}

	@After
	public void tearDown() {
		helper.tearDown();
	}

	@Test
	public void testCRUD() {
		Article a1 = new Article();
		a1.setTitle("title1");
		a1.setContent(new Text("content1"));
		a1.setCreateTime(new Date());
		a1 = articleService.save(a1);
		Assert.assertEquals(new Long(1), a1.getId());

		Assert.assertEquals(1, articleService.count());

		Article a2 = new Article();
		a2.setTitle("title2");
		a2.setContent(new Text("content2"));
		a2.setCreateTime(new Date());
		a2 = articleService.save(a2);
		Assert.assertEquals(new Long(2), a2.getId());

		Assert.assertEquals(2, articleService.count());

		Article a3 = articleService.get(new Long(1));
		Assert.assertEquals(a3.getTitle(), a1.getTitle());

		a3.setTitle("title1-3");
		a3 = articleService.save(a3);
		Assert.assertEquals(a3.getId(), a1.getId());

		Assert.assertEquals(2, articleService.count());

		List<Article> list = articleService.find(1, 2);
		for (Iterator<Article> iterator = list.iterator(); iterator.hasNext();) {
			Article article = (Article) iterator.next();
			Assert.assertTrue(article.getId().intValue() > 0);
		}
		Assert.assertEquals(list.size(), 2);

		articleService.delete(new Long(2));
		Assert.assertEquals(1, articleService.count());
	}
}
