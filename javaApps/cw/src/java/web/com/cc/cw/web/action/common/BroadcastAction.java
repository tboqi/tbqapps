package com.cc.cw.web.action.common;

import java.util.Date;
import java.util.List;

import com.cc.cw.domain.Broadcast;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.BroadcastService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.web.util.Constants;

public class BroadcastAction extends SessionActionSupport{

	private static final long serialVersionUID = -6839968573287890817L;
	
	private BroadcastService broadcastService;
	private SimpleArticleService simpleArticleService;
	private Broadcast broadcast;
	private List<Broadcast> broadcastList;
	private static Object[] o = new Object[2];
	/** 区别调用类型 */
	private String actionFlag;
	/** 提示信息 */
	private String msg;
	private String message;
	/** 页面传入的文章连接地址 */
	private String articlehref;
	/** 页面传入的文章标题 */
	private String articleTitle;

	@SuppressWarnings("unchecked")
	public String execute(){
		if(actionFlag !=null && actionFlag.equalsIgnoreCase("addbroadcast")){//发送广播
			message = null;
			String sid = null;
			SimpleArticle article = null;
			try{
				if(articlehref!=null && !articlehref.equals("")){
					int index = articlehref.indexOf("/r/");
					if(index<0){
						message = "您输入的链接地址有误，发布的文章必须为传闻网的链接地址";
						return INPUT;
					}
					if(articlehref.endsWith("#")){
						sid = articlehref.substring(index+3, articlehref.length()-1);
					}else{
						sid = articlehref.substring(index+3);
					}
				}
				int id = Integer.parseInt(sid);
			    article = simpleArticleService.getById(id);
			}catch(Exception e){
				message = "您输入的链接地址有误，发布的文章必须为传闻网的链接地址";
				return INPUT;
			}
			if(article==null || article.getTitle()==null){
				message = "您输入的链接地址有误，发布的文章必须为传闻网的链接地址";
				return INPUT;
			}
			Member member = (Member)session.get("member");
			broadcast.setArticleId(article.getId());
			broadcast.setArticleTitle(article.getTitle());
			broadcast.setMemberId(member.getId());
			broadcast.setMemberName(member.getUserName());
			int bid = broadcastService.add(broadcast);
			if(bid > 0){
				msg = "成功发送广播";
			}
		}else if(actionFlag !=null && actionFlag.equalsIgnoreCase("currentBroadcast")){//首页广播选取
				if(o[0] != null && (new Date().getTime()-((Date)o[0]).getTime()) < 1 * 60 * 1000){
					broadcastList = (List<Broadcast>) o[1];
				}else{
					broadcastList = broadcastService.getBroadcastOrderByDate(0, Constants.BROADCAST_INDEXNUM);
					o[0] = new Date();
					o[1] = broadcastList;
				}
//			broadcastList = broadcastService.getBroadcastOrderByDate(0, 10);
			return "broadcast_tmp";
		}
		return INPUT;
	}
	public String getMsg() {
		return msg;
	}

	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}

	public void setBroadcastService(BroadcastService broadcastService) {
		this.broadcastService = broadcastService;
	}
	public Broadcast getBroadcast() {
		return broadcast;
	}
	public void setBroadcast(Broadcast broadcast) {
		this.broadcast = broadcast;
	}
	public String getArticlehref() {
		return articlehref;
	}
	public void setArticlehref(String articlehref) {
		this.articlehref = articlehref;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
	public String getMessage() {
		return message;
	}
	public List<Broadcast> getBroadcastList() {
		return broadcastList;
	}

}
