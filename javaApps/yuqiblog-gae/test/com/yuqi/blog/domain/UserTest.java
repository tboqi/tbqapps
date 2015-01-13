package com.yuqi.blog.domain;

import junit.framework.TestCase;

public class UserTest extends TestCase {

	private User user;
	
	protected void setUp() throws Exception {
		user = new User();
	}
	
	public void testSetAndGetUsername() {
		String testUsername = "auser";
		assertNull(user.getUsername());
		user.setUsername(testUsername);
		assertEquals(testUsername, user.getUsername());
	}
}
