package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cc.cw.search.search.ChannelSearchService;
import com.cc.cw.search.search.LabelSearchService;
import com.cc.cw.search.search.RemarkSearchService;
import com.cc.cw.search.search.SearchResult;
import com.cc.cw.search.search.SimpleArticleSearchService;
import com.cc.cw.search.search.UnionSearchService;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.LabelService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.URLCoderUtil;
import com.opensymphony.webwork.ServletActionContext;

public class SearchAction extends BaseActionSupport {

	private static final long serialVersionUID = 3389346268057537017L;

	/** 搜索种类：all：全部类型 | channel：频道 | article：文章 |　remark：回复 */
	private String search;
	private String qs;
	
	private AtomLabelService atomLabelService;
	private LabelService labelService;
	private LabelSearchService lsService;
	private ChannelSearchService csService;
	private SimpleArticleSearchService sasService;
	private RemarkSearchService rsService;
	private UnionSearchService usService;
	
	private SearchResult result;
	
	private List<Map> rs;
	
	/** 当前页 */
	private int pn;
	private String pagnation;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		if(qs==null || qs.trim().equals("")){
			result = null;
			return ERROR;
		}else{
			try{
				if("label".equals(search)){
					atomLabelService.increaseCountByContent(qs, 1);
					result = lsService.search(qs, pn, 10);
				}else if("channel".equals(search)){
					result = csService.search(qs, pn, 10);
				}else if("article".equals(search)){
					result = sasService.search(qs, pn, 10);
				}else if("remark".equals(search)){
					result = rsService.search(qs, pn, 10);
				}else{
					result = usService.search(qs, pn, 10);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		if(rs == null){
			rs = new ArrayList<Map>();
		}
		if(result == null){
			result = new SearchResult();
		}
		
		List<Map<String, String>> list = result.getSearchItems();
		
		//用于过滤重复文章
		Map<String,String> temp = new HashMap<String,String>();
		for(Map<String,String> map :list){
			Map rsMap = new HashMap();
			List<String> labelListTmp = null;
			String type = map.get("type");
			if(type.equals("article") || type.equals("label")){//过滤重复文章
				if(temp.containsKey(map.get("id"))) continue;
				temp.put(map.get("id"), map.get("id"));
			}
			if(type.equals("article")){
				map.put("content", Convert.getText(map.get("content")));
				labelListTmp = labelService.getContentByArticleId(Integer.parseInt(map.get("id")));
			}
			if(type.equals("label")){
				map.put("content", Convert.getText(map.get("content")));
				labelListTmp = labelService.getContentByArticleId(Integer.parseInt(map.get("id")));
			}
			if(type.equals("remark")){
				map.put("content", Convert.getText(map.get("content")));
				labelListTmp = labelService.getContentByArticleId(Integer.parseInt(map.get("id")));
			}
			if(type.equals("channel")){
				map.put("content", Convert.getText(map.get("content")));
				labelListTmp = labelService.getContentByArticleId(Integer.parseInt(map.get("id")));
			}
			rsMap.put("resultItem",map);
			rsMap.put("labelList", labelListTmp);
			rs.add(rsMap);
		}
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(new Long(result.getTotalItemCount()).intValue());
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/search/search.action?qs="+URLCoderUtil.encode(qs,"UTF-8")+"&search="+search+"&");
		pagnation = p.getPagination();
		return SUCCESS;
	}
	
	private static final String  ARTICLESEARCH = "article";
	private static final String  CHANNELSEARCH = "channel";
	private static final String  LABELSEARCH = "label";
	private static final String  REMARKSEARCH = "remark";
	
	public String search(){
		if(qs == null | qs.trim().equals(""))
			return ERROR;
		qs = URLCoderUtil.encode(qs.trim(),"UTF-8").trim();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("search", search);
		if("all".equals(search)){
			String temp = URLCoderUtil.decode(qs, "UTF-8");
			//log.info(temp);
			atomLabelService.increaseCountByContent(temp, 1);
			return LABELSEARCH;
		}else if("channel".equals(search)){
			return CHANNELSEARCH;
		}else if("article".equals(search)){
			return ARTICLESEARCH;
		}else if("remark".equals(search)){
			return REMARKSEARCH;
		}
		return ERROR;
	}

	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public void setAtomLabelService(AtomLabelService atomLabelService) {
		this.atomLabelService = atomLabelService;
	}
	public int getPn() {
		return pn;
	}
	public void setPn(int currentPage) {
		this.pn = currentPage;
	}
	public SearchResult getResult() {
		return result;
	}
	public String getQs() {
		return qs;
	}
	public void setQs(String qs) {
		this.qs = qs;
	}

	public void setLabelService(LabelService labelService) {
		this.labelService = labelService;
	}

	public String getPagnation() {
		return pagnation;
	}


	public List<Map> getRs() {
		return rs;
	}


	public void setCsService(ChannelSearchService csService) {
		this.csService = csService;
	}


	public void setLsService(LabelSearchService lsService) {
		this.lsService = lsService;
	}


	public void setRsService(RemarkSearchService rsService) {
		this.rsService = rsService;
	}


	public void setSasService(SimpleArticleSearchService sasService) {
		this.sasService = sasService;
	}


	public void setUsService(UnionSearchService usService) {
		this.usService = usService;
	}
}