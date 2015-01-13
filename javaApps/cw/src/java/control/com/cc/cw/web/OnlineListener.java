package com.cc.cw.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.cc.cw.domain.Member;

public class OnlineListener implements HttpSessionAttributeListener {

	private static List<Member> list = new ArrayList<Member>();

	public void attributeAdded(HttpSessionBindingEvent event) {
		if ("member".equals(event.getName())) {
			list.add((Member) event.getValue());
		}
	}

	public void attributeRemoved(HttpSessionBindingEvent event) {
		if ("member".equals(event.getName())) {
			list.remove((Member) event.getValue());
		}
	}

	public void attributeReplaced(HttpSessionBindingEvent event) {
	}

	public static List<Member> getOnlineMember() {
		return list;
	}
}
