package com.cc.cw.service;

import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;
import com.cc.cw.domain.Member;

public class MemberServiceTest extends BaseTest{
	
	MemberService ms = null;
	String email = "test@test.com";
	String password = "password";
	String uuid = "uuid";
	String ip = "127.0.0.1";
	String name = "name";
	int id;
	
	@BeforeTest
	public void setup(){
		ms = (MemberService)ctx.getBean("memberService");
		Assert.assertNotNull(ms);
	}
	
	@Test
	public void testRegist(){
		Member member = new Member();
		member.setEmail(email);
		member.setIp(ip);
		member.setPassword(password);
		member.setUserName(name);
		member.setUuid(uuid);
		Assert.assertNotSame(0,id = ms.regist(member));
		Assert.assertSame(0, ms.regist(member));
	}
	
	@Test(dependsOnMethods={"testRegist"},groups={"normal"})
	public void testGet(){
		Member m = ms.get(id);
		Assert.assertNotNull(m);
	}
	
	@Test(dependsOnMethods={"testRegist"},groups={"normal"})
	public void testLogin(){
		Assert.assertNotNull(ms.login(Integer.toString(id), password, "id"));
		Assert.assertNotNull(ms.login(email, password, "email"));
	}
	
	@Test(dependsOnMethods={"testRegist"},groups={"normal"})
	public void testGetByUUID(){
		Assert.assertNotNull(ms.getByUUID(uuid));
	}
	
	@Test(dependsOnMethods={"testRegist"},groups={"normal"})
	public void tsetGetByEmail(){
		Assert.assertNotNull(ms.getByEmail(email));
	}
	
	@Test(dependsOnGroups={"normal"})
	public void testUpdateUUID(){
		Assert.assertTrue(ms.updateUUID(id, "updateuuid"));
	}
	
}
