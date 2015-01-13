package com.cc.cw.web.output;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.LabelService;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.RemarkArticleService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.Convert;
import com.cc.cw.util.Pagination;
import com.opensymphony.webwork.ServletActionContext;

public class SimpleArticleAction extends BaseActionSupport{

	private static final long serialVersionUID = 2625724193045760881L;
	public static final String RUMOUR = "rumour";
	public static final String LISTARTICLES = "list";

	//#######################文章相关类和服务############################
	private SimpleArticleService simpleArticleService;
	private SimpleArticle article;
	//文章作者
	private String articleAuthor;
	private List<Map<String,List>> mapList;
	private String endDate;
	private String title;
	private String content;
	/** 文章公开类型 */
	private int publishType;
	
	//#######################标签相关类和服务############################
	private LabelService labelService;
	private List<String> allLabels;

	//#######################回复相关类和服务############################
	private RemarkArticleService rmkService;
	private List<Map> allRemark;
	private RemarkArticle remark;

	//#######################用户相关类和服务############################
	private MemberService memberService;
	
	//#######################投票相关类和服务############################
	//该文章的投票总数
	private int voteCount;
	/** 支持票数，用于真假图片显示 */
	private int supportCount;
	/** 反对票数，用于真假图片显示 */
	private int unSupportCount;
	
	//#######################页面属性############################
	private int articleId;
	@SuppressWarnings("unused")
	private String Submit;
	private int result;
	private int pn = 1;
	private int totalPage;
	private String pagnation;
	private String errorMsg;
	/** 相关文章列表 */
	private List<SimpleArticle> sameArticleList;
	/** 昨日回顾文章列表 */
	private List<SimpleArticle> yestodayArticleList;
	/** 本周最热文章列表 */
	private List<SimpleArticle> weekList;


	@SuppressWarnings("unchecked")
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();

		//根据id得到具体文章
		article = simpleArticleService.getById(articleId);
		if(article == null){
			addActionError("此文章不存在！");
			return ERROR;
		}
		//获得投票总数
		voteCount = simpleArticleService.getArticlesTotalVoteById(articleId);
		//根据文章ID得到文章的作者
		Member author = memberService.get(article.getMemberId());
		if(author != null){
			articleAuthor = author.getUserName();
		}else{
			articleAuthor = "佚名";
		}
		
		//根据文章id获得标签列表
		allLabels = labelService.getContentByArticleId(articleId);
		sameArticleList = simpleArticleService.getArticleByLabels(allLabels, 1, 4);
		//yestodayArticleList = (List) GlobalData.globalData.get("yestodayArticles");
		//weekList = (List) GlobalData.globalData.get("weekList");
		
		//根据文章id获得回复列表
		List<RemarkArticle> rmkList = rmkService.getRemarksByArticleId(articleId,pn,5);
		allRemark = new ArrayList<Map>();
		if(rmkList != null && rmkList.size() > 0){
			//遍历回复列表查询对应用户信息
			for(RemarkArticle remark : rmkList){
				Map<String, String> rmkMap = new HashMap<String, String>();
				//根据评论ID获得评论者信息
				Member memberTemp = memberService.get(remark.getMemberId());
				if(memberTemp == null) continue;
				
				rmkMap.put("memberId", ""+memberTemp.getId());
				rmkMap.put("memberName", memberTemp.getUserName());
				rmkMap.put("title", remark.getTitle());
				rmkMap.put("content", remark.getContent());
				rmkMap.put("createDate", Convert.formatDate(remark.getCreateDate(),"yyyy-MM-dd HH:mm:ss"));
				allRemark.add(rmkMap);
			}
		}
		
		//获得回复总数，用于分页
		int total = rmkService.getRemarksCountByArticleId(articleId);
		Pagination p = new Pagination();
		p.setCurrentPage(pn);
		p.setRowsCount(total);
		p.setRowsPerPage(5);
		p.setUrl(request.getContextPath() + "/ox/o/"+articleId+"&");
		pagnation = p.getPagination();
		totalPage = p.getTotalPage();
		return SUCCESS;
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}
	public void setLabelService(LabelService labelService) {
		this.labelService = labelService;
	}
	public void setRmkService(RemarkArticleService rmkService) {
		this.rmkService = rmkService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public SimpleArticle getArticle() {
		return article;
	}
	public void setArticle(SimpleArticle article) {
		this.article = article;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getArticleId() {
		return articleId;
	}
	public String getEndDate() {
		return endDate;
	}
	public List<String> getAllLabels() {
		return allLabels;
	}
	public List<Map> getAllRemark() {
		return allRemark;
	}
	public void setRemark(RemarkArticle remark) {
		this.remark = remark;
	}
	public void setSubmit(String submit) {
		Submit = submit;
	}
	public RemarkArticle getRemark() {
		return remark;
	}
	public String getArticleAuthor() {
		return articleAuthor;
	}
	public int getVoteCount() {
		return voteCount;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getPn() {
		return pn;
	}
	public void setPn(int pn) {
		this.pn = pn;
	}
	public List<Map<String, List>> getMapList() {
		return mapList;
	}
	public String getPagnation() {
		return pagnation;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setPublishType(int publishType) {
		this.publishType = publishType;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPublishType() {
		return publishType;
	}
	public List<SimpleArticle> getSameArticleList() {
		return sameArticleList;
	}
	public List<SimpleArticle> getYestodayArticleList() {
		return yestodayArticleList;
	}
	public List<SimpleArticle> getWeekList() {
		return weekList;
	}
	public int getSupportCount() {
		return supportCount;
	}
	public int getUnSupportCount() {
		return unSupportCount;
	}

}
