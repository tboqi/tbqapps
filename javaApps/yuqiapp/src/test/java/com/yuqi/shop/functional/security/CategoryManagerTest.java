package com.yuqi.shop.functional.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.shop.service.security.CategoryManager;

public class CategoryManagerTest extends SpringTxTestCase {

	@Autowired
	private CategoryManager categoryManager;
}

