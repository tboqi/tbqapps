package com.yuqi.utils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.Source;
import au.id.jericho.lib.html.StartTag;

public class HtmlUtils {

	public static Source parseHtmlSource(String sourceUrl) {
		Source source = null;
		try {
			source = new Source(new URL(sourceUrl));
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return source;
	}
	
	public static List findStartTagsByName(Element e, String tagName) {
		return e.findAllStartTags(tagName);
	}
	
	public static Element getElementById(Source source, String id) {
		return source.getElementById(id);
	}
}
