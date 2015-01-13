package com.yuqi.blog.dao.gae;

import java.util.List;

import javax.jdo.PersistenceManager;

import com.yuqi.blog.dao.UserDao;
import com.yuqi.blog.domain.User;
import com.yuqi.blog.utils.PMF;
import javax.jdo.Query;

public class UserDaoImpl implements UserDao {
	private PersistenceManager pm = PMF.get().getPersistenceManager();

	@Override
	public User get(Long id) {
		return pm.getObjectById(User.class, id);
	}

	@Override
	public User save(User user) {
		user.setPassword2(null);
		user = pm.makePersistent(user);
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User getByUsername(String username) {
		Query query = pm.newQuery(User.class);
		query.setFilter("username == param");
		query.declareParameters("String param");

		List<User> results = (List<User>) query.execute(username);
		if (results.size() < 1)
			return null;
		else
			return results.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int count() {
		Query query = pm.newQuery(User.class);
		List<User> results = (List<User>) query.execute();
		return results.size();
	}

}
