package com.yuqi.blog.dao;

import java.util.List;

import com.yuqi.blog.domain.Category;

public interface CategoryDao {
	public Category get(Long id);
//	public List<Category> findBySubCategory(Category category);
	public List<Category> find();
	public Category save(Category category);
	public void delete(Long id);
	public int count();
}
