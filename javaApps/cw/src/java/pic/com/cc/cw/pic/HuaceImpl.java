package com.cc.cw.pic;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.LinkStringFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.cc.cw.pic.module.Huace;

public class HuaceImpl {
	private Parser myParser;

	private Parser myParser1;

	private String query;

	public HuaceImpl(String query, int offset) {
		String url = "http://www.huace.com/searchAction.do?"
				+ "method=search&query=" + query + "&resType=1&pager.offset="
				+ offset;
		try {
			myParser = new Parser(url);
			myParser1 = new Parser(url);
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			// e.printStackTrace();
		}
		this.query = urlEncodeGBK2UTF8(query);
	}

	public String getPageList() {
		NodeFilter tableFilter = new TagNameFilter("table");
		NodeList nl;
		String str = "";
		try {
			nl = myParser1.extractAllNodesThatMatch(tableFilter);
			str = nl.elementAt(5).toHtml();
			if (!str.contains("searchAction.do")) {
				return "";
			}
			int start = str.indexOf("<td>") + 4;
			int end = str.indexOf("</td>");
			str = str.substring(start, end);
			str = str.replaceAll("/./searchAction.do(.*)offset=",
					"/pic/huaceList/" + query + "/");
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			// e.printStackTrace();
			// return "";
			tableFilter = null;
			nl = null;
			str = "";
		}
		return str;
	}

	public List<Huace> getHuaceList() {
		List<Huace> list = new ArrayList<Huace>();
		String ps;
		try {
			NodeFilter f = new HasAttributeFilter("onmouseover",
					"this.style.backgroundColor='#E9F2CE'");
			NodeList nodeList = myParser.parse(f);
			for (int i = 0; i < nodeList.size(); i++) {
				Huace hc = new Huace();
				ps = nodeList.elementAt(i).toHtml();
				hc.setHuaceId(getHuaceId(ps));
				hc.setHuaceName(getHuaceMap(ps).get("name"));
				hc.setHuaceInfo(getHuaceMap(ps).get("info"));
				list.add(hc);
			}
		} catch (ParserException e) {
			// e.printStackTrace();
			ps = null;
			list = null;
		}
		return list;
	}

	private Map<String, String> getHuaceMap(String ps) {
		Map<String, String> map = new HashMap<String, String>();
		NodeFilter f2 = new LinkStringFilter("viewPhotoAction.do");
		Parser p1 = Parser.createParser(ps, "UTF-8");
		try {
			NodeList nl = p1.parse(f2);
			LinkTag tag = (LinkTag) nl.elementAt(1);
			String name = tag.getLinkText().trim();
			map.put("name", name);
			LinkTag tag1 = (LinkTag) nl.elementAt(2);
			String info = tag1.getLinkText().trim();
			map.put("info", info.substring(3, info.length()));
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
			return null;
		}
		return map;
	}

	private String getHuaceId(String ps) {
		NodeFilter f1 = new HasAttributeFilter("src");
		Parser p1 = Parser.createParser(ps, "UTF-8");
		String imgSrc;
		try {
			imgSrc = p1.extractAllNodesThatMatch(f1).toHtml();
			int start = imgSrc.indexOf("id=") + 3;
			int end = imgSrc.indexOf("&type");
			imgSrc = imgSrc.substring(start, end);
			return imgSrc;
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}

		return null;
	}

	public static String urlEncodeGBK2UTF8(String gbkencode) {
		try {
			String temp = URLDecoder.decode(gbkencode, "GBK");
			return URLEncoder.encode(temp, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

	public static String urlEncode(String arg, String charset) {
		try {
			arg = URLEncoder.encode(arg, charset);
		} catch (UnsupportedEncodingException e) {
			return "";
		}
		return arg;
	}

	public static void main(String[] args) throws UnsupportedEncodingException {

	}
}
