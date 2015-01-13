package com.yuqi.blog.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.yuqi.blog.domain.User;

public class UserServiceTest {
	private final LocalServiceTestHelper helper =
        new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());
	private UserService us;
	@Before
    public void setUp() {
		ApplicationContext context = 
			new ClassPathXmlApplicationContext("/config/spring-*.xml");
		us = (UserService)context.getBean("userService");
        helper.setUp();
    }

    @After
    public void tearDown() {
        helper.tearDown();
    }
    
    @Test
    public void testCRUD() {
    	User user1 = new User();
    	user1.setUsername("u1");
    	user1.setEmail("email1");
    	user1.setPassword("p1");
    	user1 = us.save(user1);
    	assertTrue(user1.getId().intValue() > 0);
    	
    	assertTrue(us.hasOperater());
    	
    	assertNotNull(us.login("u1", "p1"));
    	
    	assertNull(us.login("u2", "p1"));
    }
}
