package xiaoshuo2pdf;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.LinkStringFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

/**
 * 分析url指定的文件， 分析出文章标题的列表， 判断是否有下一页，如果有进入下一页
 * 
 * 适用于小说联盟
 * 
 * @author tbq
 * 
 */
public class HtmlNode {

	public static String weblink = "http://www2.xiaoshuo.com:8180/jsp/ox1/";
	public static boolean isHasNextPage(String url){
		Parser myParser;
		String divtag;
		boolean b = false;
		try {
			myParser = new Parser(url);
			String filterStr = "div";
			NodeFilter filter = new TagNameFilter(filterStr);
			NodeList nodeList = myParser.extractAllNodesThatMatch(filter);
			divtag = ((Div) nodeList.elementAt(8)).toHtml();
			if(divtag.contains("下一页"))
				b = true;
			else
				b = false;
		} catch (ParserException e) {
			return b;
			//e.printStackTrace();
		}
		return b;
	}
	
	private static String getMainTable(String url){
		Parser myParser;
		try {
			myParser = new Parser(url);
			NodeFilter filter = new TagNameFilter("table");
			NodeList nodeList = myParser.extractAllNodesThatMatch(filter);
			String str = ((TableTag) nodeList.elementAt(0)).toHtml();
			return str;
		} catch (ParserException e) {
			return null;
			//e.printStackTrace();
		}
	}
	
	public static List<Map<String, String>> getBookLinkList(String url){
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		String s = getMainTable(url);
		Parser parser = Parser.createParser(s, "GBK");
		try {
			NodeList nodeList = parser.parse(new LinkStringFilter("readindex.jsp"));
			LinkTag tag = new LinkTag();
			LinkTag tag1 = new LinkTag();
			for (int i=0; i<nodeList.size(); i++) {
				tag = (LinkTag)nodeList.elementAt(i);
				Map<String, String> map = new HashMap<String, String>();
				map.put("bookTitle", tag.getLinkText().trim());
				map.put("bookLink", weblink + tag.getLink());
				
				Parser parser1 = Parser.createParser(s, "GBK");
				NodeList nodeList1 = parser1.parse(new LinkStringFilter("booksearch.jsp"));
				tag1 = (LinkTag)nodeList1.elementAt(i);
				map.put("bookAuthor", tag1.getLinkText().trim());
				
				list.add(map);
		    	System.out.println(i + "====" + tag.getLinkText().trim() + 
		    			"-----------" + weblink + tag.getLink() + "-----" + tag1.getLinkText().trim());
			}
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Map<String, String>> getChapterLink(String bookurl) {
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		
		try {
			Parser parser = new Parser(bookurl);
			NodeList nodeList = parser.parse(new LinkStringFilter("readqueue.jsp"));
			LinkTag tag = new LinkTag();
			for (int i=0; i<nodeList.size(); i++) {
				tag = (LinkTag)nodeList.elementAt(i);
				Map<String, String> map = new HashMap<String, String>();
				map.put("chapterTitle", tag.getLinkText().trim());
				map.put("chapterLink", tag.getLink());
				list.add(map);
				System.out.println(i + "====" + tag.getLinkText().trim() + 
		    			"-----------" + tag.getLink());
			}
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<String> getChapterContent(String chapterurl){
		try {
			Parser parser = new Parser(chapterurl);
			String filterStr = "div";
			NodeFilter filter = new TagNameFilter(filterStr);
			NodeList nodeList = parser.extractAllNodesThatMatch(filter);
			NodeList list = nodeList.elementAt(7).getChildren();
			List<String> str = new ArrayList<String>();
			String s;
			for(int i=0; i<list.size(); i++){
				s = list.elementAt(i).toPlainTextString().trim();
				if(s != null && s.length() > 0 && !s.equals("")) {
					str.add(s);
					//System.out.println(i + "------" + s);
				}
			}
			return str;
		} catch (ParserException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
			return null;
		}
	}
	
	public static Document parseXmlDocument(String bookurl){
		SAXReader reader = new SAXReader();
   	 	Document doc = null;
		try {
			doc = reader.read(new File("pdfTemplet.xml"));
			Element root = doc.getRootElement();
			root.setAttributeValue("title", "title");
	   	 	root.setAttributeValue("author", "author");
		} catch (DocumentException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
   	 	
		List<Map<String, String>> list = getChapterLink(bookurl);
//		for()
		
		return doc;
	}
	
	public static void main(String[] args) {
		String resource = weblink + "booklist.jsp?id=101&page=1";
		String bookurl = weblink + "readindex.jsp?id=0019995";
		String chapterurl = weblink + "readqueue.jsp?bookid=0019995&chapter=12983";
		getChapterContent(chapterurl);
		//System.out.println(getChapterContent(chapterurl));
	}
}
