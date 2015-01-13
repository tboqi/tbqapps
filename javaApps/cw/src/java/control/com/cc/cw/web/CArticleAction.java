package com.cc.cw.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.web.data.StaticNewArticles;

public class CArticleAction extends CMyAction {
	public SimpleArticleService simpleArticleService;

	private static final long serialVersionUID = 6952814385249444057L;

	private String flag;

	private String query;

	private SimpleArticleService articleService;

	private List<Map<String, Object>> articleList;

	private int id;

	private Map<String, Object> articleMap;

	private List<SimpleArticle> list;

	private int property;

	private String key;

	private UrlPage page;

	private int cp;
	private int aid;
	private SimpleArticle article;

	public String manager() {
		StaticNewArticles sna = new StaticNewArticles(articleService);
		if (flag != null && flag.equalsIgnoreCase("screenPic")) {
			article = articleService.getById(aid);
			String content = article.getContent();
			content = content.replaceAll("<s*imgs*[^>]*>", "");
			article.setContent(content);
			articleService.update(article);
			sna.updateNewArticles();
			return "screenPic";
		}
		if (flag != null && flag.equalsIgnoreCase("screen")) {
			//屏蔽
			articleService.delete(aid);
			article = articleService.getById(aid);
			sna.updateNewArticles();
			return "pingbi";
		}
		if (flag != null && flag.equalsIgnoreCase("unScreen")) {
			//取消屏蔽
			articleService.delete2(aid);
			article = articleService.getById(aid);
			sna.updateNewArticles();
			return "pingbi";
		}
		if (flag != null && flag.equalsIgnoreCase("doSearch")) {
			if (cp < 1)
				cp = 1;
			String where = "where ";
			String order = "Id desc";
			int total = 0;
			int num = 20;
			if (property == 1) {
				where += "MemberId in (select Id from member where UserName like '%" + key + "%')";
			} else {
				where += "Title like '%" + key + "%'";
			}

			total = articleService.getAritlcesCountByWhere(where);
			list = articleService.getArticlesByWhere(where, order, (cp - 1)
					* num, num);
			page = new UrlPage(cp, total, num, "flag=doSearch&property="
					+ property + "&key=" + key + "&");
			return SUCCESS;
		}
		return "search";
	}

	@Override
	public String doExecute() {
		List<SimpleArticle> list = new ArrayList<SimpleArticle>();
		if (StringUtils.equalsIgnoreCase(flag, "tuijian")) {
			articleMap = new HashMap<String, Object>();
			String txtFilePath = CwConfiguration.create()
					.get("not.tuijian.log");
			File txtfile = new File(txtFilePath);
			try {
				Reader r = new InputStreamReader(new FileInputStream(txtfile),
						"UTF-8");
				BufferedReader fr = new BufferedReader(r);
				String line = fr.readLine();
				String idList = "";
				String[] idArr = line.split(",");
				for (int i = 0; i < idArr.length; i++) {
					if (NumberUtils.toInt(idArr[i]) == id)
						continue;
					idList += idArr[i] + ",";
				}
				r.close();
				Writer w = new OutputStreamWriter(
						new FileOutputStream(txtfile), "UTF-8");
				char[] cbuf = new char[idList.length()];
				idList.getChars(0, idList.length(), cbuf, 0);
				w.write(cbuf);
				w.close();
				StaticNewArticles sna = new StaticNewArticles(
						simpleArticleService);
				sna.updateNewArticles();
				setMessage("操作成功");

			} catch (FileNotFoundException e) {
				setMessage("操作失败");
				// return "search";
			} catch (IOException e) {
				setMessage("操作失败");
				// return "search";
			}
			SimpleArticle art = simpleArticleService.getById(id);
			articleMap.put("id", id);
			articleMap.put("title", art.getTitle());
			articleMap.put("status", "推荐");
			return "notuijian";
		}
		if (StringUtils.equalsIgnoreCase(flag, "notuijian")) {
			articleMap = new HashMap<String, Object>();
			String txtFilePath = CwConfiguration.create()
					.get("not.tuijian.log");
			File txtfile = new File(txtFilePath);
			try {
				Reader r = new InputStreamReader(new FileInputStream(txtfile),
						"UTF-8");
				BufferedReader fr = new BufferedReader(r);
				String line = fr.readLine();
				String idList = ((line == null ? "" : line) + id + ",");
				r.close();
				Writer w = new OutputStreamWriter(
						new FileOutputStream(txtfile), "UTF-8");
				char[] cbuf = new char[idList.length()];
				idList.getChars(0, idList.length(), cbuf, 0);
				w.write(cbuf);
				w.close();
				StaticNewArticles sna = new StaticNewArticles(
						simpleArticleService);
				sna.updateNewArticles();
				setMessage("操作成功");

			} catch (FileNotFoundException e) {
				setMessage("操作失败");
				// return "search";
			} catch (IOException e) {
				setMessage("操作失败");
				// return "search";
			}
			SimpleArticle art = simpleArticleService.getById(id);
			articleMap.put("id", id);
			articleMap.put("title", art.getTitle());
			articleMap.put("status", "<font color=\"red\">不推荐</font>");
			return "notuijian";
		}
		if (StringUtils.equalsIgnoreCase(flag, "doSearch")) {
			if (StringUtils.isEmpty(query)) {
				setMessage("搜索条件不能为空");
				return "search";
			}
			list = articleService.search(query, 0, 30);
			articleList = getMapList(list);
			return SUCCESS;
		}
		list = articleService.getNewArticlesNoTuijian(1, 30);
		articleList = getMapList(list);
		return "search";
	}

	private List<Map<String, Object>> getMapList(List<SimpleArticle> list) {
		String line = "";

		String txtFilePath = CwConfiguration.create().get("not.tuijian.log");
		File txtfile = new File(txtFilePath);
		try {
			Reader r = new InputStreamReader(new FileInputStream(txtfile),
					"UTF-8");
			BufferedReader fr = new BufferedReader(r);
			line = fr.readLine();
			r.close();
			if (StringUtils.isEmpty(line)) {
				line = "";
			} else {
				line = line.substring(0, line.length() - 1);
			}
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
		}
		String[] idArr = line.split(",");
		List<Map<String, Object>> list1 = new ArrayList<Map<String, Object>>();
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			SimpleArticle a = (SimpleArticle) iter.next();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", a.getId());
			map.put("title", a.getTitle());
			String value = "推荐";
			for (int i = 0; i < idArr.length; i++) {
				if (NumberUtils.toInt(idArr[i]) == a.getId()) {
					value = "<font color=\"red\">不推荐</font>";
					break;
				}
			}
			map.put("status", value);
			list1.add(map);
		}
		return list1;
	}

	public List<Map<String, Object>> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<Map<String, Object>> articleList) {
		this.articleList = articleList;
	}

	public SimpleArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(SimpleArticleService articleService) {
		this.articleService = articleService;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SimpleArticleService getSimpleArticleService() {
		return simpleArticleService;
	}

	public void setSimpleArticleService(
			SimpleArticleService simpleArticleService) {
		this.simpleArticleService = simpleArticleService;
	}

	public Map<String, Object> getArticleMap() {
		return articleMap;
	}

	public void setArticleMap(Map<String, Object> articleMap) {
		this.articleMap = articleMap;
	}

	public List<SimpleArticle> getList() {
		return list;
	}

	public void setList(List<SimpleArticle> list) {
		this.list = list;
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

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public SimpleArticle getArticle() {
		return article;
	}

	public void setArticle(SimpleArticle article) {
		this.article = article;
	}
}
