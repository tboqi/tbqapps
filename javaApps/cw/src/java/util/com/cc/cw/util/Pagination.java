package com.cc.cw.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//import com.cc.cw.web.util.URLRewriteManager;

public class Pagination {
	@SuppressWarnings("unused")
	private Log log = LogFactory.getLog(Pagination.class);
	
	private String url; 		//<a> 的href

	private int currentPage = 1; 	//当前页

	private int rowsCount = 0; 		//最大行数

	private int rowsPerPage = 5; 	//每页行数
	
	private int totalPage = 0;		//总页数
	
	public void init(){
		if(rowsPerPage != 0){
			totalPage = rowsCount / rowsPerPage 
			+ (rowsCount % rowsPerPage > 0 ? 1 : 0); 
			
		}else{
			totalPage = 0;
		}
	}

	public String getPagination() {
		init();
		if(totalPage <= 1)
			return "";
		
	    StringBuffer str=new StringBuffer();
		if(currentPage == 1 ){
			str.append(getPage());
			str.append(getNextPage());
		}
		else{
			if(currentPage!=totalPage){
				str.append(getPreviousPage());
				str.append(getPage());
				str.append(getNextPage());
			}else{
				str.append(getPreviousPage());
				str.append(getPage());
			}
			
		}
		return str.toString();
	}
	
	
	private String getPage(){
		StringBuffer sb = new StringBuffer();
		
		int from = 0;
		int end = 0;
		
		if(currentPage <= 11){
			from = 1;
			end = currentPage + 9;
		}else{
			from = currentPage - 10;
			end = currentPage + 9;
		}
			
		for(int i = from ; i <= (end <= totalPage ? end : totalPage) ; i++){
			String numStr;
			if( i != currentPage){
				numStr = "[" + i + "]";
			}else{
				numStr = i+"";
			}
			//sb.append("<a href=" + URLRewriteManager.getPaginationUrl(url, i)+ ">"+ numStr +"</a>&nbsp;");
			sb.append("<a href=" + url+"pn="+ i+ ">"+ numStr +"</a>&nbsp;");
		}
		return sb.toString();
	}
	
	private String getNextPage(){
		String nextPageStr = "<a href=" + url + "pn=" + (currentPage + 1)	+ ">下一页</a>&nbsp;";
		//String nextPageStr = "<a href=" +URLRewriteManager.getPaginationUrl(url, (currentPage + 1))+">下一页</a>&nbsp;";
		return nextPageStr;
	}

	private String getPreviousPage(){
		String previousPageStr = "<a href=" + url + "pn=" + (currentPage - 1)	+ ">上一页</a>&nbsp;";
//		String previousPageStr = "<a href=" +URLRewriteManager.getPaginationUrl(url, (currentPage - 1))+ ">上一页</a>&nbsp;";
		return previousPageStr;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPageNo) {
		this.currentPage = currentPageNo;
	}

	public int getRowsCount() {
		return rowsCount;
	}

	public void setRowsCount(int maxPageNo) {
		this.rowsCount = maxPageNo;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public static void main(String [] args){
		Pagination p = new Pagination();
		p.setUrl("/cw/channel/apply/");
		p.setRowsCount(30);
		p.setRowsPerPage(5);
		p.setCurrentPage(1);
	}


}
