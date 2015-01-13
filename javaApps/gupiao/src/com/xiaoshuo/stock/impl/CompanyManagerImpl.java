package com.xiaoshuo.stock.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.xiaoshuo.stock.domain.Company;
import com.xiaoshuo.util.DbUtil;

public class CompanyManagerImpl {
	private static Log logger = LogFactory.getLog(StockManagerImpl.class);

	@SuppressWarnings("unused")
	private static String fields = "`id`, `fullName`, `stockName`, `stockNum`, `tocalStock`, `currentStock`, `publishDate`, `marketDate`, `industry`, `area`, `taxRate`, `corporateRepresentative`, `linkman`, `mainUnderwriter`, `address`, `postalcode`, `tele`, `fax`, `email`, `comUrl`, `scopeOfBusiness`, `product`, `description`";

	public static boolean add(Company item) {
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
			mySql = "insert into stock.company "
					+ "(`fullName`, `stockName`, `stockNum`, `tocalStock`, `currentStock`, `publishDate`, "
					+ "`marketDate`, `industry`, `area`, `taxRate`, `corporateRepresentative`, "
					+ "`linkman`, `mainUnderwriter`, `address`, `postalcode`, `tele`, `fax`, "
					+ "`email`, `comUrl`, `scopeOfBusiness`, `product`, `description`)"
					+ " values(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?)";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, item.getFullName());
			ps.setString(2, item.getStockName());
			ps.setString(3, item.getStockNum());
			ps.setString(4, item.getTocalStock());
			ps.setString(5, item.getCurrentStock());
			ps.setString(6, item.getPublishDate());
			ps.setString(7, item.getMarketDate());
			ps.setString(8, item.getIndustry());
			ps.setString(9, item.getArea());
			ps.setString(10, item.getTaxRate());
			ps.setString(11, item.getCorporateRepresentative());
			ps.setString(12, item.getLinkman());
			ps.setString(13, item.getMainUnderwriter());
			ps.setString(14, item.getAddress());
			ps.setString(15, item.getPostalcode());
			ps.setString(16, item.getTele());
			ps.setString(17, item.getFax());
			ps.setString(18, item.getEmail());
			ps.setString(19, item.getComUrl());
			ps.setString(20, item.getScopeOfBusiness());
			ps.setString(21, item.getProduct());
			ps.setString(22, item.getDescription());
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
	
	public static Company get(int id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		Company item = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return item;
			mySql = "select " + fields + " from stock.company where id = ?";
			ps = conn.prepareStatement(mySql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				item = new Company();
				item.setId(rs.getInt(1));
				item.setFullName(rs.getString(2));
				item.setStockName(rs.getString(3));
				item.setStockNum(rs.getString(4));
				item.setTocalStock(rs.getString(5));
				item.setCurrentStock(rs.getString(6));
				item.setPublishDate(rs.getString(7));
				item.setMarketDate(rs.getString(8));
				item.setIndustry(rs.getString(9));
				item.setArea(rs.getString(10));
				item.setTaxRate(rs.getString(11));
				item.setCorporateRepresentative(rs.getString(12));
				item.setLinkman(rs.getString(13));
				item.setMainUnderwriter(rs.getString(14));
				item.setAddress(rs.getString(15));
				item.setPostalcode(rs.getString(16));
				item.setTele(rs.getString(17));
				item.setFax(rs.getString(18));
				item.setEmail(rs.getString(19));
				item.setComUrl(rs.getString(20));
				item.setScopeOfBusiness(rs.getString(21));
				item.setProduct(rs.getString(22));
				item.setDescription(rs.getString(23));
			}

		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)ps.close();
				if (rs != null)rs.close();
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

	public static Company _get(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String mySql = "";
		Company item = null;
		try {
			conn = DbUtil.getInstance().getXiaoshuoConnectionRead();
			if (conn == null)
				return item;
			mySql = "select " + fields + " from stock.company where stockNum = ?";
			ps = conn.prepareStatement(mySql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs!=null && rs.next()){
				item = new Company();
				item.setId(rs.getInt(1));
				item.setFullName(rs.getString(2));
				item.setStockName(rs.getString(3));
				item.setStockNum(rs.getString(4));
				item.setTocalStock(rs.getString(5));
				item.setCurrentStock(rs.getString(6));
				item.setPublishDate(rs.getString(7));
				item.setMarketDate(rs.getString(8));
				item.setIndustry(rs.getString(9));
				item.setArea(rs.getString(10));
				item.setTaxRate(rs.getString(11));
				item.setCorporateRepresentative(rs.getString(12));
				item.setLinkman(rs.getString(13));
				item.setMainUnderwriter(rs.getString(14));
				item.setAddress(rs.getString(15));
				item.setPostalcode(rs.getString(16));
				item.setTele(rs.getString(17));
				item.setFax(rs.getString(18));
				item.setEmail(rs.getString(19));
				item.setComUrl(rs.getString(20));
				item.setScopeOfBusiness(rs.getString(21));
				item.setProduct(rs.getString(22));
				item.setDescription(rs.getString(23));
			}

		} catch (Exception e) {
			logger.error("get error:" + e.getMessage());
		} finally {
			try {
				if (ps != null)ps.close();
				if (rs != null)rs.close();
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

}
