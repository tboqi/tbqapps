package com.yuqi.shop.entity.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yuqi.shop.entity.security.Category;

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
	
	public void saveCategory(Category category) {
		categoryDao.save(category);
	}

	public void deleteCategory(Long id) {
		categoryDao.delete(id);
	}
}

