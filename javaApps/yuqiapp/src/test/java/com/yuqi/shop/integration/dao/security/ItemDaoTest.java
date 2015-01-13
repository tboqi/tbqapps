package com.yuqi.shop.integration.dao.security;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.base.dao.UserDao;
import com.yuqi.shop.dao.CategoryDao;
import com.yuqi.shop.dao.ItemDao;
import com.yuqi.shop.entity.Category;
import com.yuqi.shop.entity.Item;

public class ItemDaoTest extends SpringTxTestCase  {
	@Autowired
	private ItemDao entityDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CategoryDao categoryDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Category c = new Category("cate1");
		categoryDao.save(c);
		Item entity = new Item(userDao.get(new Long(1)), c,
				"item1", "img1", (float) 3.2, new Date());
		entityDao.save(entity);
		flush();

		//find entity.	
		Item entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

}

