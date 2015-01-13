package com.cc.cw.web.action.common;

import java.util.List;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.SimpleArticleService;

@SuppressWarnings("serial")
public class GetHttpReslutAction extends SessionActionSupport {

	private int status;

	private int suggest;

	private int against;

	private String url;

	private SimpleArticleService saService;

	public String execute() {
		if (url == null || url.equals("")) {
			status = 9;
			suggest = 0;
			against = 0;
		} else {
			List<SimpleArticle> list = saService.getArticlesByWhere(
					" where fromUrl='" + url + "'", "Id", 0, 1);
			if(list != null && list.size() > 0){
				SimpleArticle sa = list.get(0);
				status = sa.getState();
				suggest = sa.getSupportCount();
				against = sa.getUnSupportCount();
			}
		}
		return SUCCESS;
	}

	public int getAgainst() {
		return against;
	}

	public void setAgainst(int against) {
		this.against = against;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getSuggest() {
		return suggest;
	}

	public void setSuggest(int suggest) {
		this.suggest = suggest;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public SimpleArticleService getSaService() {
		return saService;
	}

	public void setSaService(SimpleArticleService saService) {
		this.saService = saService;
	}
}
