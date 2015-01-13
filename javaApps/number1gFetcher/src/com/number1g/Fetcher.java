package com.number1g;

import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.number1g.dao.ArticleDao;
import com.number1g.entity.Article;
import com.number1g.fetcher.UrlFetcher;

public class Fetcher implements Runnable {
	private ApplicationContext context;
	private FetcherParam fp;
	private List<FetcherParam> fps;
	
	public void setFp(FetcherParam fp) {
		this.fp = fp;
	}
	public Fetcher() {
		context = new ClassPathXmlApplicationContext(
		        new String[] {"configs/spring-jdbc.xml"});
	}
	
	public static void main(String[] args) {
		/* */
		List<FetcherParam> list = new ArrayList<FetcherParam>();
		
		list.add(new FetcherParam(1, "http://lux.hexun.com/watch/index.html", "hexunUrlFetcher"));//钟表
		//list.add(new FetcherParam(3, "http://lux.hexun.com/costume/index.html", "hexunUrlFetcher"));//服饰箱包
		list.add(new FetcherParam(5, "http://lux.hexun.com/car/index.html", "hexunUrlFetcher"));//名车游艇
		list.add(new FetcherParam(6, "http://lux.hexun.com/liquor-cigar/index.html", "hexunUrlFetcher"));//红酒
		//list.add(new FetcherParam(9, "http://lux.hexun.com/jewelry/index.html", "hexunUrlFetcher"));//珠宝饰品
		list.add(new FetcherParam(10, "http://lux.hexun.com/chaonanchaonv/index.html", "hexunUrlFetcher"));//潮男潮女
		list.add(new FetcherParam(11, "http://lux.hexun.com/meihaojiaju/index.html", "hexunUrlFetcher"));//美好家居
		list.add(new FetcherParam(12, "http://lux.hexun.com/meironghufu/index.html", "hexunUrlFetcher"));//美容护肤
		list.add(new FetcherParam(14, "http://lux.hexun.com/xingzoutianxia/index.html", "hexunUrlFetcher"));//行走天下
		list.add(new FetcherParam(13, "http://lux.hexun.com/chihewanle/index.html", "hexunUrlFetcher"));//吃喝玩乐
		
		list.add(new FetcherParam(4886, "http://fashion.lady8844.com/sspp/", "lady8844UrlFetcher"));//时尚品牌
		list.add(new FetcherParam(3, "http://clothing.lady8844.com/clothing/fashion/", "lady8844UrlFetcher2"));//服饰箱包
		list.add(new FetcherParam(3, "http://clothing.lady8844.com/clothing/bags/", "lady8844UrlFetcher2"));//服饰箱包
		list.add(new FetcherParam(9, "http://clothing.lady8844.com/clothing/accessories/", "lady8844UrlFetcher2"));//珠宝饰品
		list.add(new FetcherParam(3, "http://clothing.lady8844.com/clothing/school/", "lady8844UrlFetcher2"));//服饰箱包
		list.add(new FetcherParam(3, "http://clothing.lady8844.com/clothing/shoes/", "lady8844UrlFetcher2"));//服饰箱包
		//list.add(new FetcherParam(12, "http://www.lady8844.com/hufu/sthl/", "lady8844UrlFetcher2"));//美容护肤
		//list.add(new FetcherParam(12, "http://www.lady8844.com/hufu/mbhl/", "lady8844UrlFetcher2"));//美容护肤
		//list.add(new FetcherParam(12, "http://www.lady8844.com/hufu/star/", "lady8844UrlFetcher2"));//美容护肤
		//list.add(new FetcherParam(12, "http://www.lady8844.com/hufu/szhl/", "lady8844UrlFetcher2"));//美容护肤
		list.add(new FetcherParam(5794, "http://www.lady8844.com/caizhuang/star/", "lady8844UrlFetcher2"));//彩妆
		list.add(new FetcherParam(5794, "http://www.lady8844.com/caizhuang/jnhz/", "lady8844UrlFetcher2"));//彩妆
		list.add(new FetcherParam(5794, "http://www.lady8844.com/caizhuang/lxcz/", "lady8844UrlFetcher2"));//彩妆
		list.add(new FetcherParam(5794, "http://www.lady8844.com/caizhuang/czxp/", "lady8844UrlFetcher2"));//彩妆
		list.add(new FetcherParam(6233, "http://www.lady8844.com/xiufa/lxfx/", "lady8844UrlFetcher2"));//美发
		list.add(new FetcherParam(6233, "http://www.lady8844.com/xiufa/star/", "lady8844UrlFetcher2"));//美发
		list.add(new FetcherParam(6233, "http://www.lady8844.com/xiufa/diy/", "lady8844UrlFetcher2"));//美发
		list.add(new FetcherParam(6233, "http://www.lady8844.com/xiufa/mfxf/", "lady8844UrlFetcher2"));//美发
		list.add(new FetcherParam(6233, "http://www.lady8844.com/xiufa/mfcp/", "lady8844UrlFetcher2"));//美发
		list.add(new FetcherParam(6234, "http://www.lady8844.com/shoushen/jbss/", "lady8844UrlFetcher2"));//美体
		list.add(new FetcherParam(6234, "http://www.lady8844.com/shoushen/ydss/", "lady8844UrlFetcher2"));//美体
		list.add(new FetcherParam(6234, "http://www.lady8844.com/shoushen/ywyl/", "lady8844UrlFetcher2"));//美体
		list.add(new FetcherParam(6234, "http://www.lady8844.com/shoushen/jfjy/", "lady8844UrlFetcher2"));//美体
		list.add(new FetcherParam(6234, "http://www.lady8844.com/shoushen/jfcs/", "lady8844UrlFetcher2"));//美体
		
		int numPerThread;
		int threadNum = 10;
		if(list.size() % threadNum > 0) {
			numPerThread = (int) list.size() / threadNum + 1;
		} else {
			numPerThread = (int) list.size() / threadNum;
		}
		List<FetcherParam> sublist;
		int j = 0;
		int toIndex;
		int fromIndex = 0;
		while(fromIndex < list.size()) {
			toIndex = j * numPerThread + numPerThread;
			if(toIndex >= list.size()) {
				toIndex = list.size() - 1;
			}
			//System.out.println("list.size()=" + list.size() + ", fromIndex = " + fromIndex + ",  toIndex=" + toIndex);
			sublist = list.subList(fromIndex, toIndex);
			Fetcher f = new Fetcher();
			f.setFps(sublist);
			Thread thread = new Thread(f);
			thread.start();
			j++;
			fromIndex = j * numPerThread;
		}
		
		Fetcher f1 = new Fetcher();
		f1.fetchImages();
	}
	
