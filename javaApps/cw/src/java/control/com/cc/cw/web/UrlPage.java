package com.cc.cw.web;

public class UrlPage {
	private String url = "";

	private int cp;

	private int pageCount;

	private int rowPerPage;

	private int rowCount;

	public UrlPage(int cp, int rowCount, int rowPerPage, String getUrl) {
		this.cp = cp;
		this.rowCount = rowCount;
		this.rowPerPage = rowPerPage;
		if (this.rowCount % rowPerPage == 0)
			pageCount = (int) rowCount / rowPerPage;
		else
			pageCount = (int) rowCount / rowPerPage + 1;
		if (pageCount <= 1)
			url = "";
		else {
			if (cp <= 1)
				url = "<a href=\"?" + getUrl + "cp=" + (cp + 1)
						+ "\">下一页</a>&nbsp;<a href=\"?" + getUrl + "cp=" + pageCount
						+ "\">末页</a>";
			else if (cp >= pageCount)
				url = "<a href=\"?" + getUrl + "cp=" + 1 + "\">首页</a>&nbsp;<a href=\"?" + getUrl + "cp="
						+ (cp - 1) + "\">上一页</a>";
			else
				url = "<a href=\"?" + getUrl + "cp=" + 1 + "\">首页</a>&nbsp;<a href=\"?" + getUrl + "cp="
						+ (cp - 1) + "\">上一页</a>&nbsp;<a href=\"?" + getUrl + "cp=" + (cp + 1)
						+ "\">下一页</a>&nbsp;<a href=\"?" + getUrl + "cp=" + pageCount
						+ "\">末页</a>";
		}
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
