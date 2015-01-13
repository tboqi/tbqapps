package com.yuqi.blog.utils;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
@SuppressWarnings("unchecked")
public class Pagination {

	private int currentPage;
	private int totalPages;
	private int totalRows;
	private List list;
	private String url;
	private int num;
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	public Pagination(int currentPage, int num, int totalRows, List list, String url) {
		if (currentPage < 1) {
			currentPage = 1;
		}
		this.currentPage = currentPage;
		this.totalPages = (int) totalRows / num;
		if (totalRows % num > 0) {
			this.totalPages++;
		}
		this.totalRows = totalRows;
		this.num = num;
		
		this.list = list;
		this.url = url;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