	public void fetchImages() {
		ArticleDao articleDao = (ArticleDao) context.getBean("articleDao");
		List<Article> result = articleDao.findArticlesHadNotfetchedImages(0, 45);
		int artId;
		String artContent;
		Matcher matcher;
		Pattern p;
		String url;
		String firstImg;
		for (Article article : result) {
			artId = article.getId();
			artContent = article.getContent();
			p = Pattern.compile("src=\"?(.*?)(\"|>|\\s+)");
			matcher = p.matcher(artContent);
			
			firstImg = "";
			
			while (matcher.find()) {
//				System.out.println(matcher.group(1));
				url = matcher.group(1);
				ImageFetcher fetcher = new ImageFetcher(url);
				BufferedImage bi = fetcher.loadImageUrl();
				fetcher.writeImageLocal(bi);
				String img = fetcher.getRelativeNewImage();
				if(StringUtils.isEmpty(firstImg)) {
					firstImg = img;
				}
				articleDao.insertArticleImage(artId, img);
				artContent = artContent.replaceFirst(url, "http://static.number1g.com/upload/images/" + img);
			}
			articleDao.updateImages(artContent, firstImg, artId);
		}
	}
	
	public void fetch() {
		for (FetcherParam fetcherParam : fps) {
			UrlFetcher f = (UrlFetcher) context.getBean(fetcherParam.getBeanName());
			f.doFetching(fetcherParam.getUrl(), fetcherParam.getCateid());
		}
//		UrlFetcher f = (UrlFetcher) context.getBean(fp.getBeanName());
//		f.doFetching(fp.getUrl(), fp.getCateid());
	}
	
	@Override
	public void run() {
		fetch();
	}
	public void setFps(List<FetcherParam> fps) {
		this.fps = fps;
	}
	public List<FetcherParam> getFps() {
		return fps;
	}
}

class FetcherParam {
	private int cateid;
	private String url;
	private String beanName;
	
	public FetcherParam(int cateid, String url, String beanName) {
		this.cateid = cateid;
		this.url = url;
		this.beanName = beanName;
	}

	public int getCateid() {
		return cateid;
	}

	public void setCateid(int cateid) {
		this.cateid = cateid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getBeanName() {
		return beanName;
	}

	public void setBeanName(String beanName) {
		this.beanName = beanName;
	}
}
