package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.StockUser;
import com.xiaoshuo.util.DbUtil;

public class StockUserImpl {
	private static Log log = LogFactory.getLog(StockUserImpl.class);
	
	public static boolean add(StockUser item){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "insert into stock.user (MemberId,Name,Balance,State,CreateTime) values(?,?,?,?,now())";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, item.getMemberId());
			ps.setString(2, item.getName());
			ps.setString(3, ""+item.getBalance());
			ps.setInt(4, item.getState());
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

	public static boolean update(StockUser item){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "update stock.user set" +
					" Name = ?, " +
					" Balance = ?, " +
					" State = ? " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, item.getName());
			ps.setString(2, ""+item.getBalance());
			ps.setInt(3, item.getState());
			ps.setLong(4, item.getMemberId());
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

	public static boolean credit(long memberId, int credit){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			credit = Math.abs(credit);
			mySql = "update stock.user set" +
					" Balance = Balance + ? ," + 
					" Credit = Credit + ? , " +
					" CreditTime = now() " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, credit);
			ps.setInt(2, credit);
			ps.setLong(3, memberId);
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("credit error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps credit" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn credit" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean uncredit(long memberId, int credit, float interest){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			credit = Math.abs(credit);
			mySql = "update stock.user set" +
					" Balance = Balance - ? ," + 
					" Credit = Credit - ? , " +
					" CreditTime = now() " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, ""+(credit+interest));
			ps.setInt(2, credit);
			ps.setLong(3, memberId);
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("uncredit error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps uncredit" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn uncredit" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean setState(Long memberId, int state){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "update stock.user set" +
					" State = ? " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, state);
			ps.setLong(2, memberId);
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("setState error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps setState" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn setState" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean incBalance(Long memberId, float balance){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "update stock.user set" +
					" Balance = Balance + ? " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, ""+balance);
			ps.setLong(2, memberId);
			ps.executeUpdate();
			ret = true;
		} catch (Exception e) {
			log.error("incPoints error:" + e.getMessage());
		} finally {
			try {
				if(ps!=null) ps.close();
			} catch (Exception e) {
				log.error("error close rs/ps incPoints" + e.getMessage());
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e) {
				log.error("error close conn incPoints" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean remove(Long memberId){
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if(conn==null)return ret;
			mySql = "delete from stock.user " +
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
	
	public static StockUser get(long memberId){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		StockUser su = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return null;
			mySql = "select MemberId, Name, Balance, State, Credit, CreditTime, CreateTime " +
					" from stock.user " +
					" where MemberId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, memberId);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				su = new StockUser();
				su.setMemberId(rs.getLong(1));
				su.setName(rs.getString(2));
				su.setBalance(NumberUtils.toFloat(rs.getString(3)));
				su.setState(rs.getInt(4));
				su.setCredit(rs.getInt(5));
				su.setCreditTime(rs.getTimestamp(6));
				su.setCreateTime(rs.getTimestamp(7));
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
			mySql = "select count(MemberId) " +
					" from stock.user " + 
					whereClause;
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
	
	public static List<StockUser> getItems(String whereClause){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		StockUser su = null;
		List<StockUser> items = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if(conn==null)return null;
			mySql = "select MemberId, Name, Balance, State, Credit, CreditTime, CreateTime " +
					" from stock.user " +
					whereClause;
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			if(rs!=null)items = new ArrayList<StockUser>();
			while(rs!=null && rs.next()){
				su = new StockUser();
				su.setMemberId(rs.getLong(1));
				su.setName(rs.getString(2));
				su.setBalance(NumberUtils.toFloat(rs.getString(3)));
				su.setState(rs.getInt(4));
				su.setCredit(rs.getInt(5));
				su.setCreditTime(rs.getTimestamp(6));
				su.setCreateTime(rs.getTimestamp(7));
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
	
	public static void main(String args[]){
		StockUser user = null;
		user = StockUserImpl.get(1186400);
		log.info(user.toString());
	}
	
}
