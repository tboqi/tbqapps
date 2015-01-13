package com.yuqi.base.entity.security;

import org.springframework.stereotype.Repository;
import org.springside.modules.orm.hibernate.HibernateDao;

import com.yuqi.base.entity.security.Resource;

@Repository
public class ResourceDao extends HibernateDao<Resource, Long> {
}

