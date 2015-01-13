package com.cc.cw.pic;

import java.util.ArrayList;
import java.util.List;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.LinkStringFilter;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.cc.cw.pic.module.Picture;

public class PicImpl {
	private String huaceId;

	private List<Picture> list;
	
	private String pageList = "";

	public static void main(String[] args) {
		PicImpl i = new PicImpl("02accc90-b32d-11da-9e81-3b6e84fcaf27", 0);
		@SuppressWarnings("unused") List<Picture> list = i.getList();
	}

	public PicImpl(String huaceId, int pageStart) {
		String url = "http://www.huace.com/viewPhotoAction.do?method=listMiniature&albumId="
				+ huaceId + "&pager.offset=" + pageStart;
		this.huaceId = huaceId;
		
		try {
			Parser p1;
			Parser p2;
			Parser p3;
			NodeFilter f1 = new HasAttributeFilter("src");
			NodeFilter f2 = new HasAttributeFilter("width", "585");
			NodeFilter f3 = new LinkStringFilter("viewDetailAction.do");
			NodeList l1, l2, l3;
			Parser p = new Parser(url);
			Parser pp = new Parser(url);
			int start;
			int end;
			NodeFilter f = new HasAttributeFilter("onmouseover",
					"this.style.backgroundColor='#E9F2CE'");
			list = new ArrayList<Picture>();
			NodeList nl = p.extractAllNodesThatMatch(f);
			for (int i = 0; i < nl.size(); i++) {
				Picture pic = new Picture();
				String str = nl.elementAt(i).toHtml();
				p1 = Parser.createParser(str, "UTF-8");
				l1 = p1.parse(f1);
				String imgSrc = l1.elementAt(0).toHtml();
				start = imgSrc.indexOf("id=") + 3;
				end = imgSrc.indexOf("&typ");
				imgSrc = imgSrc.substring(start, end);
				pic.setPicId(imgSrc);
				
				p2 = Parser.createParser(str, "UTF-8");
				l2 = p2.parse(f2);
				String imgName = l2.elementAt(0).toHtml();
				start = imgName.indexOf(">") + 1;
				end = imgName.indexOf("</td>");
				imgName = imgName.substring(start, end);
				pic.setPicName(imgName);
				
				p3 = Parser.createParser(str, "UTF-8");
				l3 = p3.parse(f3);
				LinkTag tag = (LinkTag) l3.elementAt(0);
				String imgInfo = tag.getLinkText().trim();
				pic.setPicInfo(imgInfo);
				
				list.add(pic);
			}
			nl = pp.extractAllNodesThatMatch(new HasAttributeFilter("bgcolor", "white"));
			if(nl.size() != 1) 
				pageList = "";
			else {
				pageList = nl.toHtml();
				start = pageList.indexOf("<td>") + 4;
				end = pageList.indexOf("</td>");
				pageList = pageList.substring(start, end);
				pageList = pageList.replaceAll("/./viewPhotoAction.do(.*)albumId=", "/pic/picList/");
				pageList = pageList.replaceAll("&pager.offset=", "/");
			}
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
	}

	public String getHuaceId() {
		return huaceId;
	}

	public void setHuaceId(String huaceId) {
		this.huaceId = huaceId;
	}

	public List<Picture> getList() {
		return list;
	}

	public void setList(List<Picture> list) {
		this.list = list;
	}

	public String getPageList() {
		return pageList;
	}

	public void setPageList(String pageList) {
		this.pageList = pageList;
	}
}
