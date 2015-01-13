package new_nobility;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yuqi.utils.HtmlUtils;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.StartTag;

public class Fetcher implements Runnable  {
	private String categoryName;
	private int categoryId;
	private static Log log = LogFactory.getLog(Fetcher.class);
	public static Connection sqlconn = null;
	
	public Fetcher(String categoryName, int categoryId) {
		super();
		this.categoryName = categoryName;
		this.categoryId = categoryId;
	}

	public static void main(String[] args) {
		List<Category> list = new ArrayList<Category>();
		list.add(new Category("watch", 1));
		list.add(new Category("costume", 3));
		list.add(new Category("mansion", 4));
		list.add(new Category("car", 5));
		list.add(new Category("liquor-cigar", 6));
		list.add(new Category("celebrity", 7));
		list.add(new Category("industry", 8));
		list.add(new Category("jewelry", 9));
		list.add(new Category("chaonanchaonv", 10));
		list.add(new Category("meihaojiaju", 11));
		list.add(new Category("meironghufu", 12));
		list.add(new Category("chihewanle", 13));
		list.add(new Category("xingzoutianxia", 14));
		for (Category category : list) {
			Fetcher f = new Fetcher(category.getCategoryName(), category.getCategoryId());
			Thread thread = new Thread(f);
			thread.start();
		}
	}
	
	public List<String> parseUrls(Element element) {
		List<String> urls = new ArrayList<String>();
		
		Element e = null;
		List<Element> elements = null;
		List<StartTag> startTags = element.getAllStartTagsByClass("temp01");
		for (StartTag startTag : startTags) {
			e = startTag.getElement();
			elements = e.getAllElements("a");
			for (Element element2 : elements) {
				System.out.println(element2.getAttributeValue("href"));
				urls.add(element2.getAttributeValue("href"));
			}
		}
		return urls;
	}
	
	private boolean urlIsFetched(String url) {
		if(sqlconn == null) {
			String dbURL = "jdbc:mysql://mysql1008.ixwebhosting.com:3306/C321871_number1g?characterEncoding=utf-8";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				sqlconn = DriverManager.getConnection(dbURL,"C321871_khnblog","1qaz!QAZ");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Statement sm;
		try {
			sm = sqlconn.createStatement();
			String sql = "SELECT COUNT(*) AS c FROM my_fetchurl WHERE url='" + url + "'";
			ResultSet result = sm.executeQuery(sql);
			result.next();
			int number = result.getInt("c");
			if(number <= 0) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e1) {
			return false;
		}
	}
	
	public void saveUrl(String url) {
		if(sqlconn == null) {
			String dbURL = "jdbc:mysql://mysql1008.ixwebhosting.com:3306/C321871_number1g?characterEncoding=utf-8";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				sqlconn = DriverManager.getConnection(dbURL,"C321871_khnblog","1qaz!QAZ");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Statement sm;
		try {
			sm = sqlconn.createStatement();
			String sql = "SELECT COUNT(*) AS c FROM urls WHERE url='" + url + "'";
			ResultSet result = sm.executeQuery(sql);
			result.next();
			int number = result.getInt("c");
			if(number <= 0) {
				sm.execute("insert into urls (url, category_id, has_fetched, create_time)" +
						"values ('" + url + "', "+ this.categoryId +", 0, now())");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public void doFetching() throws IOException {
		Element element = null;
		int i = 0;
		do {
			String url;
			if(i <= 0) {
				url = "http://lux.hexun.com/" + this.categoryName + "/index.html";
			} else {
				url = "http://lux.hexun.com/" + this.categoryName + "/index-" + i + ".html";
			}
			
			Source source = HtmlUtils.parseHtmlSource(url);
			element = HtmlUtils.getElementById(source, "mainbox");
			if(element != null) {
				List<String> urls = this.parseUrls(element);
				for (String url2 : urls) {
					if(this.urlIsFetched(url2)) {
						log.info("url is fetched : " + url2);
						continue;
					}
					ArticleFetcher af = new ArticleFetcher(url2, this.categoryId);
					af.fetch();
				}
			}
			i++;
		}while(element != null);
	}

	@Override
	public void run() {
		try {
			this.doFetching();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

class Category {
	private String categoryName;
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	private int categoryId;
	public Category(String categoryName, int categoryId) {
		super();
		this.categoryName = categoryName;
		this.categoryId = categoryId;
	}
}