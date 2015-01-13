package com.yuqi.shop.service.security;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuqi.shop.dao.CategoryDao;
import com.yuqi.shop.entity.Category;

@Service
@Transactional
public class CategoryManager {
	@Autowired
	private CategoryDao categoryDao;

	// Category Manager //
	@Transactional(readOnly = true)
	public Category getCategory(Long id) {
		return categoryDao.get(id);
	}

	public List<Category> getAllCategory() {
		return categoryDao.getAll();
	}
	
	public List<Category> getAllCategoryWithSub() {
		List<Category> categories = categoryDao.topCategories();
		List<Category> list = new ArrayList<Category>();
		if (categories.size() < 1)
			return list;
		for (Iterator<Category> iterator = categories.iterator(); iterator
				.hasNext();) {
			Category category = iterator.next();
			list = CategoryManager.categories(category, list);
		}
		return list;
	}

	static public List<Category> categories(Category category,
			List<Category> list) {
		list.add(category);
		List<Category> list2 = category.getCategories();
		if (list2.size() > 0) {
			for (Iterator<Category> iterator = list2.iterator(); iterator
					.hasNext();) {
				Category category2 = iterator.next();
				// category2.setName(pre + category2.getName());
				list = CategoryManager.categories(category2, list);
			}
		}
		return list;
	}

	public void saveCategory(Category category) {
		categoryDao.save(category);
	}

	public void deleteCategory(Long id) {
		categoryDao.delete(id);
	}
}

