package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.Stock;
//import com.xiaoshuo.util.DbUtil;
import com.xiaoshuo.util.DbUtil;

public class StockManagerImpl {

	private static String FIELDS = " Id,Name,stockId,UpdateTime,Price,PriceChange,PriceChangePercent,TradingVolume ";

	private static Log logger = LogFactory.getLog(StockManagerImpl.class);

	public static List<String> getAllStockNum(){
		List<String> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return null;
			mySql = "select distinct stockId from stock.stock where isNew = 1";
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			list = new ArrayList<String>();
			while (rs != null && rs.next()) {
				list.add(rs.getString(1));
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
		return list;
	}
	public static List<Stock> getStockListByNum(String num, int start,
			int count, int order) {
		String orderBy = getOrderBy(order);

		List<Stock> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";

		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return null;
			mySql = "select "
					+ FIELDS
					+ " from stock.stock where StockId=? and date(UpdateTime)=date(now()) and hour(UpdateTime)>=9 and minute(UpdateTime)>20 and hour(UpdateTime)<15  "
					+ orderBy + " limit ?, ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, num);
			ps.setInt(2, start);
			ps.setInt(3, count);
			rs = ps.executeQuery();
			list = new ArrayList<Stock>();
			while (rs != null && rs.next()) {
				Stock stock = new Stock();
				stock.setId(rs.getInt(1));
				stock.setName(rs.getString(2));
				stock.setStockId(rs.getString(3));
				stock.setUpdateTime(rs.getTimestamp(4));
				stock.setPrice(NumberUtils.toFloat(rs.getString(5)));
				stock.setPriceChange(NumberUtils.toFloat(rs.getString(6)));
				stock.setPriceChangePercent(NumberUtils
						.toFloat(rs.getString(7)));
				stock.setTradingVolume(rs.getLong(8));
				list.add(stock);
			}
		} catch (Exception e) {
			logger.error("getStockListByNum error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getStockListByNum"
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
		return list;
	}

	private static String getOrderBy(int order) {
		String orderBy = "";
		switch (order) {
		case 1:
			orderBy = " order by Id ";
			break;
		case 2:
			orderBy = " order by Id desc ";
			break;
		case 3:
			orderBy = " order by UpdateTime";
			break;
		case 4:
			orderBy = " order by UpdateTime desc ";
			break;
		case 5:
			orderBy = " order by PriceChangePercent";
			break;
		case 6:
			orderBy = " order by PriceChangePercent desc ";
			break;

		default:
			orderBy = " order by StockId ";
			break;
		}
		return orderBy;
	}

	public static int getCountByNum(String num) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		int count = 0;

		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return 0;
			mySql = "select count(*) from stock.stock where StockId=?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			logger.error("getCountByNum error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger
						.error("error close rs/ps getCountByNum"
								+ e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getCountByNum" + e.getMessage());
			}
		}
		return count;
	}

