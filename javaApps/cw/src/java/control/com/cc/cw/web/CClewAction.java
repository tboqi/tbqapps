package com.cc.cw.web;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.service.RemarkArticleService;

@SuppressWarnings("serial")
public class CClewAction extends CMyAction {
	private RemarkArticleService rmkService;

	private String flag;

	private String key;

	private int id;

	private int property;

	private List<RemarkArticle> clewList;

	private RemarkArticle clew;

	private int cp;

	private UrlPage page;
	
	private int aid;

	@Override
	public String doExecute() {
		if (flag != null && flag.equalsIgnoreCase("screen")) {
			//屏蔽
			rmkService.delete(aid);
			clew = rmkService.getById(aid);
			return "pingbi";
		}
		if (flag != null && flag.equalsIgnoreCase("unScreen")) {
			//取消屏蔽
			rmkService.delete2(aid);
			clew = rmkService.getById(aid);
			return "pingbi";
		}
		int rowPerPage = 12;
		int start = 0;
		if (cp < 1)
			cp = 1;
		start = (cp - 1) * rowPerPage;
		int totalRows = 0;
		if (StringUtils.equalsIgnoreCase(flag, "doSearch")) {
			if (property == 0) {
				clewList = rmkService.findBySourceArticle(key, 1, start,
						rowPerPage);
				totalRows = rmkService.countBySourceArticle(key, 1);
			} else {
				clewList = rmkService.findByClew(key, 1, start,
						rowPerPage);
				totalRows = rmkService.countByClew(key, 1);
			}
			page = new UrlPage(cp, totalRows, rowPerPage, "flag=doSearch&key="
					+ key + "&property=" + property + "&");
			
			return SUCCESS;
		}
		clewList = rmkService.find(1, start, rowPerPage);
		totalRows = rmkService.count(1);
		page = new UrlPage(cp, totalRows, rowPerPage, "");
		return "success";
	}

	public RemarkArticle getClew() {
		return clew;
	}

	public void setClew(RemarkArticle clew) {
		this.clew = clew;
	}

	public List<RemarkArticle> getClewList() {
		return clewList;
	}

	public void setClewList(List<RemarkArticle> clewList) {
		this.clewList = clewList;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public UrlPage getPage() {
		return page;
	}

	public void setPage(UrlPage page) {
		this.page = page;
	}

	public int getProperty() {
		return property;
	}

	public void setProperty(int property) {
		this.property = property;
	}

	public RemarkArticleService getRmkService() {
		return rmkService;
	}

	public void setRmkService(RemarkArticleService rmkService) {
		this.rmkService = rmkService;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}
}
