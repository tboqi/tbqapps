package com.cc.cw.web.action.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.cc.cw.domain.Member;
import com.opensymphony.webwork.ServletActionContext;

@SuppressWarnings("serial")
public class AddHttpArticleAction extends SessionActionSupport {

	private String url;
	private String title;
	private String fromUrl;
	private String inputUrl;

	public String execute() {
		String result = "login";
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String httpUrl = (String) session.getAttribute("httpUrl");
		
		if(StringUtils.isEmpty(url) && StringUtils.isEmpty(httpUrl))
			result = ERROR;
		else {
			if(member == null){
				session.setAttribute("httpUrl", url);
				inputUrl = "/addHttpArticle.action?url=" + url;
			} else {
				if(StringUtils.isEmpty(url)) {
					url = httpUrl;
				}
				fromUrl = url;
				try {
					Parser parser = new Parser(url);
					parser.setEncoding("GBK");
					NodeFilter f = new TagNameFilter("title");
					NodeList nodeList = parser.parse(f);
					title = nodeList.elementAt(0).toHtml();
					title = title.substring(title.indexOf(">")+1, title.length());
					title = title.substring(0, title.indexOf("<"));
					result = SUCCESS;
				} catch (ParserException e) {
					e.printStackTrace();
					result = ERROR; 
				}
			}
		}
		
		return result;
	}

	public static void main(String[] args) {
		String url1 = "http://mil.qihoo.com/article/q7068269,745641,s4272_28733.html?id=7068273";
		AddHttpArticleAction aaa = new AddHttpArticleAction();
		aaa.setUrl(url1);
		
		System.out.println(aaa.execute());
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFromUrl() {
		return fromUrl;
	}

	public void setFromUrl(String fromUrl) {
		this.fromUrl = fromUrl;
	}

	public String getInputUrl() {
		return inputUrl;
	}

	public void setInputUrl(String inputUrl) {
		this.inputUrl = inputUrl;
	}
}
