package com.yuqi.blog.service;

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

public class CategoryServiceTest {
	private CategoryService categoryService;
	private final LocalServiceTestHelper helper = new LocalServiceTestHelper(
			new LocalDatastoreServiceTestConfig());

	@Before
	public void setUp() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/config/spring-*.xml");
		categoryService = (CategoryService) context.getBean("categoryService");
		helper.setUp();
	}

	@After
	public void tearDown() {
		helper.tearDown();
	}

	@Test
	public void testCRUD() {
		Category o1 = new Category("o1", 0);
		categoryService.save(o1);
		Assert.assertEquals(new Long(1), o1.getId());

		Assert.assertEquals(1, categoryService.count());

		Category o2 = new Category("o2", 0);
		o2 = categoryService.save(o2);
		Assert.assertEquals(new Long(2), o2.getId());

		Assert.assertEquals(2, categoryService.count());

		List<Category> list = categoryService.find();
		for (Iterator<Category> iterator = list.iterator(); iterator.hasNext();) {
			Category category = (Category) iterator.next();
			Assert.assertTrue(category.getId().intValue() > 0);
		}
		Assert.assertEquals(list.size(), 2);

		categoryService.delete(new Long(2));
		Assert.assertEquals(1, categoryService.count());
	}
}
