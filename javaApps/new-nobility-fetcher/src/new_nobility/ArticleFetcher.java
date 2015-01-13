package new_nobility;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yuqi.utils.ChentuUtils;
import com.yuqi.utils.HtmlUtils;
import com.yuqi.utils.SecurityUtils;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.StartTag;


public class ArticleFetcher {
	private String url;
	private Source source;
	
	private int cateid;
	
	private static Log log = LogFactory.getLog(ArticleFetcher.class);
	
	public ArticleFetcher(String url, int cateid) {
		this.url = url;
		this.cateid = cateid;
	}
	
	public void fetch() {
		Article art = new Article();
		
		if(art.urlIsFectched(url)) {
			log.info("url fetched:" + url);
			return;
		}
		
		parseHtmlSource();
		
		art.setDesc(this.getDescription());
		art.setTitle(this.getTitle());
		art.setTags(getKeywords());
		art.setUrl(url);
		art.setContent(parseContent());
//		art.setCategory(getCategory());
		
		if(StringUtils.isEmpty(art.getContent())) {
			String fetchError = "no content";
//			saveurl(0, fetchError);
		} else {
			saveArticle(art);
			saveurl(1, "success");
		}
	}
	
	private void saveArticle(Article art) {
		if(sqlconn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				sqlconn = DriverManager.getConnection(dbURL,"C321871_khnblog","1qaz!QAZ");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		PreparedStatement sm;
		Statement sm1;
		try {
			sm1 = sqlconn.createStatement();
			String sql = "insert INTO `wp_posts`(`post_author`,`post_date`,`post_date_gmt`," +
			"`post_content`, `post_title`,`post_excerpt`,`post_status`,`comment_status`," +
			"`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`," +
			"`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`," +
			"`post_type`,`post_mime_type`,`comment_count`)" +
			" values (1, now(), now(), " +
			"'" + art.getContent() + "', '" + art.getTitle() + "', '', 'publish', 'open', " +
			"'open', '', '" + art.getTitle() + "', '', '', NOW(), " +
			"NOW(), '', '0','','0','post','','0')";
			sm = sqlconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			sm.executeUpdate();
			ResultSet rs = sm.getGeneratedKeys();
			rs.next();
			int aid = rs.getInt(1);
			
			sql = "insert into wp_term_relationships (object_id, term_taxonomy_id, term_order) " +
					"values ('" + aid + "', '" + this.cateid + "', 0)";
			sm = sqlconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			sm.executeUpdate();
			sql = "update wp_term_taxonomy set `count`=count+1 where term_taxonomy_id='" + this.cateid + "'";
			sm = sqlconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			sm.executeUpdate();
			
			String keywords = "";
			String split = "";
			for (Tag tag : art.getTags()) {
				String tagname = tag.getTagName();
				if(StringUtils.isEmpty(tagname)) {
					continue;
				}
				keywords += split + tagname;
				split = ",";
				
				sql = "SELECT t.term_id FROM wp_terms t, wp_term_taxonomy tt WHERE tt.term_id=t.term_id " +
						"AND taxonomy='post_tag' AND t.`name`='" + tagname + "'";
				ResultSet result = sm1.executeQuery(sql);
				int tagid;
				if(!result.next()) {
					sql = "insert into wp_terms values (null, '" + tagname + "', '" + SecurityUtils.md5(tagname) + "', 0)";
//					System.out.println(sql);
					sm = sqlconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					sm.executeUpdate();
					rs = sm.getGeneratedKeys();
					rs.next();
					tagid = rs.getInt(1);
					sql = "insert into wp_term_taxonomy values ('" + tagid + "', '" + tagid + "', 'post_tag', '', 0, 1)";
					sm1.executeUpdate(sql);
				} else {
					tagid = result.getInt("term_id");
					sql = "update wp_term_taxonomy set `count`=count+1 where term_id='" + tagid + "'";
					sm1.executeUpdate(sql);
				}
				sql = "insert into wp_term_relationships values ('" + aid + "', '" + tagid + "', 0)";
				sm1.executeUpdate(sql);
			}
			if(!StringUtils.isEmpty(keywords)) {
				sql = "insert into wp_postmeta values (null, '" + aid + "', '_aioseop_keywords', '" + keywords + "')";
				sm1.executeUpdate(sql);
			}
			if(!StringUtils.isEmpty(art.getTitle())) {
				sql = "insert into wp_postmeta values (null, '" + aid + "', '_aioseop_title', '" + art.getTitle() + "')";
				sm1.executeUpdate(sql);
			}
			if(!StringUtils.isEmpty(art.getDesc())) {
				sql = "insert into wp_postmeta values (null, '" + aid + "', '_aioseop_description', '" + art.getDesc() + "')";
				sm1.executeUpdate(sql);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public static Connection sqlconn = null;
	private String dbURL = "jdbc:mysql://mysql1008.ixwebhosting.com:3306/C321871_number1g?characterEncoding=utf-8";
	
	private void saveurl(int status, String error) {
		if(sqlconn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				sqlconn = DriverManager.getConnection(dbURL,"C321871_khnblog","1qaz!QAZ");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Statement sm;
		try {
			sm = sqlconn.createStatement();
			sm.execute("insert into my_fetchurl (url, `status`, cate_id, error)" +
					"values ('" + url + "', "+ status +", " + this.cateid + ", '" + error + "')");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	private ArticleCategory getCategory() {
		Element e = HtmlUtils.getElementById(source, "lo_links");
		List<Element> list = e.getAllElements("a");
		if(list.size() < 2) {
			log.info("no category:" + url);
			return null;
		} else {
			e = list.get(1);
//			System.out.println(e.getTextExtractor().toString());
			return new ArticleCategory(e.getTextExtractor().toString());
		}
	}
	
	private String parseContent() {
		String tagclass = "detail_cnt";
		List<StartTag> startTags = source.getAllStartTagsByClass(tagclass);
		Element e;
		if(startTags.size() < 1) {
			log.info("no tag with class " + tagclass + ":" + url);
			//return "";
			e = source.getElementById("artibody");
			log.info("content id : artibody " + tagclass + ":" + url);
//			System.out.println(e);
		} else {
			StartTag startTag = startTags.get(0);
			e = startTag.getElement();
		}
		
		if(e == null) {
			log.info("no content :" + url);
			saveurl(0, "no content");
			return "";
		}
		List<Element> list2 = e.getAllElements("select");
		if(list2.size() > 0) {
			log.error("more pages: " + url);
			saveurl(0, "more pages");
			return "";
		}
		List<Element> list = e.getChildElements();
		String content = "";
		for (Element element : list) {
			String eclass = element.getAttributeValue("class");
			if(StringUtils.equalsIgnoreCase(eclass, "clear")) {
				break;
			}
			content += element.toString();
		}
		content = content.replaceAll("'", "\\\\\'");
//		System.out.println(content);
		return content;
	}
	
	private String getDescription() {
		List<Element> elements = source.getAllElements("name", "description", false);
		if(elements.size() < 1) {
			log.info("no description:" + url);
			return "";
		}
		Element e = elements.get(0);
		String description = e.getAttributeValue("content");
		description = description.replaceAll("-奢侈品频道-和讯网", "");
		return description;
	}
	
	private String getTitle() {
		Element element = source.getFirstElement("title");
		String title = element.getTextExtractor().toString();
		title = title.replaceAll("-奢侈品频道-和讯网", "");
		return title;
	}
	
	private List<Tag> getKeywords() {
		List<Element> elements = source.getAllElements("name", "keywords", false);
		Element e = elements.get(0);
		if(elements.size() < 1) {
			log.info("no keywords: " + url);
			return null;
		}
		String keywords = e.getAttributeValue("content");
		List<Tag> taglist = new ArrayList<Tag>();
		log.info("keywords: " + keywords + ";;" + url);
		String[] tags = keywords.split(",");
		for (String tag : tags) {
			tag = tag.trim();
			taglist.add(new Tag(tag));
		}
		return taglist;
	}

	private void parseHtmlSource() {
		try {
			source = new Source(ChentuUtils.getURLConnection(url));
		} catch (IOException e) {
			log.error("source error: " + url);
		}
	}
	
	public static void main(String[] args) {
		ArticleFetcher af = new ArticleFetcher("http://lux.hexun.com/2011-03-19/128050957.html", 1);
		af.fetch();
	}
}
