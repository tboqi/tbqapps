package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.News;
import com.xiaoshuo.util.DbUtil;

/**
 * @author ÌÆ²®çù
 * 
 */
public class NewsManagerImpl {
	private static Log logger = LogFactory.getLog(NewsManagerImpl.class);

	public static boolean hasOldUrl(String url){
		boolean b = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		int count;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return false;
			mySql = "select count(*) from stock.news where oldUrl=?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, url);
			rs = ps.executeQuery();
			if(rs != null && rs.next()) {
				count = rs.getInt(1);
				if(count > 1) b = true;
			}
		} catch (Exception e) {
			logger.error("getAllStockNum error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getAllStockNum"
						+ e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getStockListByNum"
						+ e.getMessage());
			}
		}
		return b;
	}
	public static boolean add(News item) {
		if (item == null)
			return false;
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if (conn == null)
				return ret;
			mySql = "insert into stock.news "
					+ "(`title`, `content`, `stockNum`, `pubDate`, `oldUrl`)"
					+ " values(?,?,?,?,?)";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, item.getTitle());
			ps.setString(2, item.getContent());
			ps.setString(3, item.getStockNum());
			ps.setDate(4, new Date(item.getPubDate().getTime()));
			ps.setString(5, item.getOldUrl());
			ps.executeUpdate();

			ret = true;
		} catch (Exception e) {
			logger.error("add error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps add" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn add" + e.getMessage());
			}
		}
		return ret;
	}
	public static News get(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		News item = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return item;
			mySql = "select `id`, `title`, `content`, `stockNum`, `pubDate`, `oldUrl` from stock.news where id = ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				item = new News();
				item.setId(rs.getInt(1));
				item.setTitle(rs.getString(2));
				item.setContent(rs.getString(3));
				item.setStockNum(rs.getString(4));
				item.setPubDate(rs.getTimestamp(5));
				item.setOldUrl(rs.getString(6));
			}

		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				logger.error("error close rs/ps get" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn get" + e.getMessage());
			}
		}
		return item;
	}
	public static int getCount(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		int count = -1;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return count;
			mySql = "select count(id) from stock.news where stockNum = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			logger.error("getCount error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getCount" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getCount" + e.getMessage());
			}
		}
		return count;
	}
	public static List<News> getNews(String id, int page, int count) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		List<News> items = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return items;
			if(page<1)page=1;
			int start = (page-1)*count;
			mySql = "select `id`, `title`, `content`, `stockNum`, `pubDate`, `oldUrl` from stock.news where stockNum = ?" +
					"order by id desc limit " + start + "," + count;
			ps = conn.prepareStatement(mySql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs!=null){
				items = new ArrayList<News>();
			}
			while(rs!=null && rs.next()){
				News item = new News();
				item.setId(rs.getInt(1));
				item.setTitle(rs.getString(2));
				item.setContent(rs.getString(3));
				item.setStockNum(rs.getString(4));
				item.setPubDate(rs.getTimestamp(5));
				item.setOldUrl(rs.getString(6));
				items.add(item);
			}

		} catch (Exception e) {
			logger.error("getNews error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getNews" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getNews" + e.getMessage());
			}
		}
		return items;
	}
	public static List<News> getNews(int page, int count) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		List<News> items = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return items;
			if(page<1)page=1;
			int start = (page-1)*count;
			mySql = "select `id`, `title`, `content`, `stockNum`, `pubDate`, `oldUrl` from stock.news " +
					"order by pubDate desc limit " + start + "," + count;
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			if(rs!=null){
				items = new ArrayList<News>();
			}
			while(rs!=null && rs.next()){
				News item = new News();
				item.setId(rs.getInt(1));
				item.setTitle(rs.getString(2));
				item.setContent(rs.getString(3));
				item.setStockNum(rs.getString(4));
				item.setPubDate(rs.getTimestamp(5));
				item.setOldUrl(rs.getString(6));
				items.add(item);
			}

		} catch (Exception e) {
			logger.error("getNews error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getNews" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getNews" + e.getMessage());
			}
		}
		return items;
	}
}
