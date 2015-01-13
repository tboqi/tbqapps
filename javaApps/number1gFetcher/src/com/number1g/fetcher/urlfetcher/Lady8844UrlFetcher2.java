package com.number1g.fetcher.urlfetcher;

import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.number1g.fetcher.UrlFetcher;
import com.yuqi.utils.HtmlParserUtils;

public class Lady8844UrlFetcher2 extends UrlFetcher {
	
	private static Log log = LogFactory.getLog(Lady8844UrlFetcher.class);

	@Override
	public void doFetching(String url, int cateid) {
		Source source = HtmlParserUtils.parseHtmlSource(url);
		if(source == null) {
			log.error("source error: " + url);
			return;
		}
		Element e = HtmlParserUtils.getElementByClass2(source, "hotArt");
		if(e == null) {
			
		} else {
			List<Element> elements = e.getAllElements("a");
			String arturl = "";
			for (Element element : elements) {
				arturl = element.getAttributeValue("href");
				if(arturl.contains("/photo/")) {
					continue;
				} else {
					if(articleDao.urlIsFetched(arturl)) {
						log.info("url is fetched: " + arturl);
						continue;
					} else {
						log.info("url fetching: " + arturl);
						articleFetcher.fetcher(arturl, cateid);
					}
				}
			}
		}
		e = HtmlParserUtils.getElementByClass2(source, "ArtList");
		if(e == null) {
			
		} else {
			List<Element> elements = e.getAllElements("a");
			String arturl = "";
			for (Element element : elements) {
				arturl = element.getAttributeValue("href");
				if(arturl.contains("/photo/")) {
					continue;
				} else {
					if(articleDao.urlIsFetched(arturl)) {
						log.info("url is fetched: " + arturl);
						break;
					} else {
						log.info("url fetching: " + arturl);
						articleFetcher.fetcher(arturl, cateid);
					}
				}
			}
		}
	}

}
