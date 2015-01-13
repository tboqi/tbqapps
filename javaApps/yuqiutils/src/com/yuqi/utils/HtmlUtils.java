package com.yuqi.utils;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.StartTag;


public class HtmlUtils {
	private static Log log = LogFactory.getLog(HtmlUtils.class);
	
	public static URLConnection getURLConnection(String webUrl) {
		URL url;
		URLConnection connection = null;
		try {
			url = new URL(webUrl);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("User-agent", "Mozilla/4.0");
		} catch (MalformedURLException e) {
			log.error("create URL error: " + webUrl);
		} catch (IOException e) {
			log.error("URLConnection error: " + webUrl);
		}

		return connection;
	}
	
	public static String getDescription(Source source) {
//		System.out.println(source);return null;
		List<Element> elements = source.getAllElements("name", "description", false);
		Element e = elements.get(0);
		String description = e.getAttributeValue("content");
		description = description.replaceAll("-奢侈品频道-和讯网", "");
		return description;
	}
	
	public static String getTitle(Source source) {
		Element element = source.getFirstElement("title");
		String title = element.getTextExtractor().toString();
		title = title.replaceAll("-奢侈品频道-和讯网", "");
		return title;
	}
	
	public static String getKeywords(Source source) {
		List<Element> elements = source.getAllElements("name", "keywords", false);
		Element e = elements.get(0);
		String keywords = e.getAttributeValue("content");
//		description = description.replaceAll("-奢侈品频道-和讯网", "");
		return keywords;
	}

	public static Source parseHtmlSource(String sourceUrl) {
		Source source;
		try {
			source = new Source(getURLConnection(sourceUrl));
		} catch (IOException e) {
			log.error("parseHtmlSource IOException");
			source = null;
		}
		return source;
	}
	
	@SuppressWarnings("rawtypes")
	public static List findStartTagsByName(Element e, String tagName) {
		return e.getAllStartTags(tagName);
	}
	
	public static Element getElementById(Source source, String id) {
		return source.getElementById(id);
	}
	
	public static Element getElementByClass(Source source, String htmlclass) {
		Element e = getElementById(source, "mainbox");
		if(e == null) return null;
//		System.out.println(htmlclass);
		
		List<StartTag> startTags = e.getAllStartTagsByClass(htmlclass);
		if(startTags.size() < 1) return null;
		StartTag startTag = startTags.get(0);
		e = startTag.getElement();
//		startTags = e.getAllStartTagsByClass("clear");
//		startTag = startTags.get(0);
//		e = startTag.getElement();
//		startTags = e.getAllStartTagsByClass(htmlclass);
//		startTag = startTags.get(0);
//		e = startTag.getElement();
		return e;
	}
	
	public static void main(String[] args) throws IOException {
		Source source = parseHtmlSource("http://lux.hexun.com/watch/index-1.html");
		Element element = getElementById(source, "mainbox");
//		System.out.println(element);
		List<StartTag> startTags = element.getAllStartTagsByClass("temp01");
//		List<Element> childElements = element.getChildElements();
		Element e = null;
		List<Element> elements = null;
		for (StartTag startTag : startTags) {
			e = startTag.getElement();
			elements = e.getAllElements("a");
			for (Element element2 : elements) {
//				element2.getAttributeValue("href");
				System.out.println(element2.getAttributeValue("href"));
			}
			//System.out.println(startTag.getElement());
		}
//		System.out.println(element);
	}
}