	/**
	 * 鍙栧緱锟??鏂扮殑鏁版嵁
	 */
	public static List<Stock> getStockListIsNew(int start, int num, int order) {
		String orderBy = getOrderBy(order);
		List<Stock> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";

		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return null;
			mySql = "select " + FIELDS + " from stock.stock where isNew=1 "
					+ orderBy + " limit ?, ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, start);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			if (rs != null)
				list = new ArrayList<Stock>();
			while (rs != null && rs.next()) {
				Stock stock = new Stock();
				stock.setId(rs.getInt(1));
				stock.setName(rs.getString(2));
				stock.setStockId(rs.getString(3));
				stock.setUpdateTime(rs.getTimestamp(4));
				stock.setPrice(NumberUtils.toFloat(rs.getString(5)));
				stock.setPriceChange(NumberUtils.toFloat(rs.getString(6)));
				stock.setPriceChangePercent(NumberUtils
						.toFloat(rs.getString(7)));
				stock.setTradingVolume(rs.getLong(8));
				list.add(stock);
			}
		} catch (Exception e) {
			logger.error("getStockListIsNew error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getStockListIsNew"
						+ e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getStockListIsNew"
						+ e.getMessage());
			}
		}
		return list;
	}

	public static int getCountIsNew() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		int count = 0;

		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return 0;
			mySql = "select count(*) from stock.stock where isNew=1";
			ps = conn.prepareStatement(mySql);
			rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			logger.error("getCountIsNew error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger
						.error("error close rs/ps getCountIsNew"
								+ e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getCountIsNew" + e.getMessage());
			}
		}
		return count;
	}

	public static Stock get(int id) {
		Stock stock = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return null;
			mySql = "select " + FIELDS + " from stock.stock where id=?";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				stock = new Stock();
				stock.setId(rs.getInt(1));
				stock.setName(rs.getString(2));
				stock.setStockId(rs.getString(3));
				stock.setUpdateTime(rs.getDate(4));
				stock.setPrice(NumberUtils.toFloat(rs.getString(5)));
				stock.setPriceChange(NumberUtils.toFloat(rs.getString(6)));
				stock.setPriceChangePercent(NumberUtils
						.toFloat(rs.getString(7)));
				stock.setTradingVolume(rs.getLong(8));
			}
		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
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
		return stock;
	}

	public static Stock get(String stockId) {
		Stock stock = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return null;
			mySql = "select " + FIELDS
					+ " from stock.stock where isNew = 1 and StockId = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, stockId);
			rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				stock = new Stock();
				stock.setId(rs.getInt(1));
				stock.setName(rs.getString(2));
				stock.setStockId(rs.getString(3));
				stock.setUpdateTime(rs.getDate(4));
				stock.setPrice(NumberUtils.toFloat(rs.getString(5)));
				stock.setPriceChange(NumberUtils.toFloat(rs.getString(6)));
				stock.setPriceChangePercent(NumberUtils
						.toFloat(rs.getString(7)));
				stock.setTradingVolume(rs.getLong(8));
			}
		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
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
		return stock;
	}
	
	public static Stock getLast(String stockId) {
		Stock stock = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return null;
			mySql = "select " + FIELDS
					+ " from stock.stock where StockId=? order by UpdateTime desc limit 1";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, stockId);
			rs = ps.executeQuery();
			if (rs != null && rs.next()) {
				stock = new Stock();
				stock.setId(rs.getInt(1));
				stock.setName(rs.getString(2));
				stock.setStockId(rs.getString(3));
				stock.setUpdateTime(rs.getDate(4));
				stock.setPrice(NumberUtils.toFloat(rs.getString(5)));
				stock.setPriceChange(NumberUtils.toFloat(rs.getString(6)));
				stock.setPriceChangePercent(NumberUtils
						.toFloat(rs.getString(7)));
				stock.setTradingVolume(rs.getLong(8));
			}
		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
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
		return stock;
	}

	public static boolean setState() {
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if (conn == null)
				return ret;
			mySql = "update stock.stock set isNew=0 where isNew=1";
			ps = conn.prepareStatement(mySql);
			ps.executeUpdate();

			ret = true;
		} catch (Exception e) {
			logger.error("setState error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps setState" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn setState" + e.getMessage());
			}
		}
		return ret;
	}

	public static boolean add(Stock item) {
		Connection conn = null;
		PreparedStatement ps = null;
		String mySql = "";
		boolean ret = false;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnection();
			if (conn == null)
				return ret;
			mySql = "insert into stock.stock "
					+ "(Name,StockId,UpdateTime,Price,PriceChange,PriceChangePercent,TradingVolume)"
					+ " values(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, item.getName());
			ps.setString(2, item.getStockId());
			ps.setTimestamp(3, new Timestamp(item.getUpdateTime().getTime()));
			ps.setString(4, (new Float(item.getPrice())).toString());
			ps.setString(5, (new Float(item.getPriceChange())).toString());
			ps.setString(6, (new Float(item.getPriceChangePercent()))
					.toString());
			ps.setLong(7, item.getTradingVolume());
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

	/**
	 * 根据股票的stockId获得最新的股价
	 * @author tbq
	 * @param stockId
	 * @return
	 */
	public static float getLastPrice(String stockId) {
		float f = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return f;
			mySql = "select Price from stock.stock where StockId=? order by UpdateTime desc limit 1";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, stockId);
			rs = ps.executeQuery();
			if(rs != null && rs.next())
				f = rs.getFloat(1);
		} catch (Exception e) {
			logger.error("getLastPrice error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps getLastPrice" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn getLastPrice" + e.getMessage());
			}
		}
		return f;
	}
	
	public static List<Map<String, Object>> myStockList(long memberId){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		String stockId = "";
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return list;
			mySql = "select MemberId, StockId, Amount from stock.userstock where MemberId=? order by StockId";
			ps = conn.prepareStatement(mySql);
			ps.setLong(1, memberId);
			rs = ps.executeQuery();
			while(rs != null && rs.next()){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("memberId", rs.getLong(1));
				map.put("amount", rs.getInt(3));
				stockId = rs.getString(2);
				Stock stock = StockManagerImpl.get(stockId);
				map.put("stock", stock);
				list.add(map);
			}
		} catch (Exception e) {
			logger.error("myStockList error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				logger.error("error close rs/ps myStockList" + e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				logger.error("error close conn myStockList" + e.getMessage());
			}
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		List<Map<String, Object>> list = StockManagerImpl.myStockList(1000041);
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iter.next();
			System.out.print("memberId:" + map.get("memberId"));
			System.out.print("---amount:" + map.get("amount"));
			System.out.println("---stock:" + map.get("stock"));
		}
//		System.out.println(StockManagerImpl.getLastPrice("000001"));
//		System.out.println(StockManagerImpl.getCountIsNew());
//		List<Stock> list = StockManagerImpl.getStockListIsNew(0, 12, 6);
//		for (Stock stock : list) {
//			System.out.println(stock);
//		}
	}
}
