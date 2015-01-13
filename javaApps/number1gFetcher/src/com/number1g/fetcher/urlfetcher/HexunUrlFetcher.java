package com.number1g.fetcher.urlfetcher;

import java.util.Iterator;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.number1g.dao.ArticleDao;
import com.number1g.entity.Category;
import com.number1g.fetcher.ArticleFetcher;
import com.number1g.fetcher.UrlFetcher;
import com.yuqi.utils.HtmlParserUtils;

public class HexunUrlFetcher extends UrlFetcher {

	private static Log log = LogFactory.getLog(HexunUrlFetcher.class);
	
	public void doFetching(String url, int cateid) {
		Source source = HtmlParserUtils.parseHtmlSource(url);
		Element element = HtmlParserUtils.getElementByClass(source, "temp01");
		if(element != null) {
			List<Element> elements = element.getAllElements("a");
			String arturl = "";
			for (Iterator<Element> iterator = elements.iterator(); iterator.hasNext();) {
				Element e = (Element) iterator.next();
				arturl = e.getAttributeValue("href");
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

	private Category cate;
	
	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	private ArticleDao articleDao;
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	private ArticleFetcher articleFetcher;

	public ArticleFetcher getArticleFetcher() {
		return articleFetcher;
	}

	public void setArticleFetcher(ArticleFetcher articleFetcher) {
		this.articleFetcher = articleFetcher;
	}
}
