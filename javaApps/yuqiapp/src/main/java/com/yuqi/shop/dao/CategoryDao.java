package com.yuqi.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;
import org.springside.modules.orm.hibernate.HibernateDao;

import com.yuqi.shop.entity.Category;

/**
 * 
 * @author 唐伯琦
 * 
 */
@Repository
public class CategoryDao extends HibernateDao<Category, Long> {
	public List<Category> topCategories() {
		String hql = "from Category c where category is null";
		return find(hql);
	}

	/**
	 * 保存新增或修改的对象.
	 */
	@Override
	public void save(final Category entity) {
		Assert.notNull(entity, "entity不能为空");
		getSession().clear();// 清除緩存
		getSession().saveOrUpdate(entity);
		logger.debug("save entity: {}", entity);
	}
}

