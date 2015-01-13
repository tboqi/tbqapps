package com.cc.cw.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Channel;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ChannelService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndContentImpl;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndFeedImpl;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedOutput;

@SuppressWarnings("serial")
public class RssServlet extends HttpServlet {
	
	private static final String DEFAULT_FEED_TYPE = "default.feed.type";
    private static final String MIME_TYPE = "application/xml; charset=UTF-8";
    private static final String DEFAULT_RSSCOUNT = "default.rss.count";
    private String _defaultFeedType;
    private String rssCount;
    
    public void init() {
        _defaultFeedType = getServletConfig().getInitParameter(DEFAULT_FEED_TYPE);
        _defaultFeedType = (_defaultFeedType!=null) ? _defaultFeedType : "atom_0.3";
        rssCount = getServletConfig().getInitParameter(DEFAULT_RSSCOUNT);
        rssCount = (rssCount != null) ? rssCount : "20";
    }
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String feedType = request.getParameter("feedType");
            int channelId = Integer.parseInt(request.getParameter("channelId") == null ? "0":request.getParameter("channelId"));
            
            SyndFeed feed = getFeed(feedType, channelId, request, getServletContext());
            feed.setFeedType(_defaultFeedType);

            response.setContentType(MIME_TYPE);
            SyndFeedOutput output = new SyndFeedOutput();
            output.output(feed,response.getWriter());
        }
        catch (FeedException ex) {
            //String msg = COULD_NOT_GENERATE_FEED_ERROR;
            //log(msg,ex);
            ex.printStackTrace();
        }
	}
	
	protected SyndFeed getFeed(String type, int channelId, HttpServletRequest request, ServletContext servletContext) throws IOException,FeedException{
        if("channel".equals(type))
        	return getChannelsFeed(request,servletContext);
        else if("newArticle".equals(type))
        	return getNewArticlesFeed(request,servletContext);
        else
        	return getArticlesFeed(channelId, request,servletContext);
	}
	
	protected SyndFeed getNewArticlesFeed(HttpServletRequest request, ServletContext servletContext) {
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		SimpleArticleService service = (SimpleArticleService)ctx.getBean("simpleArticleService");
		SyndFeed feed = new SyndFeedImpl();
		feed.setTitle("传闻网最新文章信息");
        feed.setLink("http://www.chuanwen.com.cn");
        feed.setDescription("关注焦点,传我精彩,尽在传闻网.");
        feed.setCopyright("http://www.chuanwen.com.cn");
        feed.setLanguage("zh-cn");
        List<SyndEntry> entries = new ArrayList<SyndEntry>();
        List<SimpleArticle> artList = service.getNewArticles(1, 20);
        for(SimpleArticle article : artList){
        	SyndEntry entry = new SyndEntryImpl();
    		entry.setTitle(article.getTitle());
            entry.setLink("http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/rumour/rumour.action?articleId="+article.getId());
            entry.setPublishedDate(article.getCreateDate());
            SyndContent description = new SyndContentImpl();
            description.setType("text/plain");
            String des = Convert.getHtmlRealText(article.getContent());
            //将文章内容进行截取，只显示一定的长度
            if(des.length() > 100)
            	des = Convert.getHtmlRealText(des.substring(0, 100))+"......";
            description.setValue(des);
            entry.setDescription(description);
            entries.add(entry);
        }
        feed.setEntries(entries);
		return feed;
	}

	/**
	 * 构造文章的RSS Feed
	 * @param request
	 * @param servletContext
	 * @return SyndFeed
	 */
	protected SyndFeed getChannelsFeed(HttpServletRequest request, ServletContext servletContext){
		SyndFeed feed = new SyndFeedImpl();

        feed.setTitle("传闻网频道信息");
        feed.setLink("http://www.chuanwen.com.cn");
        feed.setDescription("关注焦点,传我精彩,尽在传闻网.");
        feed.setCopyright("http://www.chuanwen.com.cn");
        feed.setLanguage("zh-cn");
		
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		ChannelService service = (ChannelService)ctx.getBean("channelService");
		List<Channel> channelList = service.getNewChannelsOrderByDate(Integer.parseInt(rssCount));
		List<SyndEntry> entries = new ArrayList<SyndEntry>();
		if(channelList != null){
        	for(Channel channel : channelList){
        		SyndEntry entry = new SyndEntryImpl();
        		entry.setTitle(channel.getName());
                entry.setLink(request.getServerName()+request.getServerPort()+request.getContextPath()+"/channelarticlelist.action?chlId="+channel.getId());
                entry.setPublishedDate(channel.getCreateDate());
                SyndContent description = new SyndContentImpl();
                description.setType("text/plain");
                description.setValue(channel.getDescription());
                entry.setDescription(description);
                entries.add(entry);
        	}
        }
		feed.setEntries(entries);
		return feed;
	}
	
	/**
	 * 构造频道的RSS Feed
	 * @param request
	 * @param servletContext
	 * @return SyndFeed
	 */
	@SuppressWarnings("unchecked")
	protected SyndFeed getArticlesFeed(int channelId, HttpServletRequest request, ServletContext servletContext){
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		SimpleArticleService service = (SimpleArticleService)ctx.getBean("simpleArticleService");
		ChannelService channelService = (ChannelService)ctx.getBean("channelService");
		Channel channel = channelService.getById(channelId);
		String title = "";
		String desc = "关注焦点,传我精彩,尽在传闻网!";
		if(channel != null){
			title = channel.getName();
			if(!title.endsWith("频道")){
				title += "频道";
			}
			if(channel.getDescription().length() > 0)
				desc += channel.getDescription();
		}
		SyndFeed feed = new SyndFeedImpl();

        feed.setTitle("传闻网"+title);
        feed.setLink("http://www.chuanwen.com.cn");
        feed.setDescription(desc);
        feed.setCopyright("http://www.chuanwen.com.cn");
        feed.setLanguage("zh-cn");
		
		
		List<SimpleArticle> articleList = service.getArticlesByChannelId(channelId,1, Integer.parseInt(rssCount));
		List<SyndEntry> entries = new ArrayList<SyndEntry>();
		if(articleList != null){
        	for(SimpleArticle article : articleList){
        		SyndEntry entry = new SyndEntryImpl();
        		entry.setTitle(article.getTitle());
                entry.setLink("http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/rumour/rumour.action?articleId="+article.getId());
                entry.setPublishedDate(article.getCreateDate());
                SyndContent description = new SyndContentImpl();
                description.setType("text/plain");
                String des = Convert.getHtmlRealText(article.getContent());
                //将文章内容进行截取，只显示一定的长度
                if(des.length() > 100)
                	des = Convert.getHtmlRealText(des.substring(0, 100))+"......";
                description.setValue(des);
                entry.setDescription(description);
                entries.add(entry);
        	}
        }
		feed.setEntries(entries);
		return feed;
	}
	
	public static void main(String[] args){

	}
}
