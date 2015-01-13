package com.cc.cw.web;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.domain.ControlUser;
import com.cc.cw.domain.Member;
import com.cc.cw.domain.Message;
import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.domain.TradeHistory;
import com.cc.cw.service.MemberService;
import com.cc.cw.service.MessageService;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.service.TradeHistoryService;
import com.cc.cw.web.data.StaticNewArticles;

public class CMemberAction extends CMyAction {
	private static final long serialVersionUID = 1L;

	private String flag;

	private String key;

	private String property;

	private List<Member> list;

	private Member member;

	private int num;

	private int mid;

	private MemberService memberService;

	private TradeHistoryService tradeHistoryService;

	private List<SimpleArticle> articleList;

	private SimpleArticleService saService;

	private int cp;

	private ArticlePage page;

	private int aid;

	private UrlPage mpage;

	private SimpleArticleService simpleArticleService;

	private int commend;

	private int onlineMemberSize = 0;

	private MessageService messageService;

	@SuppressWarnings("unchecked")
	@Override
	public String doExecute() {
		if (StringUtils.equalsIgnoreCase(flag, "coverListOrderByArticleCount")) {
			if (cp < 1)
				cp = 1;
			int count = memberService.getMemberCount();
			int perPageRows = 12;
			list = memberService.getActivityMember(cp, perPageRows);
			mpage = new UrlPage(cp, count, perPageRows, "flag=coverListOrderByArticleCount&");
			return "coverList";
		}
		if (StringUtils.equalsIgnoreCase(flag, "online")) {
			list = OnlineListener.getOnlineMember();
			onlineMemberSize = list.size();
			return "online";
		}
		if (StringUtils.equalsIgnoreCase(flag, "commend")) {
			memberService.updateCommend(mid, commend);
			// setMessage("aaaaaaaaaa");
			member = memberService.get(mid);
			return "commendSuccess";
		}
		if (StringUtils.equalsIgnoreCase(flag, "coverList")) {
			if (cp < 1)
				cp = 1;
			int count = memberService.getMemberCount();
			int perPageRows = 12;
			list = memberService.getMember((cp - 1) * perPageRows, perPageRows);
			mpage = new UrlPage(cp, count, perPageRows, "flag=coverList&");
			return "coverList";
		}
		if (StringUtils.equalsIgnoreCase(flag, "screen")) {
			// 屏蔽
			memberService.updateState(mid);
			Member member = memberService.get(mid);
			setMessage("屏蔽用户" + member.getUserName() + "成功！");
			return "successAjax";
		}
		if (StringUtils.equalsIgnoreCase(flag, "unScreen")) {
			// 屏蔽
			memberService.unScreen(mid);
			Member member = memberService.get(mid);
			setMessage("取消屏蔽用户" + member.getUserName() + "成功！");
			return "successAjax";
		}
		if (StringUtils.equalsIgnoreCase(flag, "articleDel")) {
			saService.delete(aid);
			setMessage("删除成功，<a href=\"/cc/member.action?flag=articles&mid="
					+ mid + "&cp=" + cp + "\">回到文章列表");
			StaticNewArticles sna = new StaticNewArticles(simpleArticleService);
			sna.updateNewArticles();
			return SUCCESS;
		}
		if (StringUtils.equalsIgnoreCase(flag, "articles")) {
			int count = 20;
			int total = saService.getArticlesCountByMemberId(mid);
			articleList = saService.getArticlesByMemberId(mid, cp, count);
			if (cp < 1)
				cp = 1;
			page = new ArticlePage(cp, total, count, mid);
			return "articles";
		}
		if (StringUtils.equalsIgnoreCase(flag, "privilege")) {
			member = memberService.get(mid);
			return "privilege";
		}
		if (StringUtils.equalsIgnoreCase(flag, "doPrivilege")) {
			List<Member> list2 = OnlineListener.getOnlineMember();
			member = memberService.get(mid);
			member.setPrivilege(member.getPrivilege() + num);
			memberService.update(member);
			if (list2 != null && list2.size() > 0) {
				for (Iterator iter = list2.iterator(); iter.hasNext();) {
					Member element = (Member) iter.next();
					if (element.getId() == member.getId()) {
						element.setPrivilege(member.getPrivilege());
						break;
					} else {
						continue;
					}
				}
			}

			TradeHistory th = new TradeHistory();
			th.setCuserId(((ControlUser) getSessionMap().get("cuser")).getId());
			th.setMemberId(member.getId());
			th.setMessage("系统管理员处理");
			th.setTradeTime(new Date());
			tradeHistoryService.insert(th);
			String content = "";
			if (num >= 0)
				content = "系统为您添加票数" + num;
			else
				content = "系统为您减少票数" + Math.abs(num);
			messageService.sendMessage(-1, mid, Message.MESSAGE_SYSTEM, "系统消息",
					content);
			setMessage("您成功为用户" + member.getUserName() + "添加了" + num
					+ "票,他现在的票数是" + member.getPrivilege());
			return SUCCESS;
		}
		if (StringUtils.equalsIgnoreCase(flag, "doSearch")) {
			if (StringUtils.isEmpty(key)) {
				setMessage("关键字不能为空");
				return SUCCESS;
			}
			if (StringUtils.isEmpty(property)
					|| (!StringUtils.equals(property, "UserName") && !StringUtils
							.equals(property, "Email"))) {
				setMessage("属性不正确");
				return SUCCESS;
			}
			list = memberService.getMemberSearch(key, property);
			return "search";
		}
		return "search";
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<Member> getList() {
		return list;
	}

	public void setList(List<Member> list) {
		this.list = list;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public TradeHistoryService getTradeHistoryService() {
		return tradeHistoryService;
	}

	public void setTradeHistoryService(TradeHistoryService tradeHistoryService) {
		this.tradeHistoryService = tradeHistoryService;
	}

	public List<SimpleArticle> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<SimpleArticle> articleList) {
		this.articleList = articleList;
	}

	public SimpleArticleService getSaService() {
		return saService;
	}

	public void setSaService(SimpleArticleService saService) {
		this.saService = saService;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public ArticlePage getPage() {
		return page;
	}

	public void setPage(ArticlePage page) {
		this.page = page;
	}

	public SimpleArticleService getSimpleArticleService() {
		return simpleArticleService;
	}

	public void setSimpleArticleService(
			SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public UrlPage getMpage() {
		return mpage;
	}

	public void setMpage(UrlPage mpage) {
		this.mpage = mpage;
	}

	public int getCommend() {
		return commend;
	}

	public void setCommend(int commend) {
		this.commend = commend;
	}

	public int getOnlineMemberSize() {
		return onlineMemberSize;
	}

	public void setOnlineMemberSize(int onlineMemberSize) {
		this.onlineMemberSize = onlineMemberSize;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

}
