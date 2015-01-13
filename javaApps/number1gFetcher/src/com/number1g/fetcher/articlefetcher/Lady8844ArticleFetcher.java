package com.number1g.fetcher.articlefetcher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.number1g.entity.Tag;
import com.number1g.fetcher.ArticleFetcher;
import com.yuqi.utils.HtmlParserUtils;
import com.yuqi.utils.HtmlRegexpUtil;

public class Lady8844ArticleFetcher extends ArticleFetcher {

	private static Log log = LogFactory.getLog(Lady8844ArticleFetcher.class);
	@Override
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
		if(StringUtils.isEmpty(article.getContent())) {
			log.error("no content. url is " + url);
			articleDao.saveUrl(url, "no content", cateid);
		} else if(StringUtils.isNotEmpty(this.parseError)) {
			articleDao.saveUrl(url, this.parseError, cateid);
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

	private String parseContent() {
		nextUrl = url;
		String content = "";
		do {
			content += getContent(nextUrl);
		} while (hasNext(nextUrl));
		
		return content;
	}
	
	private String nextUrl;
	
	private boolean hasNext(String arturl) {
		boolean b = false;
		//加载分页
		String pageId = "content_pagelist";
		Source source = HtmlParserUtils.parseHtmlSource(arturl);
		if(source == null) {
			log.error("source == null. url is " + arturl);
			this.parseError = "source == null";
			return false;
		}
		Element e = HtmlParserUtils.getElementById(source, pageId);
		if (e == null) {
			log.info("no pages. url is " + url);
			b = false;
		} else {
			List<Element> list = e.getAllElements("b");
			for (Element element : list) {
				String s = element.toString();
				if(s.contains("下一页</a></b>")) {
					Element e1 = element.getFirstElement("a");
					String url2 = e1.getAttributeValue("href");
					String[] urlArr = url.split("/");
					urlArr[urlArr.length - 1] = url2;
					b = true;
					nextUrl = StringUtils.join(urlArr, "/");
					break;
				}
				b = false;
			}
		}
		return b;
	}
	
	private String getContent(String arturl) {
		String content = "";
		Source source = HtmlParserUtils.parseHtmlSource(arturl);
		if (source == null) {
			log.error("source == null. url is " + arturl);
			this.parseError = "source == null";
			return content;
		}
		String contentId = "TEXT_CONTENT";
		Element e = HtmlParserUtils.getElementById(source, contentId);
		List<Element> list;
		if (e == null) {
			log.error("no content with id: " + contentId + "  ; url is " + arturl);
		} else {
			list = e.getChildElements();
			for (Element element : list) {
				if(element.toString().contains("爱美网猜你喜欢的文章")) {
					
				} else {
					content += element.toString();
				}
			}
			content = content.replaceAll("'", "\\\\\'");
			content = content.replaceAll("爱美网", "新贵网");
			content = HtmlRegexpUtil.fiterHtmlTag(content, "a");
		}
		return content;
	}

	private String getTitle() {
		Element element = source.getFirstElement("title");
		String title = "";
		if(element != null && element.getTextExtractor() != null) {
			title = element.getTextExtractor().toString();
		}

		title = title.replaceAll("-时尚品牌-时尚-爱美网 lady8844.com", "");
		title = title.replaceAll("-护肤品评测-评测室-爱美网 lady8844.com", "");
		title = title.replaceAll("-护肤指向标-护肤-爱美网 lady8844.com", "");
		title = title.replaceAll("-明星美颜计-护肤-爱美网 lady8844.com", "");
		title = title.replaceAll("-肌肤诊疗室-护肤-爱美网 lady8844.com", "");
		title = title.replaceAll("-明星妆容-彩妆-爱美网 lady8844.com", "");
		title = title.replaceAll("-化妆技巧-彩妆-爱美网 lady8844.com", "");
		title = title.replaceAll("-流行彩妆-彩妆-爱美网 lady8844.com", "");
		title = title.replaceAll("-化妆品-彩妆-爱美网 lady8844.com", "");
		title = title.replaceAll("-鞋帽-饰品-爱美网 lady8844.com", "");
		title = title.replaceAll("-搭配学堂-服饰-爱美网 lady8844.com", "");
		title = title.replaceAll("-配饰-饰品-爱美网 lady8844.com", "");
		title = title.replaceAll("-包包-饰品-爱美网 lady8844.com", "");
		title = title.replaceAll("-流行服饰-服饰-爱美网 lady8844.com", "");
		title = title.replaceAll("-中国街拍-服饰-爱美网 lady8844.com", "");
		title = title.replaceAll("-流行发型-美发-爱美网 lady8844.com", "");
		title = title.replaceAll("-明星发型-美发-爱美网 lady8844.com", "");
		title = title.replaceAll("-发型DIY-美发-爱美网 lady8844.com", "");
		title = title.replaceAll("-美发消费-美发-爱美网 lady8844.com", "");
		title = title.replaceAll("-美发资讯-美发-爱美网 lady8844.com", "");
		title = title.replaceAll("-塑身瑜伽-瑜伽-爱美网 lady8844.com", "");
		title = title.replaceAll("-局部瘦身-瘦身-爱美网 lady8844.com", "");
		title = title.replaceAll("-运动减肥-瘦身-爱美网 lady8844.com", "");
		title = title.replaceAll("-药物医疗-瘦身-爱美网 lady8844.com", "");
		title = title.replaceAll("-减肥经验-瘦身-爱美网 lady8844.com", "");
		title = title.replaceAll("-减肥常识-瘦身-爱美网 lady8844.com", "");
		title = title.replaceAll("爱美网", "新贵网");
		title = title.replaceAll("lady8844.com", "");
		title = title.replaceAll("-护肤品推荐-护肤-新贵网", "");
		return title;
	}
	
	private String getDescription() {
		List<Element> elements = source.getAllElements("name", "description", false);
		if(elements.size() < 1) {
			log.info("no description:" + url);
			return "";
		}
		Element e = elements.get(0);
		String description = e.getAttributeValue("content");
		description = description.replaceAll("爱美网", "新贵网");
		description = description.replaceAll("lady8844", "number1g");
		description = description.replaceAll("非合作媒体不得转载，内容合作联系电话：020-38468403。", "");
		return description;
	}
	
	private List<Tag> tags(String keywords) {
		List<Tag> taglist = new ArrayList<Tag>();
		log.info("keywords: " + keywords + ";;" + url);
		String[] tags = keywords.split(",");
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
