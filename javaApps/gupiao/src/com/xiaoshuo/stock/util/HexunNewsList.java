package com.xiaoshuo.stock.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.EndTag;
import au.id.jericho.lib.html.Source;
import au.id.jericho.lib.html.StartTag;
import au.id.jericho.lib.html.Tag;

import com.xiaoshuo.stock.domain.News;
import com.xiaoshuo.stock.impl.NewsManagerImpl;
import com.xiaoshuo.stock.util.MyUtils;

/**
 * @author 唐伯琦
 */
public class HexunNewsList {
	private static Log log = LogFactory.getLog(HexunNewsList.class);

	public static void parse(String stockNum, String url) {
		News news = new News();
		try {
			Source source = new Source(new URL(url));
			List list = source.findAllStartTags("table");
			if (list.size() < 4) {
				// 没有新闻列表
				return;
			}
			Tag tag = (Tag) list.get(3);
			Element e = tag.getElement();
			List list1 = e.findAllElements("tr");
			int i = 0, j = 0;
			for (Iterator iter = list1.iterator(); iter.hasNext() && i < 42;) {
				i++;
				j++;
				Element e1 = (Element) iter.next();
				if (j == 6) {
					j = 0;
					continue;
				}
				List l1 = e1.findAllElements("a");
				Element e2 = (Element) l1.get(0);
				String href = e2.getAttributeValue("href");
				href = href.substring(href.indexOf("/urwh"), href
						.indexOf("shtml") + 5);
				href = "http://stockdata.stock.hexun.com"
						+ href.replaceAll("			", "").replaceAll("\r\n", "");
				if (NewsManagerImpl.hasOldUrl(href))
					break;
				String title = e2.getTextExtractor().toString();
				String date = ((Element) (e1.getChildElements().get(2)))
						.getTextExtractor().toString();
				news.setOldUrl(href);
				news.setPubDate(MyUtils.str2date(date, "yyyy.MM.dd"));
				news.setStockNum(stockNum);
				news.setTitle(title);
				news = parseContent(news);
				log.info(href);
				NewsManagerImpl.add(news);
			}
			// 检查是否存在下一页
			if (list.size() < 5) {
				log.info("抓取结束");
				// 没有下一页
				return;
			} else {
				tag = (Tag) list.get(4);
				e = tag.getElement();
				list1 = e.findAllElements("a");
				for (i = 0; i < list1.size(); i++) {
					e = (Element) list1.get(i);
					String atext = e.toString();
					if (atext.contains("下一页")) {
						String href = "http://stockdata.stock.hexun.com"
								+ e.getAttributeValue("href");
						log.info("抓取下一页:" + href);
						parse(stockNum, href);
					} else {
						continue;
					}
				}
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static News parseContent(News news) {
		String url = news.getOldUrl();
		try {
			Source source = new Source(new URL(url));
			List list = source.findAllStartTags("class", "textcss", true);
			if (list == null || list.size() < 1)
				return null;
			StartTag stag = (StartTag) list.get(0);
			Element e = stag.getElement();
			EndTag etag = e.getEndTag();
			String eStr = e.toString();
			String content = eStr.replaceFirst(stag.toString(), "")
					.replaceFirst(etag.toString(), "");
			news.setContent(content);
		} catch (MalformedURLException e) {
			news = null;
			// e.printStackTrace();
		} catch (IOException e) {
			// e.printStackTrace();
			news = null;
		}
		return news;
	}

	public static void main(String[] args) {
		//HexunNewsList hnl = new HexunNewsList();
		HexunNewsList.parse("000001",
				"http://stockdata.stock.hexun.com/urwh/list/000001.shtml");
	}

	public static String buildUrl(String stockNum) {
		return "http://stockdata.stock.hexun.com/urwh/list/" + stockNum
				+ ".shtml";
	}
}
