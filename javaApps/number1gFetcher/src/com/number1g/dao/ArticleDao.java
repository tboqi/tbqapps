package com.number1g.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.mysql.jdbc.Statement;
import com.number1g.entity.Article;
import com.number1g.entity.Tag;
import com.yuqi.utils.SecurityUtils;

public class ArticleDao extends JdbcDaoSupport {

	public ArticleDao() {
		// TODO Auto-generated constructor stub
	}

	public int save(Article art) {
		final String sql = "INSERT INTO `wp_posts` (`post_author`, `post_date`, `post_date_gmt`, " +
			"`post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, " +
			"`ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, " +
			"`post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, " +
			"`post_type`, `post_mime_type`, `comment_count`, source_url) " +
			"VALUES" +
			"('1', now(), now(), " +
			"'" + art.getContent() + "', '" + art.getTitle() + "', '', 'publish', 'open', " + 
			"'open', '', '" + art.getTitle() + "', '', '', now(), " +
			"now(), '', 0, '', 0," +
			"'post', '', 0, '" + art.getSourceUrl() + "')";
		 KeyHolder keyHolder = new GeneratedKeyHolder(); 
		getJdbcTemplate().update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}

	public void saveUrl(String url, String parseError, int cateid) {
		String sql = "INSERT INTO `my_fetchurl` (`url`, `status`, `cate_id`, `error`)" +
				"VALUES ('"+url+"', 1, "+cateid+", '"+parseError+"')";
		getJdbcTemplate().execute(sql);
	}
	
	public void saveCate(int artid, int cateid) {
		String sql = "insert into wp_term_relationships (object_id, term_taxonomy_id, term_order) " +
			"values ('" + artid + "', '" + cateid + "', 0)";
		getJdbcTemplate().execute(sql);
		sql = "update wp_term_taxonomy set `count`=count+1 where term_taxonomy_id='" + cateid + "'";
		getJdbcTemplate().execute(sql);
	}
	
	public void updateImages(String content, String images, int id) {
		content = StringEscapeUtils.escapeSql(content);
		String sql = "update wp_posts set `had_fetched_images`=1, " +
				"post_content='" + content + "', images='" + images + "' " +
				"where ID='" + id + "'";
		getJdbcTemplate().execute(sql);
	}
	
	public void saveTags(List<Tag> tags, int aid) {
		for (Tag tag : tags) {
			String tagname = tag.getTagName();
			if(StringUtils.isEmpty(tagname)) {
				continue;
			}
			
			String sql = "SELECT count(*) FROM wp_terms t, wp_term_taxonomy tt " +
					"WHERE tt.term_id=t.term_id " + 
					"AND taxonomy='post_tag' AND t.`name`='" + tagname + "' " +
					"limit 1";
			int num = getJdbcTemplate().queryForInt(sql);
			int tagid = 0;
			if (num > 0) {
				sql = "SELECT t.term_id FROM wp_terms t, wp_term_taxonomy tt WHERE tt.term_id=t.term_id " +
				"AND taxonomy='post_tag' AND t.`name`='" + tagname + "' limit 1";
				tagid = getJdbcTemplate().queryForInt(sql);
				sql = "update wp_term_taxonomy set `count`=count+1 where term_id='" + tagid + "'";
				getJdbcTemplate().execute(sql);
			} else {
				tagid = insertTag(tagname);
			}
			sql = "insert into wp_term_relationships values ('" + aid + "', '" + tagid + "', 0)";
			getJdbcTemplate().execute(sql);
		}
	}
	
	public boolean urlIsFetched(String url) {
		boolean b = false;
		String sql = "SELECT COUNT(*) AS c FROM my_fetchurl WHERE url='" + url + "'";
		int num = this.getJdbcTemplate().queryForInt(sql);
		if(num > 0) {
			b = true;
		}
		return b;
	}
	
	private int insertTag(String tagname) {
		final String sql = "insert into wp_terms values (null, '" + tagname + "', '" + SecurityUtils.md5(tagname) + "', 0)";
		KeyHolder keyHolder = new GeneratedKeyHolder(); 
		getJdbcTemplate().update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con)
			throws SQLException {
				PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				return ps;
			}
		}, keyHolder);
		int tagid = keyHolder.getKey().intValue();
		String sql1 = "insert into wp_term_taxonomy values ('" + tagid + "', '" + tagid + "', 'post_tag', '', 0, 1)";
		getJdbcTemplate().execute(sql1);
		return tagid;
	}

	public void saveMetas(Map<String, String> metas, int aid) {
		String sql = "insert into wp_postmeta values ";
		String split = "";
		if(StringUtils.isNotEmpty(metas.get("_aioseop_keywords"))) {
			sql += split + "(null, '" + aid + "', '_aioseop_keywords', '" + metas.get("_aioseop_keywords") + "')";
			split = ",";
		}
		if(StringUtils.isNotEmpty(metas.get("_aioseop_description"))) {
			sql += split + "(null, '" + aid + "', '_aioseop_description', '" + metas.get("_aioseop_description") + "')";
			split = ",";
		}
		if(StringUtils.isNotEmpty(metas.get("_aioseop_title"))) {
			sql += split + "(null, '" + aid + "', '_aioseop_title', '" + metas.get("_aioseop_title") + "')";
		}
		getJdbcTemplate().execute(sql);
	}
	
	public List<Article> findArticlesHadNotfetchedImages(int start, int num) {
		String sql = "SELECT ID as id, post_content as content FROM wp_posts where had_fetched_images=0 and post_status='publish' order by ID desc limit "
				+ start + ", " + num;
		List<Article> result = this.getJdbcTemplate().query(sql, new ArtMapper());
		return result;
	}
	
	private static final class ArtMapper implements RowMapper {

	    public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
	    	Article art = new Article();
	    	art.setContent(rs.getString("content"));
	    	art.setId(rs.getInt("id"));
	        return art;
	    }
	}

	public void insertArticleImage(int artId, String relativeNewImage) {
		String sql1 = "INSERT INTO `my_post_image` (`art_id`, `image`) VALUES (" + artId + ", '" + relativeNewImage + "')";
		getJdbcTemplate().execute(sql1);
	}
}
