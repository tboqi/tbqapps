package com.yuqi.blog.service;

import org.apache.commons.lang.StringUtils;

import com.yuqi.blog.dao.UserDao;
import com.yuqi.blog.domain.User;
import com.yuqi.blog.utils.SecurityUtils;

public class UserService {
	private UserDao userDao;

	public User save(User user) {
		user.setPassword(SecurityUtils.md5(user.getPassword()));
		user = userDao.save(user);
		return user;
	}

	public boolean hasOperater() {
		int num = userDao.count();
		if (num > 0)
			return true;
		else
			return false;
	}

	public User login(String username, String password) {
		User user = userDao.getByUsername(username);
		if (user != null
				&& StringUtils.equals(user.getPassword(), SecurityUtils
						.md5(password)))
			return user;
		else
			return null;
	}

	public User getByUsername(String username) {
		return userDao.getByUsername(username);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}
}
