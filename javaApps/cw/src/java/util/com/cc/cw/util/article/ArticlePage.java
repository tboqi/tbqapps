package com.cc.cw.util.article;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.Source;

public class ArticlePage {

	private int currentPage;

	private int prevPage;

	private int nextPage;

	private int totalPage;

	private String currentContent;

	private List<String> contentList;

	private static int PAGECHARNUM = 800; // 没页字数

	public ArticlePage(int currentPage, String content) {
		Source source = new Source(content);
		List list = source.findAllElements("img");
		if(list != null && list.size()<2){
			contentList = new ArrayList<String>();
			contentList.add(content);
		} else {
			content = before(content);
			content = addp(content);//为开头没有<的内容添加<p>标签，到<br/>前添加</br>
			content = content.replaceAll("<br(.*)>", "</p><p>");
			contentList = parseContentList(content);
		}
		list = null;
		totalPage = contentList.size();
		if (currentPage < totalPage - 1) {
			nextPage = currentPage + 1;
		} else {
			currentPage = totalPage - 1;
			nextPage = currentPage + 1;
		}
		if (nextPage > totalPage - 1)
			nextPage = totalPage - 1;

		if (currentPage > 0) {
			prevPage = currentPage - 1;
		} else {
			prevPage = 0;
			currentPage = 0;
		}

		currentContent = contentList.get(currentPage);
		this.currentPage = currentPage;
	}

	private String before(String content) {
		content = content.replaceAll("<span(.*)>", "");
		content = content.replaceAll("</span>", "");
		return content;
	}

	private String addp(String content) {
		String[] str = content.split("<p>");
		String[] str1;
		String str2;
		String str3 = "";
		for (int i = 0; i < str.length; i++) {
			str1 = str[i].trim().split("</p>");
			str2 = "";
			for (int j = 0; j < str1.length; j++) {
				str1[j] = str1[j].trim();
				//if(StringUtils.isBlank(str1[j]) || StringUtils.equalsIgnoreCase("&nbsp;", str1[j])){
				if(StringUtils.isBlank(str1[j])){
					continue;
				}
				if(str1[j].startsWith("<p"))
					str1[j] =str1[j] + "</p>";
				else
				str1[j] = "<p>" + str1[j] + "</p>";
				str2 += str1[j];
			}
			str3 += str2;
		}
		
		return str3;
	}

	private List<String> parseContentList(String content) {
		Source source = new Source(content);
		List olist = source.getChildElements();
		List<String> nlist = new ArrayList<String>();

		Element e;
		StringBuffer sb = new StringBuffer();
		String old, str;
		int length = 0;

		for (int i = 0; i < olist.size(); i++) {
			e = (Element) olist.get(i);
			old = e.toString();
			sb.append(old);
			length += getElementTextLength(e);
			if (length > PAGECHARNUM) {
				nlist.add(sb.toString());
				length = 0;
				sb = new StringBuffer();
			}
		}
		str = sb.toString();
		if (nlist.size() == 0)
			nlist.add(str);
		else {
			if (str.length() < PAGECHARNUM / 10)
				nlist.set(nlist.size()-1, nlist.get(nlist.size()-1) + str);
			else
				nlist.add(str);
		}
		return nlist;
	}

	private int getElementTextLength(Element e) {
		List list = e.findAllElements("img");
		int imglength = 0;
		if (list != null) {
			imglength = list.size() * 300;
		}
		String str = e.getTextExtractor().toString();
		int length = str.length();

		return imglength + length;
	}

	public List<String> getContentList() {
		return contentList;
	}

	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}

	public String getCurrentContent() {
		return currentContent;
	}

	public void setCurrentContent(String currentContent) {
		this.currentContent = currentContent;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
