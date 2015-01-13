package com.cc.cw.dao;

import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Member;


public class MemberDAOTest extends BaseTest{
	
	MemberDAO dao = null;
	
	//测试所需数据
	String email = "test@test.com";
	String password = "password";
	String uuid = "uuid";
	String ip = "127.0.0.1";
	String name = "name";
	int id;
	
	@BeforeTest
	public void setup(){
		dao = (MemberDAO)ctx.getBean("memberDAO");
		Assert.assertNotNull(dao);
	}
	
	@AfterTest
	public void tearDown(){
		
	}
	
	private int add(){
		Member member = new Member();
		member.setEmail(email);
		member.setIp(ip);
		member.setPassword(password);
		member.setUserName(name);
		member.setUuid(uuid);
		return dao.add(member);
	}
	
	@Test
	public void testGetAdd(){
		id = add();
		Assert.assertNotNull(dao.get(id));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},groups={"normal"})
	public void testGetByEmail(){
		Assert.assertNotNull(dao.getByEmail(email));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},groups={"normal"})
	public void testGetByUUID(){
		Assert.assertNotNull(dao.getByUUID(uuid));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},groups={"normal"})
	public void testExists(){
		Assert.assertTrue(dao.exists(email));
		Assert.assertFalse(dao.exists("123@456.com"));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},groups={"normal"})
	public void testLoginByEmail(){
		Assert.assertNotNull(dao.loginByEmail(email, password));
		Assert.assertNull(dao.loginByEmail(email, ".,kxvjo"));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},groups={"normal"})
	public void testLoginById(){
		Assert.assertNotNull(dao.loginById(Integer.toString(id), password));
		Assert.assertNull(dao.loginById(Integer.toString(id), ".,kxvjo"));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},groups={"normal"})
	public void testSetMemberEnable(){
		Member member = dao.get(id);
		Assert.assertSame(0, member.getState());
		Assert.assertNotSame(0, dao.setMemberEnable(id));
		member = dao.get(id);
		Assert.assertSame(1, member.getState());
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},dependsOnGroups={"normal"})
	public void testUpdateCover(){
		Assert.assertNotSame(0, dao.updateCover(id, "coverPath"));
		Member member = dao.get(id);
		Assert.assertTrue("coverPath".equals(member.getCoverPath()));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},dependsOnGroups={"normal"})
	public void testUpdatePassword(){
		Assert.assertNotSame(0, dao.updatePassword(id, "newpwd"));
		Member member = dao.get(id);
		Assert.assertTrue("newpwd".equals(member.getPassword()));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},dependsOnGroups={"normal"})
	public void testUpdatePrivilege(){
		Assert.assertNotSame(0, dao.updatePrivilege(id, 100));
		Member member = dao.get(id);
		Assert.assertSame(100,member.getPrivilege());
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},dependsOnGroups={"normal"})
	public void testUpdate(){
		Member member = dao.get(id);
		member.setUserName("updatename");
		member.setPassword("updatepassword");
		Assert.assertSame(1, dao.update(member));
		member = dao.get(id);
		Assert.assertTrue("updatename".equals( member.getUserName()));
		Assert.assertTrue("updatepassword".equals(member.getPassword()));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},dependsOnGroups={"normal"})
	public void testUpdateUserName(){
		Assert.assertNotSame(0, dao.updateUserName(id, "for test name"));
		Member member = dao.get(id);
		Assert.assertTrue(member.getUserName().equals("for test name"));
	}
	
	@Test(dependsOnMethods = {"testGetAdd"},dependsOnGroups={"normal"})
	public void testUpdateUUID(){
		Assert.assertNotSame(0, dao.updateUUID(id, "for test UUID"));
		Member member = dao.get(id);
		Assert.assertTrue(member.getUuid().equals("for test UUID"));
	}
	
}
