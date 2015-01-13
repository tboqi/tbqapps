package com.cc.cw;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.dao.MemberDAO;
import com.cc.cw.domain.Member;

public class Memtest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml", 
			    "dataAccessContext-local.xml","indexContext.xml" });
		MemberDAO dao = (MemberDAO)ctx.getBean("memberDAO");
		Member member = dao.getByEmail("tboqi1@gmail.com");
		dao.update(member);
//		System.out.println(dao.getByEmail("tboqi1@gmail.com"));
	}

}
