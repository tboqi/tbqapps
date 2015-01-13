package com.cc.cw.web.util;

import com.cc.cw.web.CwConfiguration;

public class URLRewriteManager {
	private final static String ARTICLE_URL = CwConfiguration.create().get("article.url");
	private final static String CHANNEL_LIST_URL = CwConfiguration.create().get("channel.list.url");
	private final static String TAGS_LIST_URL = CwConfiguration.create().get("tags.list.url");
	private final static String VOTE_ARTICLE_URL = CwConfiguration.create().get("vote.article.url");
	private final static String VOTE_CHANNEL_URL = CwConfiguration.create().get("vote.channel.url");
	private final static String CHANNEL_APPLY_URL = CwConfiguration.create().get("channel.apply.url");
	private final static String LOGIN_URL = CwConfiguration.create().get("login.url");
	private final static String CHANNEL_URL = CwConfiguration.create().get("channel.url");
	private final static String USERMANAGE_URL = CwConfiguration.create().get("usermanage.url");
	private final static String ARTICLEMANAGE_URL = CwConfiguration.create().get("articlemanage.url");
	private final static String MESSAGE_URL = CwConfiguration.create().get("message.url");
	private final static String LOGOUT_URL = CwConfiguration.create().get("logout.url");
	private final static String NEWMESSAGE_URL = CwConfiguration.create().get("newmessage.url");
	private final static String DELETE_MESSAGE_URL = CwConfiguration.create().get("message.delete.url");
	private final static String VIEW_MESSAGE_URL = CwConfiguration.create().get("message.view.url");
	private final static String NEW_URL = CwConfiguration.create().get("new.url");
	
	public static String getArticleUrl(String contextPath,int param){
		return contextPath + ARTICLE_URL.replaceAll("#1", ""+param);
	}

	public static String getChannelUrl(String contextPath,int param){
		return contextPath + CHANNEL_URL.replaceAll("#1", ""+param);
	}
	
	public static String getChannelListUrl(String contextPath){
		return contextPath + CHANNEL_LIST_URL;
		
	}
	
	public static String getTagsListUrl(String contextPath){
		return contextPath + TAGS_LIST_URL;
		
	}
	
	public static String getArticleVoteUrl(String contextPath,int param){
		return contextPath + VOTE_ARTICLE_URL.replaceAll("#1", ""+param);
		
	}
	
	public static String getChannelVoteUrl(String contextPath,int param){
		return contextPath + VOTE_CHANNEL_URL.replaceAll("#1", ""+param);
		
	}
	
	public static String getChannelApplyUrl(String contextPath){
		return contextPath + CHANNEL_APPLY_URL;
		
	}
	
	public static String getLoginUrl(String contextPath){
		return contextPath + LOGIN_URL;
		
	}
	
	/**
	 * 处理静态分页url
	 * @param url 例如：http://www.chuanwen.com.cn/channel/apply/"pageNo".html
	 * @param pageNo
	 * @return
	 */
	public static String getPaginationUrl(String url , int pageNo){
		return url + pageNo + ".html";
		
	}
	
	public static String getUserManageUrl(String contextPath){
		return contextPath + USERMANAGE_URL;
	}
	
	public static String getArticleManageUrl(String contextPath){
		return contextPath + ARTICLEMANAGE_URL;
	}
	
	public static String getMessageUrl(String contextPath, String param){
		return contextPath + MESSAGE_URL.replaceAll("#1", param);
	}
	
	public static String getLogoutUrl(String contextPath){
		return contextPath + LOGOUT_URL;
	}
	
	public static String getNewMessageUrl(String contextPath, int param){
		return contextPath + NEWMESSAGE_URL.replaceAll("#1", ""+param);
	}
	
	public static String getDeleteMessageUrl(String contextPath, String state, int param){
		String path = DELETE_MESSAGE_URL.replaceAll("#1", state);
		path = path.replaceAll("#2", ""+param);
		return contextPath + path;
	}

	public static String getViewMessageUrl(String contextPath, int param){
		return contextPath + VIEW_MESSAGE_URL.replaceAll("#1", ""+param);
	}
	
	public static String getNewUrl(String contextPath){
		return contextPath + NEW_URL;
	}
}
