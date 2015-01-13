package com.yuqi.shop.integration.dao.security;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.shop.dao.CategoryDao;
import com.yuqi.shop.entity.Category;

public class CategoryDaoTest extends SpringTxTestCase  {
	@Autowired
	private CategoryDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Category entity = new Category("catetest1");
		// entity.setCategory(null);
		entityDao.save(entity);
		Category entity1 = new Category("catetest11");
		entity1.setCategory(entity);
		flush();

		//find entity.	
		Category entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}

	// @Test
	// public void topCategories() {
	// List<Category> categories = entityDao
	// .find("from Category where category is null");
	// System.out.println(categories.size());
	// assertTrue(categories.size() > 0);
	// for (Iterator iterator = categories.iterator(); iterator.hasNext();) {
	// Category category = (Category) iterator.next();
	// System.out.println(category.getName());
	// assertNull(category.getCategory());
	// }
	// }

	@Test
	public void updateGategory() {
		Category c1 = new Category();
		c1.setCategory(null);
		c1.setName("c1");
		entityDao.save(c1);
		flush();
		Category c2 = new Category();
		c2.setCategory(null);
		c2.setName("c2");
		entityDao.save(c2);
		flush();

		Category c3 = entityDao.get(c2.getId());
		c3.setCategory(c1);
		entityDao.save(c1);
		flush();

		assertEquals(c3.getCategory().getId(), c1.getId());
	}
}

