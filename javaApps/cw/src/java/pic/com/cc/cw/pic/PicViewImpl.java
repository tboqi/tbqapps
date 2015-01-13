package com.cc.cw.pic;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.cc.cw.pic.module.Picture;

public class PicViewImpl {
	
	private String picList;
	
	private Picture pic;
	
	private boolean hasNext;

	public PicViewImpl(String hid, int p){
		String url = "http://www.huace.com/viewDetailAction.do?" +
				"maxPageItems=1&maxIndexPages=10&method=listDetail&" +
				"albumId=" + hid + "&nodeId=bj01&pager.offset=" + p;
		try {
			Parser myParser = new Parser(url);
			
			NodeFilter tableFilter = new TagNameFilter("table");
			NodeList nl = myParser.extractAllNodesThatMatch(tableFilter);
			picList = nl.elementAt(5).toHtml();
			int start = picList.indexOf("<td>") + 4;
			int end = picList.indexOf("</td>");
			picList = picList.substring(start, end);
			picList = picList.replaceAll("/./viewDetailAction.do(.*)albumId=", "/pic/picView/");
			picList = picList.replaceAll("&nodeId=bj01&pager.offset=", "/");
			hasNext = picList.contains("下一页");
			pic = new Picture();
			NodeFilter f1 = new HasAttributeFilter("src");
			String maintable = nl.elementAt(7).toHtml();
			Parser p1 = Parser.createParser(maintable, "UTF-8");
			NodeList l1 = p1.parse(f1);
			String imgSrc = l1.toHtml();
			start = imgSrc.indexOf("id=") + 3;
			end = imgSrc.indexOf("&typ");
			imgSrc = imgSrc.substring(start, end);
			pic.setPicId(imgSrc);
			start = maintable.indexOf("<font color=\"#505050\">") + 22;
			end = maintable.indexOf("</font>");
			String imgName = maintable.substring(start, end);
			pic.setPicName(imgName);
			maintable = maintable.substring(end+6);
			end = maintable.indexOf("</font>");
			maintable = maintable.substring(end+6);
			start = maintable.indexOf("<font color=\"#505050\">") + 22;
			end = maintable.indexOf("</font>");
			String imgInfo = maintable.substring(start, end);
			imgInfo = imgInfo.substring(5);
			pic.setPicInfo(imgInfo);
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
//		PicViewImpl i = new PicViewImpl("02accc90-b32d-11da-9e81-3b6e84fcaf27", 0);
	}

	public String getPicList() {
		return picList;
	}

	public void setPicList(String picList) {
		this.picList = picList;
	}

	public Picture getPic() {
		return pic;
	}

	public void setPic(Picture pic) {
		this.pic = pic;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
}
