package com.yuqi.blog.dao.gae;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import com.yuqi.blog.dao.CategoryDao;
import com.yuqi.blog.domain.Category;
import com.yuqi.blog.utils.PMF;

public class CategoryDaoImpl implements CategoryDao {
	private PersistenceManager pm = PMF.get().getPersistenceManager();

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> find() {
		Query query = pm.newQuery(Category.class);
		query.setOrdering("viewOrder desc");
		return (List<Category>) query.execute();
	}

	@Override
	public Category get(Long id) {
		return pm.getObjectById(Category.class, id);
	}

	@Override
	public Category save(Category category) {
		pm.currentTransaction().begin();
		try {
			pm.makePersistent(category);
			pm.currentTransaction().commit();
		} finally {
			if (pm.currentTransaction().isActive()) {
				pm.currentTransaction().rollback();
			}
		}
		pm.close();
		pm = PMF.get().getPersistenceManager();

		return category;
	}

	@Override
	public int count() {
		Query query = pm.newQuery(Category.class);
		query.setResult("count(this.id)");
		int results = (Integer) query.execute();
		return results;
	}

	@Override
	public void delete(Long id) {
		pm.deletePersistent(this.get(id));
	}

}
