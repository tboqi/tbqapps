package com.cc.cw.web;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.domain.ControlUser;
import com.cc.cw.domain.FriendLink;
import com.cc.cw.service.FriendLinkService;

public class FriendLinkAction extends CMyAction {
	private static final long serialVersionUID = -8480642034313613803L;

	private FriendLinkService friendLinkService;

	private List<FriendLink> list;

	private List<FriendLink> textList;

	private List<FriendLink> picList;

	private Page page;

	private int cp;

	private String flag;

	private String name;

	private String url;

	private String logoUrl;

	private Integer id;

	private Integer display;

	private Integer viewOrder;

	private Integer color;
	private String query;
	private String field;

	@Override
	public String doExecute() {
		if (StringUtils.equalsIgnoreCase(flag, "check")) {
			return "check";
		}
		if (StringUtils.equalsIgnoreCase(flag, "search")) {
			return "search";
		}
		if (StringUtils.equalsIgnoreCase(flag, "doSearch")) {
			if(StringUtils.isEmpty(query)){
				setMessage("搜索条件必须填写");
				return "search";
			}
			String condition = "where " + field + " like '%" + query + "%'";
			list = friendLinkService.getLink(condition, 0, 40);
			return LIST;
		}
		if (StringUtils.equalsIgnoreCase(flag, "unCheck")) {
			list = friendLinkService.getUncheckLink(0, 40);
			return LIST;
		}
		if (StringUtils.equalsIgnoreCase(flag, "doCheck")) {
			FriendLink link = friendLinkService.get(id.intValue());
			link.setCheckTime(new Date());
			link.setCheckUserId(((ControlUser) getSessionMap().get("cuser"))
					.getId());
			link.setDisplay(display);
			link.setViewOrder(viewOrder);
			link.setColor(color);
			friendLinkService.update(link);
			return SUCCESS;
		}
		if (cp < 1)
			cp = 1;
		int perPageRows = 12;
		int count = friendLinkService.getCount();
		list = friendLinkService.getLink((cp - 1) * perPageRows, perPageRows);
		page = new Page(cp, count, perPageRows);
		return LIST;
	}

	public String friendlinks() {
		if (flag != null && flag.equalsIgnoreCase("input")) {
			return INPUT;
		}
		if (flag != null && flag.equalsIgnoreCase("doInput")) {
			if (StringUtils.equals(url, "") || !url.startsWith("http://")) {
				setMessage("网站地址填写不正确");
				return INPUT;
			}
			if (StringUtils.equals(name, "")) {
				setMessage("网站名称填写不正确");
				return INPUT;
			}
			if (!StringUtils.equals(logoUrl, "")
					&& !logoUrl.startsWith("http://")
					&& !(logoUrl.endsWith(".gif") || logoUrl.endsWith(".jpg"))) {
				setMessage("LOGO地址填写不正确");
				return INPUT;
			}
			FriendLink link = new FriendLink();
			link.setAddTime(new Date());
			link.setDisplay(0);
			link.setLogoUrl(logoUrl);
			link.setName(name);
			link.setUrl(url);
			friendLinkService.insert(link);
			return "inputsucc";
		}
		textList = friendLinkService.getLinkForText();
		picList = friendLinkService.getLinkForPic();
		return SUCCESS;
	}

	public String friendlinksInput() {
		return INPUT;
	}

	public FriendLinkService getFriendLinkService() {
		return friendLinkService;
	}

	public void setFriendLinkService(FriendLinkService friendLinkService) {
		this.friendLinkService = friendLinkService;
	}

	public List<FriendLink> getList() {
		return list;
	}

	public void setList(List<FriendLink> list) {
		this.list = list;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<FriendLink> getPicList() {
		return picList;
	}

	public void setPicList(List<FriendLink> picList) {
		this.picList = picList;
	}

	public List<FriendLink> getTextList() {
		return textList;
	}

	public void setTextList(List<FriendLink> textList) {
		this.textList = textList;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDisplay() {
		return display;
	}

	public void setDisplay(Integer display) {
		this.display = display;
	}

	public Integer getColor() {
		return color;
	}

	public void setColor(Integer color) {
		this.color = color;
	}

	public Integer getViewOrder() {
		return viewOrder;
	}

	public void setViewOrder(Integer viewOrder) {
		this.viewOrder = viewOrder;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

}
