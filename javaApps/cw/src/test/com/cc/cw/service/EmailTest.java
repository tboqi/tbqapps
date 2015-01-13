package com.cc.cw.service;

import java.util.HashMap;
import java.util.Map;

import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.cc.cw.BaseTest;

public class EmailTest extends BaseTest{

	MailService mailTest;
	
	@BeforeTest
	public void setup(){
		mailTest = (MailService)ctx.getBean("mailService");
	}
	@SuppressWarnings("unchecked")
	@Test
	public void testSend(){
		try {
			Map map = new HashMap();
			map.put("userName", "test");
			map.put("uuid", "11111");
			mailTest.sendEmail("zehuand@gmail.com",map);
//			mailTest.sendEmail("ibm_sony620@126.com",map);
			mailTest.sendEmail("duzeh@126.com",map);
			mailTest.sendEmail("duzeh@sohu.com",map);
			mailTest.sendEmail("duzh@xiaoshuo.com",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
