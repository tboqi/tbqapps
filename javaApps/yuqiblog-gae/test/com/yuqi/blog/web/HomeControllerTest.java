package com.yuqi.blog.web;

import junit.framework.TestCase;

import org.springframework.web.servlet.ModelAndView;

public class HomeControllerTest extends TestCase {
	public void testHandleRequestView() throws Exception {
		HomeController controller = new HomeController();
		ModelAndView modelAndView = controller.handleRequest(null, null);
		assertEquals("index", modelAndView.getViewName());
		assertNotNull(modelAndView.getModel());
		String websiteTitle = (String) modelAndView.getModel().get("websiteTitle");
		assertNotNull(websiteTitle);
	}

}
