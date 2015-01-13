package com.yuqi.utils;

import java.io.IOException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.StartTag;

public class HtmlParserUtils {
	
	private static Log log = LogFactory.getLog(HtmlParserUtils.class);

	public static Source parseHtmlSource(String url) {
		Source source;
		try {
			source = new Source(ChentuUtils.getURLConnection(url));
		} catch (IOException e) {
			source = null;
			log.error("source error: " + url);
		}
		return source;
	}
	

	public static Element getElementById(Source source, String id) {
		return source.getElementById(id);
	}
	/**
	 * 这个有问题, 使用getElementByClass2代替
	 * @deprecated
	 * @param source
	 * @param htmlclass
	 * @return
	 */
	public static Element getElementByClass(Source source, String htmlclass) {
		Element e = getElementById(source, "mainbox");
		if(e == null) return null;
		
		List<StartTag> startTags = e.getAllStartTagsByClass(htmlclass);
		if(startTags.size() < 1) return null;
		StartTag startTag = startTags.get(0);
		e = startTag.getElement();
		return e;
	}
	
	public static Element getElementByClass2(Source source, String htmlclass) {
		List<StartTag> startTags = source.getAllStartTagsByClass(htmlclass);
		if(startTags.size() < 1) return null;
		StartTag startTag = startTags.get(0);
		Element e = startTag.getElement();
		return e;
	}
}
