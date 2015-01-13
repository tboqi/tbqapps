package com.number1g.fetcher.articlefetcher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.StartTag;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.number1g.entity.Tag;
import com.number1g.fetcher.ArticleFetcher;
import com.yuqi.utils.HtmlParserUtils;
import com.yuqi.utils.StringUtil;

public class HexunArticleFetcher extends ArticleFetcher {
	private static Log log = LogFactory.getLog(HexunArticleFetcher.class);
	
	public void fetcher(String url, int cateid) {
		this.url = url;
		source = HtmlParserUtils.parseHtmlSource(url);
		if(source == null) {
			log.error("source == null. url is " + url);
			this.parseError = "source == null";
			return;
		}
		article.setTitle(getTitle());
		article.setContent(parseContent());
		article.setSourceUrl(url);
		if(StringUtils.isNotEmpty(parseError)) {
			articleDao.saveUrl(url, parseError, cateid);
		} else if(StringUtils.isEmpty(article.getContent())) {
			articleDao.saveUrl(url, "no content", cateid);
		} else {
			int artid = articleDao.save(article);
			articleDao.saveUrl(url, "success", cateid);
			articleDao.saveCate(artid, cateid);
			
			String keywords = this.parseKeywords();
			String desc = this.getDescription();
			
			Map<String, String> metas = new HashMap<String, String>();
			if(!StringUtils.isEmpty(keywords)) {
				metas.put("_aioseop_keywords", keywords);
			}
			if(!StringUtils.isEmpty(article.getTitle())) {
				metas.put("_aioseop_title", article.getTitle());
			}
			if(!StringUtils.isEmpty(desc)) {
				metas.put("_aioseop_description", desc);
			}
			articleDao.saveMetas(metas, artid);
			
			List<Tag> tags = tags(keywords);
			articleDao.saveTags(tags, artid);
		}
	}
	
	private String getTitle() {
		Element element = source.getFirstElement("title");
		String title = "";
		if(element != null && element.getTextExtractor() != null) {
			title = element.getTextExtractor().toString();
		}
		title = title.replaceAll("-奢侈品频道-和讯网", "");
		title = title.replaceAll("-新闻频道-和讯网", "");
		return title;
	}
	private String parseContent() {
		if(source == null) {
			log.error("source == null. url is " + url);
			this.parseError = "source == null";
			return "";
		}
		String tagclass = "detail_cnt";
		List<StartTag> startTags = source.getAllStartTagsByClass(tagclass);
		Element e;
		if(startTags.size() < 1) {
			log.info("no tag with class " + tagclass + ":" + url);
			e = source.getElementById("artibody");
			log.info("content id : artibody " + tagclass + ":" + url);
		} else {
			StartTag startTag = startTags.get(0);
			e = startTag.getElement();
		}
		
		if(e == null) {
			parseError = "no content";
			log.info("no content :" + url);
			return "";
		}
		List<Element> list2 = e.getAllElements("select");
		if(list2.size() > 0) {
			log.error("more pages: " + url);
			parseError = "more pages";
			return "";
		}
		List<Element> list = e.getChildElements();
		String content = "";
		for (Element element : list) {
			String eclass = element.getAttributeValue("class");
			if(StringUtils.equalsIgnoreCase(eclass, "clear")) {
				break;
			}
			content += element.toString();
		}
		content = content.replaceAll("'", "\\\\\'");
		return content;
	}
	
	private String getDescription() {
		if(source == null) {
			log.error("source == null. url is " + url);
			this.parseError = "source == null";
			return "";
		}
		List<Element> elements = source.getAllElements("name", "description", false);
		if(elements.size() < 1) {
			log.info("no description:" + url);
			return "";
		}
		Element e = elements.get(0);
		String description = e.getAttributeValue("content");
		description = description.replaceAll("-奢侈品频道-和讯网", "");
		return description;
	}
	
	private List<Tag> tags(String keywords) {
		List<Tag> taglist = new ArrayList<Tag>();
		log.info("keywords: " + keywords + ";;" + url);
		String[] tags = keywords.split(" ");
		for (String tag : tags) {
			tag = tag.trim();
			taglist.add(new Tag(tag));
		}
		return taglist;
	}
	
	private String parseKeywords() {
		String keywords = "";
		List<Element> elements = source.getAllElements("name", "keywords", false);
		Element e = elements.get(0);
		if(elements.size() < 1) {
			log.info("no keywords: " + url);
		} else {
			keywords = e.getAttributeValue("content");
		}
		return keywords;
	}
}
