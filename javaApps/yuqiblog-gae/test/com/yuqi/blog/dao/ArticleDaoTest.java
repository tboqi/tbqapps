package com.yuqi.blog.dao;

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

public class ArticleDaoTest {
	private final LocalServiceTestHelper helper = new LocalServiceTestHelper(
			new LocalDatastoreServiceTestConfig());
	private ArticleDao articleDao;

	@Before
	public void setUp() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/config/spring-*.xml");
		articleDao = (ArticleDao) context.getBean("articleDao");
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
		a1.setCategoryId(0L);
		articleDao.save(a1);
		Assert.assertNotNull(a1.getId());

		Assert.assertEquals(1, articleDao.count());

		Assert.assertEquals(1, articleDao.countByCategoryId(0L));

		Article a2 = new Article();
		a2.setTitle("title2");
		a2.setContent(new Text("content2"));
		a2.setCreateTime(new Date());
		a2.setCategoryId(0L);
		a2 = articleDao.save(a2);
		Assert.assertNotNull(a1.getId());

		Assert.assertEquals(2, articleDao.count());

		Assert.assertEquals(2, articleDao.countByCategoryId(0L));

		Article a3 = articleDao.get(a1.getId());
		Assert.assertEquals(a3.getTitle(), a1.getTitle());

		a3.setTitle("title1-3");
		a3.setCategoryId(1L);
		articleDao.save(a3);
		Assert.assertEquals(a3.getId(), a1.getId());

		Assert.assertEquals(1, articleDao.countByCategoryId(1L));

		Assert.assertEquals(2, articleDao.count());

		List<Article> list = articleDao.find(1, 2);
		for (Iterator<Article> iterator = list.iterator(); iterator.hasNext();) {
			Article article = (Article) iterator.next();
			Assert.assertNotNull(article.getId());
		}
		Assert.assertEquals(list.size(), 2);

		list = articleDao.findByCategoryId(0L, 1, 2);
		for (Iterator<Article> iterator = list.iterator(); iterator.hasNext();) {
			Article article = (Article) iterator.next();
			Assert.assertNotNull(article.getId());
		}
		Assert.assertEquals(list.size(), 1);

		articleDao.delete(a3.getId());
		Assert.assertEquals(1, articleDao.count());
	}
}
