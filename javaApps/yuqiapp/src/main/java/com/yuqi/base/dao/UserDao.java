package com.yuqi.base.dao;

import org.springframework.stereotype.Repository;

import com.yuqi.base.entity.User;

import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * 用户对象的泛型DAO类.
 * 
 * @author calvin
 */
@Repository
public class UserDao extends HibernateDao<User, Long> {
}
