package com.yuqi.base.dao;

import org.springframework.stereotype.Repository;

import com.yuqi.base.entity.Authority;

import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * 授权对象的泛型DAO.
 * 
 * @author calvin
 */
@Repository
public class AuthorityDao extends HibernateDao<Authority, Long> {
}
