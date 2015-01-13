package com.cc.cw.web.thread;

import java.io.File;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.SimpleArticleService;
import com.cc.cw.util.FileUtil;
import com.cc.cw.web.ArticleHelper;
import com.cc.cw.web.CwConfiguration;

/**
 * 当用户发表新文章时，将文章中的图片下载下来,并更新文章内容中图片的链接
 * @author dzh
 * 2007-6-25
 */
public class ImageDownloadThread implements Runnable{

	private static Log log = LogFactory.getLog(ImageDownloadThread.class);
	private int articleId;
	private SimpleArticleService saService;
	private String imgDest;
	private static String uploadDir = CwConfiguration.create().get("upload.dir");
	private static String [] excludeSites = {"www.xiaoshuo.com","www.huace.net"};
	
	private String serverName;
	
	public ImageDownloadThread(String serverName,int articleId,SimpleArticleService saService){
		this.serverName = serverName;
		this.articleId = articleId;
		this.saService = saService;
	}
	
	public void run() {
		SimpleArticle article = saService.getById(articleId);
		if(article == null)
			return ;
		else{
			imgDest = uploadDir + article.getMemberId()+"/"+article.getId();
//			imgDest = uploadDir + article.getMemberId()+File.separator+article.getId();
			log.info("imgDest --> "+imgDest);
			
			String newContent = null;
			try {
				newContent = downloadProc(article.getContent());
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(newContent != null && !newContent.trim().equals("")){
				article.setContent(newContent);
				saService.update(article);
			}
		}
	}
	
	/**
	 * 负责下载内容中出现的图片，更新内容，如果没有更新，返回null，否则返回更新后的结果
	 * @param content
	 * @return
	 */
	public String downloadProc(String content) throws Exception{
		String newContent = content;
		if(content == null || content.trim().equals(""))
			return null;
		content = content.replaceAll("(?i)img", "img");
		
		if(content.indexOf("<img") == -1)
			return null;
		while(content.indexOf("<img") != -1){
			String cover = ArticleHelper.getCover(content);
			String src = ArticleHelper.getCoverSrc(content);
			boolean downloadFlag = true;
			for(String site : excludeSites){
				if(src.indexOf(site) != -1){
					downloadFlag = false;
					continue;
				}
			}
			if(downloadFlag){
				String fileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS%1$tL",new Date());
				String localPicPath = imgDest+"/"+fileName + ".gif";
				File imgDestFile = new File(localPicPath);
				boolean flag = FileUtil.downloadImg(src,imgDestFile);
				if(flag){
					String srcPath = localPicPath.substring(localPicPath.indexOf("userfiles") + 9);
					String newSrc = serverName + "/picture"+ srcPath;
					newContent = newContent.replaceAll("(?i)"+src, newSrc);
				}
			}
			content = content.substring(content.indexOf(cover)+ cover.length() , content.length());
		}
		return newContent;
	}
	
	
	public static void main(String[] args) throws Exception{
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml", 
	    "dataAccessContext-local.xml","indexContext.xml" });
		SimpleArticle sa = new SimpleArticle();
		sa.setChannelId(0);
		sa.setCreateDate(new Date());
		sa.setMemberId(100038);
		String content = "亨利<img src=\"http://www.sinaimg.cn/ty/g/p/2007-06-25/U2028P6T12D2999977F44DT20070625042247_small_min.jpg\"/>足球";
		sa.setContent(content);
		SimpleArticleService saService = (SimpleArticleService)ctx.getBean("simpleArticleService");
		int artileId = saService.add(sa);
		String serverName = "http://www.chuanwen.com.cn";
		Thread downloadThread = new Thread(new ImageDownloadThread(serverName,artileId,saService));
		downloadThread.run();
	}
	
}
