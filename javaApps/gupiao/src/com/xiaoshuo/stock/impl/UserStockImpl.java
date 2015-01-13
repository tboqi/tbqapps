package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.UserStock;
import com.xiaoshuo.util.DbUtil;

public class UserStockImpl {

	private static Log log = LogFactory.getLog(UserStockImpl.class);
	
	public static boolean add(UserStock item){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "insert into stock.userstock (MemberId,StockId,Amount,AvgPrice) values(?,?,?,?)";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, item.getMemberId());
			ps.setString(2, item.getStockId());
			ps.setInt(3, item.getAmount());
			ps.setString(4, ""+item.getAvgPrice());
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

	public static boolean update(UserStock item){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "update stock.userstock set" +
					" Amount = ? ," +
					" AvgPrice = ? " +
					" where MemberId = ? " +
					" and StockId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, item.getAmount());
			ps.setString(2, ""+item.getAvgPrice());
			ps.setLong(3, item.getMemberId());
			ps.setString(4, item.getStockId());
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("update error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps update" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn update" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean remove(long memberId){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "delete from stock.userstock " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, memberId);
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("remove error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps remove" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn remove" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean remove(long memberId, String stockId){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "delete from stock.userstock " +
					" where MemberId = ?" +
					" and StockId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, memberId);
			ps.setString(2, stockId);
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("remove error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps remove" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn remove" + e.getMessage());
			}
		}
		return ret;
	}
	
	public static UserStock get(long memberId, String stockId){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		UserStock su = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return null;
			mySql = "select Amount,AvgPrice " +
					" from stock.userstock " +
					" where MemberId = ? " +
					" and StockId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, memberId);
			ps.setString(2, stockId);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				su = new UserStock();
				su.setMemberId(memberId);
				su.setStockId(stockId);
				su.setAmount(rs.getInt(1));
				su.setAvgPrice(NumberUtils.toFloat(rs.getString(2)));
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

	public static int getAmount(long memberId, String stockId){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		int amount = -1;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return amount;
			mySql = "select Amount " +
					" from stock.userstock " +
					" where MemberId = ? " +
					" and StockId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, memberId);
			ps.setString(2, stockId);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				amount = rs.getInt(1);
			}
		} catch (Exception e) {
			log.error("getAmount error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps getAmount" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn getAmount" + e.getMessage());
			}
		}
		return amount;
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
			mySql = "select count(*) " +
					" from stock.userstock " + 
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
	
	public static List<UserStock> getItems(String whereClause, int page, int count){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		UserStock su = null;
		List<UserStock> items = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return null;
			if(page<1)page=1;
			if(count<=0)count=10;
			mySql = "select MemberId, StockId, Amount, AvgPrice " +
					" from stock.userstock " +
					whereClause +
					" order by Amount desc " +
					" limit " + count*(page-1) + "," + count;
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			if(rs!=null)items = new ArrayList<UserStock>();
			while(rs!=null && rs.next()){
				su = new UserStock();
				su.setMemberId(rs.getLong(1));
				su.setStockId(rs.getString(2));
				su.setAmount(rs.getInt(3));
				su.setAvgPrice(NumberUtils.toFloat(rs.getString(4)));
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

	public static List<UserStock> getItemsByMemberId(long memberId, int page, int count){
		String whereClause = " where MemberId = " + memberId;
		return getItems(whereClause, page, count);
	}

	public static List<UserStock> getItemsByStockId(String stockId, int page, int count){
		String whereClause = " where StockId = '" + stockId + "' ";
		return getItems(whereClause, page, count);
	}
	
	public static int getCountByMemberId(long memberId){
		String whereClause = " where MemberId = " + memberId;
		return getCount(whereClause);
	}
	
	public static boolean buy(long memberId, String stockId, int amount, float price){
		boolean rtn = false;
		UserStock us = get(memberId, stockId);
		amount = Math.abs(amount);
		if(us==null){
			us = new UserStock();
			us.setMemberId(memberId);
			us.setStockId(stockId);
			us.setAmount(amount);
			us.setAvgPrice(price);
			rtn = add(us);
		}
		else{
			float avgPrice = (us.getAvgPrice()*us.getAmount()+amount*price)/(us.getAmount()+amount);
			us.setAmount(us.getAmount()+amount);
			us.setAvgPrice(avgPrice);
			rtn = update(us);
		}
		
		return rtn;
	}

	public static boolean sell(long memberId, String stockId, int amount){
		boolean rtn = false;
		UserStock us = get(memberId, stockId);
		amount = Math.abs(amount);
		if(us!=null && us.getAmount()>=amount){
			us.setAmount(us.getAmount()-amount);
			rtn = update(us);
			if(us.getAmount()==0)remove(memberId,stockId);
		}
		
		return rtn;
	}
	
	public static void main(String args[]){

	}
}
