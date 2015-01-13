package com.yuqi.fetchhtml;

import java.util.List;

import com.yuqi.utils.HtmlUtils;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.Source;

public class FetchHtml {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		String url = "http://www.ci123.com/index1.html";
		Source source = HtmlUtils.parseHtmlSource(url);
		Element e = HtmlUtils.getElementById(source, "nav_menu3_list");
		List list = HtmlUtils.findStartTagsByName(e, "a");
		for (int i = 9; i < 15; i++) {
			Element e1 = (Element) list.get(i);
			System.out.println(e1.getTextExtractor());
		}
		//System.out.println(e.getTextExtractor());
 	}
}
