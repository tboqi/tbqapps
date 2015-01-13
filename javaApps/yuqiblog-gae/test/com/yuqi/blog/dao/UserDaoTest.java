package com.yuqi.blog.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.yuqi.blog.domain.User;

public class UserDaoTest {

	private UserDao userDao;
	private final LocalServiceTestHelper helper =
        new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());
	@Before
    public void setUp() {
		ApplicationContext context = 
			new ClassPathXmlApplicationContext("/config/spring-*.xml");
		userDao = (UserDao)context.getBean("userDao");
        helper.setUp();
    }

    @After
    public void tearDown() {
        helper.tearDown();
    }
    @Test
    public void testSaveAndGet() {
    	User user1 = new User();
    	user1.setUsername("u1");
    	user1.setEmail("email1");
    	user1.setPassword("p1");
    	userDao.save(user1);
    	assertEquals(1, user1.getId().intValue());
    	
    	User user2 = new User();
    	user2.setUsername("u2");
    	user2.setEmail("email2");
    	user2.setPassword("p2");
    	userDao.save(user2);
    	assertEquals(2, user2.getId().intValue());
    	
    	User u3 = userDao.get(new Long(1));
    	assertEquals("u1", u3.getUsername());
    	
    	u3.setUsername("u3");
    	userDao.save(u3);
    	User u4 = userDao.get(new Long(1));
    	assertEquals("u3", u4.getUsername());
    	
    	User u5 = userDao.getByUsername("u2");
    	assertEquals(u5.getId(), new Long(2));
    	
    	assertEquals(2, userDao.count());
    }
}
