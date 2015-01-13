package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.Stockholder;
import com.xiaoshuo.util.DbUtil;

/**
 * @author ÌÆ²®çù
 *
 */
public class StockholderManagerImpl {
	private static Log logger = LogFactory.getLog(StockholderManagerImpl.class);
	public static boolean add(Stockholder item) {
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
			mySql = "insert into `stock`.`stockholder` (`stockNum`, " +
					"`holderName`, `stockCount`, `stockScale`, `stockKind`)"
					+ " values(?,?,?,?,?)";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, item.getStockNum());
			ps.setString(2, item.getHolderName());
			ps.setString(3, item.getStockCount());
			ps.setString(4, item.getStockScale());
			ps.setString(5, item.getStockKind());
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
	public static Stockholder get(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		Stockholder item = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return item;
			mySql = "select `id`, `stockNum`, " +
					"`holderName`, `stockCount`, `stockScale`, `stockKind` from `stock`.`stockholder`"
					+ " where id = ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				item = new Stockholder();
				item.setId(rs.getInt(1));
				item.setStockNum(rs.getString(2));
				item.setHolderName(rs.getString(3));
				item.setStockCount(rs.getString(4));
				item.setStockScale(rs.getString(5));
				item.setStockKind(rs.getString(6));
			}

		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
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
	public static List<Stockholder> getItems(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		List<Stockholder> items = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return items;
			mySql = "select `id`, `stockNum`, " +
					"`holderName`, `stockCount`, `stockScale`, `stockKind` from `stock`.`stockholder`"
					+ " where stockNum = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs!=null){
				items = new ArrayList<Stockholder>();
			}
			if(rs!=null && rs.next()){
				Stockholder item = new Stockholder();
				item.setId(rs.getInt(1));
				item.setStockNum(rs.getString(2));
				item.setHolderName(rs.getString(3));
				item.setStockCount(rs.getString(4));
				item.setStockScale(rs.getString(5));
				item.setStockKind(rs.getString(6));
				items.add(item);
			}

		} catch (Exception e) {
			logger.error("getItems error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getItems" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getItems" + e.getMessage());
			}
		}
		return items;
	}
}
