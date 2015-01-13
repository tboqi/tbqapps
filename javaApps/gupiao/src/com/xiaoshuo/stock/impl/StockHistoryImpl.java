package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.StockHistory;
import com.xiaoshuo.util.DbUtil;

public class StockHistoryImpl {
	private static Log log = LogFactory.getLog(StockHistoryImpl.class);
	
	public static boolean add(StockHistory item){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "insert into stock.history (MemberId,Type,StockId,Hands,Price,Balance,TransTime) values(?,?,?,?,?,?,now())";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, item.getMemberId());
			ps.setInt(2, item.getType());
			ps.setString(3, item.getStockId());
			ps.setInt(4, item.getHands());
			ps.setString(5, ""+item.getPrice());
			ps.setString(6, ""+item.getBalance());
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("add error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps add" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn add" + e.getMessage());
			}
		}
		return ret;
	}

	public static StockHistory get(int id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		StockHistory su = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return null;
			mySql = "select Id, MemberId, Type, StockId, Hands, Price, Balance, TransTime " +
					" from stock.history " +
					" where Id = ?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				su = new StockHistory();
				su.setId(rs.getInt(1));
				su.setMemberId(rs.getLong(2));
				su.setType(rs.getInt(3));
				su.setStockId(rs.getString(4));
				su.setHands(rs.getInt(5));
				su.setPrice(NumberUtils.toFloat(rs.getString(6)));
				su.setBalance(NumberUtils.toFloat(rs.getString(7)));
				su.setTransTime(rs.getTimestamp(8));
			}
		} catch (Exception e) {
			log.error("get error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps get" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn get" + e.getMessage());
			}
		}
		return su;
	}

	public static int getCount(String whereClause){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		int cnt = -1;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return cnt;
			mySql = "select count(Id) " +
					" from stock.history " + 
					whereClause ;
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			log.error("getCount error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps getCount" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn getCount" + e.getMessage());
			}
		}
		return cnt;
	}
	
	public static int getTotal(){
		return getCount("");
	}
	
	public static List<StockHistory> getItems(String whereClause, int page, int count){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		StockHistory su = null;
		List<StockHistory> items = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return null;
			if(page<1)page=1;
			if(count<=0)count=10;
			mySql = "select Id, MemberId, Type, StockId, Hands, Price, Balance, TransTime " +
					" from stock.history " +
					whereClause+
					" order by Id desc " +
					" limit " + count*(page-1) + "," + count;
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			if(rs!=null)items = new ArrayList<StockHistory>();
			while(rs!=null && rs.next()){
				su = new StockHistory();
				su.setId(rs.getInt(1));
				su.setMemberId(rs.getLong(2));
				su.setType(rs.getInt(3));
				su.setStockId(rs.getString(4));
				su.setHands(rs.getInt(5));
				su.setPrice(NumberUtils.toFloat(rs.getString(6)));
				su.setBalance(NumberUtils.toFloat(rs.getString(7)));
				su.setTransTime(rs.getTimestamp(8));
				items.add(su);
			}
		} catch (Exception e) {
			log.error("getItems error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps getItems" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn getItems" + e.getMessage());
			}
		}
		return items;
	}

	public static List<StockHistory> getItems(long memberId, int page, int count){
		String whereClause = " where MemberId = " + memberId;
		return getItems(whereClause, page, count);
	}
	
	public static void main(String args[]){
		List<StockHistory> items = StockHistoryImpl.getItems(1186400, 1, 10);
		if(items!=null){
			log.info(items.get(0).toString());
		}
	}
}
