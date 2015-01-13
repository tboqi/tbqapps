package com.yuqi.shop.entity.security;

import org.springframework.stereotype.Repository;
import org.springside.modules.orm.hibernate.HibernateDao;

import com.yuqi.shop.entity.security.Category;

@Repository
public class CategoryDao extends HibernateDao<Category, Long> {
}

