package com.cc.cw.web.union;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.UnionUser;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.UnionUserService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.cc.cw.util.URLCoderUtil;
import com.cc.cw.web.action.common.BaseActionSupport;
import com.opensymphony.webwork.ServletActionContext;

public class SearchArticleAction extends BaseActionSupport {

	private static final long serialVersionUID = -7728784675681280298L;

	private LabelService labelService;
	private SimpleArticleService articleService;
	private MemberService memberSerivce;
	
	private String qs;
	private List<Map<String,Object>> rs;
	/** 当前页 */
	private int pn;
	private String pagnation;
	private UnionUserService unionUserService;
	private UnionUser uu;
	
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

	public String execute(){
		String domainName = ServletActionContext.getRequest().getServerName();
		String ip = ServletActionContext.getRequest().getRemoteHost();
		unionUserService.saveIp(ip, domainName);
		uu = (UnionUser)unionUserService.getWebsiteConfigMap(domainName);
		List<SimpleArticle> articleList = articleService.search(qs, pn, 10);
		int total = 0;
		if(articleList != null && articleList.size() > 0){
			rs = new ArrayList<Map<String,Object>>();
			for(SimpleArticle article : articleList){
				Map<String,Object> map = new HashMap<String,Object>();
				Member member = memberSerivce.get(article.getMemberId());
				if(member == null) continue;
				map.put("member", member);
				//处理文章信息
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
				List<String> labelList = labelService.getContentByArticleId(article.getId());
				map.put("labelList", labelList);
				
				rs.add(map);
			}
			
			total = articleService.searchCount(qs);
		}
		
		HttpServletRequest request	= ServletActionContext.getRequest();
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(10);
		p.setUrl(request.getContextPath() + "/union/searchArticle.action?qs="+URLCoderUtil.encode(qs,"UTF-8")+"&search=article&");
		pagnation = p.getPagination();
		
		return SUCCESS;
	}

	public String getPagnation() {
		return pagnation;
	}

	public List<Map<String,Object>> getRs() {
		return rs;
	}

	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}

	public void setLabelService(LabelService labelService) {
		this.labelService = labelService;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public void setQs(String qs) {
		this.qs = qs;
	}

	public void setMemberSerivce(MemberService memberSerivce) {
		this.memberSerivce = memberSerivce;
	}

	public int getPn() {
		return pn;
	}

	public String getQs() {
		return qs;
	}
}
