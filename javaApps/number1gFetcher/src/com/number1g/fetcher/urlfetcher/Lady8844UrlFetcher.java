package com.number1g.fetcher.urlfetcher;

import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.number1g.fetcher.UrlFetcher;
import com.yuqi.utils.HtmlParserUtils;

public class Lady8844UrlFetcher extends UrlFetcher {
	
	private static Log log = LogFactory.getLog(Lady8844UrlFetcher.class);

	@Override
	public void doFetching(String url, int cateid) {
		Source source = HtmlParserUtils.parseHtmlSource(url);
		List<Element> elements = source.getAllElementsByClass("m_detail");
		Element e;
		String arturl = "";
		for (Element element : elements) {
			e = element.getFirstElement("a");
			arturl = e.getAttributeValue("href");
			if(arturl.contains("/photo/")) {
				continue;
			} else {
				if(articleDao.urlIsFetched(arturl)) {
					log.info("url is fetched: " + arturl);
					break;
//					continue;
				} else {
					articleFetcher.fetcher(arturl, cateid);
				}
			}
		}
	}

}
