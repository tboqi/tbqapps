package com.cc.cw.web.action.common;

import com.cc.cw.domain.Member;
import com.cc.cw.domain.RemarkArticle;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.RemarkArticleService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.ValidateUtil;
import com.cc.cw.web.interceptor.MemberAware;

public class RemarkAction extends SessionActionSupport implements MemberAware {

	private static final long serialVersionUID = -7162266913350821804L;
	public static final String SHOWCLEW = "clew";

	private MemberService memberService;
	private Member member;
	private int memberId;
	
	private RemarkArticleService rmkService;
	private RemarkArticle remark;
	private int remarkId;
	private String title;
	private String content;
	private int type;
	
	
	private SimpleArticleService simpleArticleService;
	private SimpleArticle article;
	private int articleId;
	/** 错误信息，用于页面显示 */
	private String errorMsg;
	/** 最后页号，为了添加回复后可以看到自己的评论 */
	private int pn;
	
	public String forwardAdd(){
		if(articleId!=0){
			article = simpleArticleService.getById(articleId);
		}
		return "forward_pinglun";
	}
	

	/**
	 * 添加评论或线索
	 * @return
	 */
	public String addRemark(){//TODO:addRemark()
		if(!ValidateUtil.checkString(title)){
			errorMsg = getText("error_submit_null");
			if(type==0){
				return INPUT;
			}else{
				return "forward_pinglun";
			}
		}else{
			errorMsg = null;
		}
		Member m = (Member)session.get("member");
		if(m != null){
			remark = new RemarkArticle();
			remark.setTitle(title);
			remark.setContent(content);
			remark.setMemberId(memberId);
			remark.setArticleId(articleId);
			remark.setLevel(0);
			remark.setType(type);
			
			int result = rmkService.add(remark);
			log.info("result == "+result);
			if(!(result > 0)){
				if(type==0){
					return INPUT;
				}else{
					return "forward_pinglun";
				}
			}
/*			if(result > 0){
				errorMsg = getText("info_operation_success");
				return INPUT;
			}
			else{
				errorMsg = getText("error_operation_error");
				return INPUT;
			}*/
			errorMsg = "succeed";
			if(type==0){
				return INPUT;
			}else{
				return "forward_pinglun";
			}
		}else{
			errorMsg = getText("error_member_null");
			if(type==0){
				return INPUT;
			}else{
				return "forward_pinglun";
			}
		}
	}
	
	/**
	 * 根据线索ID查询
	 * @return SHOWCLEW
	 */
	public String showClew(){//TODO:查看线索
		remark = rmkService.getById(remarkId);
		if(remark == null){
			addFieldError("check_clew_error", getText("error_clew_null"));
			return ERROR;
		}
		article = simpleArticleService.getById(remark.getArticleId());
		if(article == null){
			addFieldError("check_clew_article_error", getText("error_article_null"));
			return ERROR;
		}
		member = memberService.get(remark.getMemberId());
		if(member == null){
			addFieldError("check_clew_member_error", getText("error_member_notexists"));
			return ERROR;
		}
		return SHOWCLEW;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}

	public RemarkArticle getRemark() {
		return remark;
	}

	public void setRemark(RemarkArticle remark) {
		this.remark = remark;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setRmkService(RemarkArticleService rmkService) {
		this.rmkService = rmkService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setRemarkId(int remarkId) {
		this.remarkId = remarkId;
	}

	public void setSimpleArticleService(SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}

	public SimpleArticle getArticle() {
		return article;
	}

	public Member getMember() {
		return member;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public void setType(int type) {
		this.type = type;
	}

}
