package com.yuqi.blog.dao;

import java.util.Iterator;
import java.util.List;

import junit.framework.Assert;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.yuqi.blog.domain.Category;

public class CategoryDaoTest {
	private final LocalServiceTestHelper helper = new LocalServiceTestHelper(
			new LocalDatastoreServiceTestConfig());
	private CategoryDao dao;

	@Before
	public void setUp() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/config/spring-*.xml");
		setDao((CategoryDao) context.getBean("categoryDao"));
		helper.setUp();
	}

	@After
	public void tearDown() {
		helper.tearDown();
	}

	@Test
	public void testCRUD() {
		Category o1 = new Category("c1", 0);
		dao.save(o1);
		Assert.assertEquals(new Long(1), o1.getId());

		Assert.assertEquals(1, dao.count());

		Category o2 = new Category("c2", 0);
		dao.save(o2);
		Assert.assertEquals(new Long(1), o1.getId());

		Assert.assertEquals(2, dao.count());

		List<Category> list = dao.find();
		for (Iterator<Category> iterator = list.iterator(); iterator.hasNext();) {
			Category category = (Category) iterator.next();
			Assert.assertTrue(category.getId().intValue() > 0);
		}
		Assert.assertEquals(list.size(), 2);

		dao.delete(new Long(2));
		Assert.assertEquals(1, dao.count());
	}

	public CategoryDao getDao() {
		return dao;
	}

	public void setDao(CategoryDao dao) {
		this.dao = dao;
	}

}
