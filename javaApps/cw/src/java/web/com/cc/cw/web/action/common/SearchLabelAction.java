package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Label;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.URLCoderUtil;
import com.opensymphony.webwork.ServletActionContext;

public class SearchLabelAction extends BaseActionSupport {

	private static final long serialVersionUID = -5709461652678169438L;

	private LabelService labelService;
	private SimpleArticleService articleService;
	private MemberService memberSerivce;
	
	private String qs;
	private List<Map<String,Object>> rs;
	/** 当前页 */
	private int pn;
	private String pagnation;
	
	public String execute(){
		List<Label> labelList = labelService.search(qs, pn, 10); 
		int total = 0;
		if(labelList != null && labelList.size() > 0){
			rs = new ArrayList<Map<String,Object>>();
			for(Label label : labelList){
				Map<String,Object> map = new HashMap<String,Object>();
				SimpleArticle article = articleService.getById(label.getArticleId());
				Member member = memberSerivce.get(label.getMemberId());
				if(article == null || member == null) continue;
				//处理文章标题和内容
				String title = Convert.getText(article.getTitle());
				title = title.replaceAll(qs, "<font color=red>"+qs+"</font>");
				article.setTitle(title);
				String content = Convert.getText(article.getContent());
				int index = content.indexOf(qs);//查询关键字的位置，避免页面没有高亮显示
				if(index >= 150)
					content = content.substring(index - 10,content.length());
				if(content.length() > 150)//截取字符串
					content = content.substring(0, 150);
				content = content.replaceAll(qs, "<font color=red>"+qs+"</font>");
				article.setContent(content);
				map.put("article", article);
				map.put("member", member);
				//分解标签
				if(label.getContent() == null | label.getContent().trim().equals("")) continue;
				
				List<String> totalLabelList = new ArrayList<String>();				
				String labels = label.getContent();
				String arr[] = labels.split(";");
				for(String s : arr){
					totalLabelList.add(s);
				}
				map.put("labelList", totalLabelList);
				
				rs.add(map);
			}
			total = labelService.searchCount(qs);
		}
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/search/search.action?qs="+URLCoderUtil.encode(qs,"UTF-8")+"&search=all&");
		pagnation = p.getPagination();
		
		return SUCCESS;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getQs() {
		return qs;
	}

	public void setQs(String qs) {
		this.qs = qs;
	}

	public String getPagnation() {
		return pagnation;
	}

	public List<Map<String, Object>> getRs() {
		return rs;
	}

	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}

	public void setLabelService(LabelService labelService) {
		this.labelService = labelService;
	}

	public void setMemberSerivce(MemberService memberSerivce) {
		this.memberSerivce = memberSerivce;
	}
}
