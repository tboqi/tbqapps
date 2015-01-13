package com.cc.cw.web.union;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UnionUser;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.UnionUserService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.action.common.BaseActionSupport;
import com.opensymphony.webwork.ServletActionContext;

public class NewArticleListAction extends BaseActionSupport {

	private static final long serialVersionUID = 2391891074066660647L;
	
	private List<Map> articleMapList;
	private SimpleArticleService sas;
	private int pn;
	private String pagnation;
	private MemberService ms;
	private LabelService ls;
	
	private UnionUser uu;
	private UnionUserService unionUserService;
	
	/** 位于最新文章列表页面右上角的图片文章 */
	private SimpleArticle newArticle;

	@SuppressWarnings("unchecked")
	public String execute(){
		String domainName = ServletActionContext.getRequest().getServerName();
		String ip = ServletActionContext.getRequest().getRemoteAddr();
		unionUserService.saveIp(ip, domainName);
		uu = (UnionUser)unionUserService.getWebsiteConfigMap(domainName);
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(sas.getNewArticlesCount());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/union/newArticles.action?");
		pagnation = p.getPagination();
		List<SimpleArticle> list = sas.getNewArticles(pn, 10);
		if(list != null && list.size() > 0){
			if(articleMapList == null)
				articleMapList = new ArrayList<Map>();
			for(SimpleArticle sa : list){
				if(sa == null)continue;
				String title = sa.getTitle();
				String content = sa.getContent();
				String imgSrc = ArticleHelper.getCoverSrc(sa.getContent());
				content = Convert.getHtmlRealText(sa.getContent());
				content = content.length() > 300 ? content.substring(0,300)+"...":content;
				if(imgSrc == null || imgSrc.equals(""))
					imgSrc = "";
				else{
					newArticle = sa;
					newArticle.setImgSrc(imgSrc);
					newArticle.setContent(content);
				}
				
				int rate = sa.getRate();
				if(title==null)title="无标题";
				title = Convert.getHtmlRealText(title);
				if(content==null)content="无内容";
				content=Convert.getHtmlRealText(content);
				if(content.length()>100)content=content.substring(0,100)+"...";
				Map map = new HashMap();
				map.put("articleId", sa.getId());
				map.put("articleTitle", title);
				map.put("articleContent",content);
				map.put("createDate", String.format("%1$tY-%1$tm-%1$td %1$tT",sa.getCreateDate()));
				map.put("member", ms.get(sa.getMemberId()));
				map.put("label", ls.getContentByArticleId(sa.getId()));
				map.put("channelId", sa.getChannelId());
				map.put("rate", rate);
				map.put("state", sa.getState());
				map.put("voteResultType", sa.getVoteResultType());
				map.put("imgSrc" , imgSrc);
				articleMapList.add(map);
			}
		}
		
		return SUCCESS;
	}

	public List<Map> getArticleMapList() {
		return articleMapList;
	}

	public SimpleArticle getNewArticle() {
		return newArticle;
	}

	public String getPagnation() {
		return pagnation;
	}

	public void setLs(LabelService ls) {
		this.ls = ls;
	}

	public void setMs(MemberService ms) {
		this.ms = ms;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public void setSas(SimpleArticleService sas) {
		this.sas = sas;
	}

	public UnionUserService getUnionUserService() {
		return unionUserService;
	}

	public void setUnionUserService(UnionUserService unionUserService) {
		this.unionUserService = unionUserService;
	}

	public UnionUser getUu() {
		return uu;
	}

	public void setUu(UnionUser uu) {
		this.uu = uu;
	}

	public LabelService getLs() {
		return ls;
	}

	public MemberService getMs() {
		return ms;
	}

	public int getPn() {
		return pn;
	}

	public SimpleArticleService getSas() {
		return sas;
	}

	public void setArticleMapList(List<Map> articleMapList) {
		this.articleMapList = articleMapList;
	}

	public void setNewArticle(SimpleArticle newArticle) {
		this.newArticle = newArticle;
	}

	public void setPagnation(String pagnation) {
		this.pagnation = pagnation;
	}
}
