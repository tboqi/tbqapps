package com.cc.cw.web.action.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.CwConfiguration;
import com.opensymphony.xwork.ActionSupport;

/**
 * 网站内容输出action
 * @author dzh
 * 2007-6-20
 */
public class OutputArticleAction extends ActionSupport{

	
	private static final long serialVersionUID = -8618768375018688439L;
	Log log = LogFactory.getLog(OutputArticleAction.class);
	
	protected static final String OUTPUTFILE = CwConfiguration.create().get("output.dir");
	private static final long INTERVAL = 1000 * 60 * 20 * 1 ;
	
	private SimpleArticleService saService;
	private List<SimpleArticle> newList;
	private List<Map> articleImgMapList;
	private Map articleImgMap;
	private int needSize;
	private int picSize;
	private int width;
	private int height;
	private int mode;
	private String site;

	public String execute(){
		try {
			constructList();
		} catch (Exception e) {
			e.printStackTrace();
			
			newList = saService.getNewArticles(1, needSize);
			initImg(newList);
		}
		
		return SUCCESS;
	}
	
	private void constructList() throws Exception{
		File outputFile = new File(OUTPUTFILE);
		if(outputFile.exists()){
			long editTime = outputFile.lastModified();
			boolean ifCreate = (new Date().getTime() - editTime) > INTERVAL;
			if(ifCreate){
				newList = saService.getNewArticles(1, needSize);
				createOutputFile(outputFile, newList);
			}else{
				readOutputFile(outputFile);
			}
		}else{
			newList = saService.getNewArticles(1, needSize);
			createOutputFile(outputFile, newList);
		}
		
	}
	
	private void readOutputFile(File outputFile) throws Exception{
		//log.info("reading output file... ");
		FileInputStream fin = new FileInputStream(outputFile);
		char[] b = new char[fin.available()];
		InputStreamReader reader = new InputStreamReader(fin);
		while (reader.read(b) != -1)
			reader.read(b);
		fin.close();
		reader.close();
		String s = new String(b);
		String[] values = s.split(System.getProperty("line.separator"));
		//判断是否请求数量大于文件中存储的数量
		if(needSize > (values.length - 1)){
			//log.info("need more info! query db ... ");
			newList = saService.getNewArticles(1, needSize);
			createOutputFile(outputFile, newList);
			
			return;
		}
			
		articleImgMapList = new ArrayList<Map>();
		newList = new ArrayList<SimpleArticle>();
		for (int i = 0;i <= needSize - 1 ;i++) {
			Map<String, String> map = new HashMap<String, String>();
			String[] vs = values[i].split(" ");
			if(vs != null && vs.length > 0){
				map.put("articleId", vs[0]);
				map.put("title",vs[1]);
				map.put("imgSrc",vs[2]);
			}
			articleImgMapList.add(map);
			SimpleArticle sa = new SimpleArticle();
			sa.setId(Integer.parseInt(vs[0]));
			sa.setTitle(vs[1]);
			sa.setImgSrc(vs[2]);
			newList.add(sa);
		}
	}
	
	private void createOutputFile(File outputFile, List<SimpleArticle> list){
		//log.info("creating output file... ");
		try{
			initImg(list);
			PrintWriter  raf = null;
			try {
				raf = new PrintWriter(outputFile);
				for(Map map : articleImgMapList){
					String id = String.valueOf(map.get("articleId")).replaceAll(" ", "");
					String title = String.valueOf(map.get("title")).replaceAll(" ", "");
					String imgSrc = String.valueOf(map.get("imgSrc")).replaceAll(" ", "");
					raf.println(id+" "+title+" "+imgSrc);
				}
			} finally{
				raf.flush();
				raf.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void initImg(List<SimpleArticle> list){
		if(list == null || list.size()<= 0){
			log.info("do not have article");
			return ;
		}
		articleImgMapList = new ArrayList<Map>();
		for(SimpleArticle article : list){
			if(article==null)continue;
			String content = article.getContent();
			String img = ArticleHelper.getCoverSrc(content);
			//如果没有图片，则取下一条数据
			if(img==null || img.trim().equals("")) 
				img = "/images/chuanwen.gif";;
			articleImgMap = new HashMap();
			articleImgMap.put("articleId", ""+article.getId());
			articleImgMap.put("imgSrc", img);
			articleImgMap.put("title", article.getTitle());
			articleImgMapList.add(articleImgMap);
		}
	}
	
	private int articleId;

	public String writeIp(){
		return SUCCESS;
	}
	
	public List<SimpleArticle> getNewList() {
		return newList;
	}
	public void setSaService(SimpleArticleService saService) {
		this.saService = saService;
	}
	public List<Map> getArticleImgMapList() {
		return articleImgMapList;
	}
	public int getNeedSize() {
		return needSize;
	}
	public void setNeedSize(int needSize) {
		this.needSize = needSize;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getPicSize() {
		return picSize;
	}

	public void setPicSize(int picSize) {
		this.picSize = picSize;
	}

	public int getMode() {
		return mode;
	}

	public void setMode(int mode) {
		this.mode = mode;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
}
