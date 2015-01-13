package com.yuqi.shop.service.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.orm.Page;

import com.yuqi.shop.dao.ItemDao;
import com.yuqi.shop.entity.Category;
import com.yuqi.shop.entity.Item;

@Service
@Transactional
public class ItemManager {
	@Autowired
	private ItemDao itemDao;

	// Item Manager //
	@Transactional(readOnly = true)
	public Item get(Long id) {
		return itemDao.get(id);
	}

	public void save(Item item) {
		itemDao.save(item);
	}

	public void delete(Long id) {
		itemDao.delete(id);
	}

	public Page<Item> page(int pageNo, int pageSize) {
		Page<Item> page = new Page<Item>(pageNo);
		page.setPageSize(pageSize);
		return itemDao.getAll(page);
	}

	public Page<Item> page(Category category, int pageNo, int pageSize) {
		Page<Item> page = new Page<Item>(pageNo);
		page.setPageSize(pageSize);
		String hql = "from Item where category=?";
		return itemDao.findPage(page, hql, category);
	}
}

