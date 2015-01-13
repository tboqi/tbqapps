package com.yuqi.shop.dao;

import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;
import org.springside.modules.orm.hibernate.HibernateDao;

import com.yuqi.shop.entity.Item;

/**
 * 
 * @author 唐伯琦
 * 
 */
@Repository
public class ItemDao extends HibernateDao<Item, Long> {
	/**
	 * 保存新增或修改的对象.
	 */
	@Override
	public void save(final Item entity) {
		Assert.notNull(entity, "entity不能为空");
		getSession().clear();// 清除緩存
		getSession().saveOrUpdate(entity);
		logger.debug("save entity: {}", entity);
	}
}

