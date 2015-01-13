package com.yuqi.blog.dao;

import com.yuqi.blog.domain.User;

public interface UserDao {

	public User get(Long id);
	public User save(User user);
	public User getByUsername(String username);
	public int count();
}
