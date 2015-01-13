/**
 * 
 */
package com.number1g;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.number1g.dao.ArticleDao;
import com.number1g.entity.Article;
import com.number1g.fetcher.articlefetcher.HexunArticleFetcher;
import com.yuqi.utils.ChentuUtils;

/**
 * @author tboqi
 *
 */
public class ImageFetcher {
	
	private static Log log = LogFactory.getLog(ImageFetcher.class);
	
	private String sourceImageUrl;
	private String imgFormatName = "";
	//private String localImageDir = "/home/tboqi/ftp/static.number1g.com/upload/images";
	private String localImageDir = "/home/tboqi/workspace/phpapp/static.number1g.com/upload/images";
	private String newImage;
	private String relativeNewImage;
	
	public String getRelativeNewImage() {
		return relativeNewImage;
	}

	public ImageFetcher(String sourceImageUrl) {
		log.info(sourceImageUrl);
		this.sourceImageUrl = sourceImageUrl;
		String imgName = sourceImageUrl.substring(sourceImageUrl.lastIndexOf("/"));
		getImgFormatName();
		Date date = new Date();
		String dateString = ChentuUtils.formatDate(date, "yyyyMMdd");
		ChentuUtils.mkdir(localImageDir + "/" + dateString);
		relativeNewImage = dateString + imgName;
		this.newImage = localImageDir + "/" + relativeNewImage;
	}
	
	private void getImgFormatName() {
		try {
			URL url = new URL(sourceImageUrl);
			ImageInputStream iis = ImageIO.createImageInputStream(url.openStream());
			Iterator<ImageReader> iter = ImageIO.getImageReaders(iis);
			if (!iter.hasNext()) {
				return;
			}
			ImageReader reader=iter.next();
			iis.close();
			imgFormatName = reader.getFormatName();
		} catch (MalformedURLException e) {
			log.info(e.getMessage());
		} catch (IOException e) {
			log.info(e.getMessage());
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*
		String url = "http://ww1.sinaimg.cn/bmiddle/62a1ada9jw1dsmbb38q8vj.jpg";
		ImageFetcher fetcher = new ImageFetcher(url);
		BufferedImage bi = fetcher.loadImageUrl();
		fetcher.writeImageLocal(bi);
		*/
		ApplicationContext context = new ClassPathXmlApplicationContext(
		        new String[] {"configs/spring-jdbc.xml"});
		ArticleDao articleDao = (ArticleDao) context.getBean("articleDao");
		List<Article> result = articleDao.findArticlesHadNotfetchedImages(20, 1);
		int artId;
		String artContent;
		Matcher matcher;
		Pattern p;
		String url;
		for (Article article : result) {
			artId = article.getId();
			artContent = article.getContent();
			p = Pattern.compile("src=\"?(.*?)(\"|>|\\s+)");
			matcher = p.matcher(artContent);
			
			while (matcher.find()) {
//				System.out.println(matcher.group(1));
				url = matcher.group(1);
				ImageFetcher fetcher = new ImageFetcher(url);
				BufferedImage bi = fetcher.loadImageUrl();
				fetcher.writeImageLocal(bi);
			}
		}
	}
	
	/**
	 * 导入网络图片到缓冲区
	 */
	public BufferedImage loadImageUrl() {
		try {
			URL url = new URL(this.sourceImageUrl);
			return ImageIO.read(url);
		} catch (IOException e) {
			log.info(e.getMessage());
		}
		return null;
	}
	
	/**
	 * 生成新图片到本地
	 */  
	public void writeImageLocal(BufferedImage img) {
		if (newImage != null && img != null) {
			try {
				File outputfile = new File(newImage);
				ImageIO.write(img, this.imgFormatName, outputfile);
			} catch (IOException e) {
				log.info(e.getMessage());
			}
		}
	}

}
