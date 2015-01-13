package com.cc.cw.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.search.search.ChannelSearchService;
import com.cc.cw.search.search.RemarkSearchService;
import com.cc.cw.search.search.SearchResult;
import com.cc.cw.search.search.SearchService;
import com.cc.cw.search.search.SimpleArticleSearchService;
import com.cc.cw.search.search.UnionSearchService;
import com.cc.cw.service.AtomLabelService;

@SuppressWarnings("serial")
public class SearchServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		try{
			String firstUrl = request.getParameter("firstUrl");
			String nextUrl = request.getParameter("nextUrl");
			String preUrl = request.getParameter("preUrl");
			String lastUrl = request.getParameter("lastUrl");
			String type = request.getParameter("type");
			int currentPage = Integer.parseInt(nextUrl==null?"1":nextUrl);
			if(!("".equals(lastUrl)) && lastUrl != null){
				currentPage = Integer.parseInt(lastUrl);
			}
			
			String queryString = request.getParameter("search");
			if(queryString == null || queryString.equals("")){
				response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
				return;
			}
			request.setAttribute("search", queryString);

			
			WebApplicationContext appctx = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
			AtomLabelService als = (AtomLabelService)appctx.getBean("atomLabelService");
			if("label".equals(type)){
				als.increaseCountByContent(queryString, 1);
			}
			
			int countPerPage = -1;
			try{
				countPerPage = Integer.parseInt(request.getParameter("countPerPage"));
			}catch(NumberFormatException nfe){
				countPerPage = 3;
			}
			String searchType = request.getParameter("searchType");
			SearchService searchService = null;
			SearchResult result = null;
			if("channel".equals(searchType)){
				searchService = new ChannelSearchService();
				result = searchService.search(queryString, currentPage, countPerPage);
			}else if("article".equals(searchType)){
				searchService = new SimpleArticleSearchService();
				result = searchService.search(queryString, currentPage, countPerPage);
			}else if("remark".equals(searchType)){
				searchService = new RemarkSearchService();
				result = searchService.search(queryString, currentPage, countPerPage);
			}else{
				searchService = new UnionSearchService();
				result = searchService.search(queryString, currentPage, countPerPage);
			}
			
			List<Map<String,String>> searchRecords = new ArrayList<Map<String,String>>();
			int totalCount = 0;
			if(result != null){
				searchRecords = result.getSearchItems();
				totalCount = new Long(result.getTotalItemCount()).intValue();
			}
			request.setAttribute("searchRecords", searchRecords);
			
			
			int totalPages = totalCount / 5;
			if (totalCount % 5 != 0)
				totalPages += 1;
			
			if(totalPages > 0){
				
				//将首页设为1
				firstUrl = "1";
				//尾页设为总页数
				lastUrl = ""+totalPages;
				//如果当前页数未到尾页，则设置下页页数
				if(currentPage < totalPages){
					nextUrl = ""+(currentPage + 1);
				}else{
					nextUrl = null;
					lastUrl = null;
				}
				//如果当前页大于首页，则设置上页页数
				if(currentPage > 1){
					preUrl = ""+(currentPage - 1);
				}else{
					preUrl = null;
					firstUrl = null;
				}
			}
			Map<String, String> pageMap = new HashMap<String, String>();
			pageMap.put("currentPage", ""+currentPage);
			pageMap.put("totalPages", ""+totalPages);
			pageMap.put("firstUrl", firstUrl);
			pageMap.put("nextUrl", nextUrl);
			pageMap.put("preUrl", preUrl);
			pageMap.put("lastUrl", lastUrl);
			pageMap.put("searchType", searchType);
			request.setAttribute("pageMap", pageMap);
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/search.jsp");
			dis.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
