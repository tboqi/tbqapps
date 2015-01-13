package com.cc.cw.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.domain.Broadcast;
import com.cc.cw.service.BroadcastService;
import com.cc.cw.util.DateTimeUtil;

public class CBroadcastAction extends CMyAction {
	private static final long serialVersionUID = 1L;

	private String flag;

	private int id;

	private String articleTitle;

	private String content;

	private List<Broadcast> list;

	private int cp;

	private UrlPage page;

	private int property;

	private String key;
	
	private String ids;
	
	private Broadcast broadcast;

	private BroadcastService broadcastService;

	public String view(){
		broadcast = broadcastService.get(id);
		return "view";
	}
	@Override
	public String doExecute() {
		if (StringUtils.equals(flag, "delete")) {
			broadcastService.deleteByIds(ids);
			setMessage("删除成功");
			return "message";
		}
		if (StringUtils.equals(flag, "input")) {
			Broadcast bc = new Broadcast();
			bc.setArticleId(0);
			bc.setArticleTitle(articleTitle);
			bc.setContent(content);
			bc.setCreateDate(new Date());
			bc.setFlag(-1);
			bc.setMemberId(0);
			bc.setMemberName("系统广播");
			bc.setSort(4);
			broadcastService.add(bc);
			return SUCCESS;
		}
		if (StringUtils.equals(flag, "doSearch")) {
			int perPageRows = 12;
			if (cp < 1)
				cp = 1;
			int count = 0;
			if (property == 0) {
				count = broadcastService.getCount("MemberName", key);
				list = broadcastService.getBroadcastOrderByDate("MemberName",
						key, (cp - 1) * perPageRows, perPageRows);
			} else {
				Map<String, Object> map = DateTimeUtil.getFromDate(key.trim());
				count = broadcastService.getCount(map);
				list = broadcastService.getBroadcastOrderByDate(map, (cp - 1)
						* perPageRows, perPageRows);
			}

			page = new UrlPage(cp, count, perPageRows, "flag=doSearch&key=" + key
					+ "&property=" + property + "&");

			return LIST;
		}
		if (StringUtils.equals(flag, "list")) {
			int count = broadcastService.getCount();
			int perPageRows = 12;
			if (cp < 1)
				cp = 1;
			page = new UrlPage(cp, count, perPageRows, "flag=list&");
			list = broadcastService.getBroadcastOrderByDate(cp, perPageRows);
			return LIST;
		}
		return "publish";
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public BroadcastService getBroadcastService() {
		return broadcastService;
	}

	public void setBroadcastService(BroadcastService broadcastService) {
		this.broadcastService = broadcastService;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Broadcast> getList() {
		return list;
	}

	public void setList(List<Broadcast> list) {
		this.list = list;
	}

	public UrlPage getPage() {
		return page;
	}

	public void setPage(UrlPage page) {
		this.page = page;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getProperty() {
		return property;
	}

	public void setProperty(int property) {
		this.property = property;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	public Broadcast getBroadcast() {
		return broadcast;
	}
	public void setBroadcast(Broadcast broadcast) {
		this.broadcast = broadcast;
	}
}
