package com.yuqi.shop.functional.security;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.orm.Page;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.base.entity.User;
import com.yuqi.base.service.security.SecurityEntityManager;
import com.yuqi.shop.entity.Category;
import com.yuqi.shop.entity.Item;
import com.yuqi.shop.service.security.CategoryManager;
import com.yuqi.shop.service.security.ItemManager;

public class ItemManageTest extends SpringTxTestCase {
	@Autowired
	private ItemManager itemManager;
	@Autowired
	private SecurityEntityManager securityEntityManager;
	@Autowired
	private CategoryManager categoryManager;

	@Test
	public void crud() {
		User user = securityEntityManager.findUserByLoginName("admin");
		Category category = new Category("c1");
		categoryManager.saveCategory(category);
		Item item = new Item(user, category, "item1", "", 1.21f, new Date());
		itemManager.save(item);
		assertNotNull(item.getId());

		Page<Item> page = itemManager.page(1, 10);
		assertEquals(page.getTotalPages(), 1L);
		assertEquals(page.getTotalCount(), 1L);

		category = new Category("c2");
		categoryManager.saveCategory(category);
		Item item1 = itemManager.get(item.getId());
		item1.setCategory(category);
		item1.setName("itemsdfsdf");
		itemManager.save(item1);
		// assertTrue(!org.apache.commons.lang.StringUtils.equals(item.getName(),
		// item1.getName()));

		page = itemManager.page(1, 10);
		Page<Item> page2 = itemManager.page(category, 1, 10);
		assertEquals(page.getTotalCount(), 1L);
		assertEquals(page2.getTotalCount(), 1L);

		itemManager.delete(item.getId());
		assertEquals(0L, itemManager.page(1, 10).getTotalCount());
	}
}
