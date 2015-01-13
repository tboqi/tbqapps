package com.yuqi.rssreader;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class RssReader {
	private SyndFeed feed;
	public SyndFeed getFeed() {
		return feed;
	}

	public void setFeed(SyndFeed feed) {
		this.feed = feed;
	}

	public RssReader(String feedUrlString) {
		URL feedUrl;
		try {
			feedUrl = new URL(feedUrlString);
			SyndFeedInput input = new SyndFeedInput();  
			this.feed = input.build(new XmlReader(feedUrl));
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (FeedException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}  
	}
	
	@SuppressWarnings("unchecked")
	public List<Article> getArticles() {
		List<Article> list = new ArrayList<Article>();
		List entries = feed.getEntries();
		for (Iterator iterator = entries.iterator(); iterator.hasNext();) {
			SyndEntry entry = (SyndEntry) iterator.next();
			Article art = new Article();
			art.setAuthor(entry.getAuthor());
			art.setDescription(entry.getDescription().getValue());
			art.setFeedName(feed.getTitle());
			art.setFeedUrl(feed.getLink());
			art.setLink(entry.getLink());
			art.setPublishedDate(entry.getPublishedDate());
			art.setTitle(entry.getTitle());
			list.add(art);
		}
		return list;
	}
	
	/**
	 * @param args
	 */
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		RssReader reader = new RssReader("http://xtg50018.blog.163.com/rss/");
		List<Article> l = reader.getArticles();
		for (Iterator iterator = l.iterator(); iterator.hasNext();) {
			Article article = (Article) iterator.next();
			System.out.println(article.toString());
		}
	}

}
