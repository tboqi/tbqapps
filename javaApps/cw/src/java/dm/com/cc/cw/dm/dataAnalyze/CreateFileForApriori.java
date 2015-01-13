package com.cc.cw.dm.dataAnalyze;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.log4j.Logger;

import com.cc.cw.dm.DBUtils.DBBaseDao;
import com.cc.cw.web.CwConfiguration;

public class CreateFileForApriori {
	private Connection conn;
	
	private String clickLogTable;
	private static String baseDir = CwConfiguration.create().get("dm.path");
	
	static Logger log = Logger.getLogger("dmLogger");
	
	private ArrayList getUserList() throws SQLException{
		String sql = "select distinct uuid from "+clickLogTable;
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
		return (ArrayList)qr.query(conn, sql, rsh);
	}
	private Map getArticleListByUUID(ArrayList userList) throws SQLException{
		String sql = "select distinct articleid from "+ clickLogTable +" where uuid=?";
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        Map<String, Set> map = new HashMap<String, Set>();
		for (Iterator it = userList.iterator(); it.hasNext();) {
			String uuid = (String) ((Object[])it.next())[0];
			ArrayList al = (ArrayList) qr.query(conn, sql, uuid, rsh);
			map.put(uuid, getLabelsFromArticleList(al));
		}
		return map;
	}
	private Set<String> getLabelsFromArticleList(ArrayList list) throws SQLException{
		String sql = "select Content from atomLabel where ArticleId=? order by Count desc limit 0,2";
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        Set<String> set = new HashSet<String>();
		for (Iterator it = list.iterator(); it.hasNext();) {
			Integer articleId = (Integer) ((Object[])it.next())[0];
			ArrayList al = (ArrayList)qr.query(conn, sql, articleId, rsh);
			for (Iterator iter = al.iterator(); iter.hasNext();) {
				Object[] e = (Object[]) iter.next();
				for (int i = 0; i < e.length; i++) {
					if(e[i]!=null && !e[i].equals(""))
						set.add((String)e[i]);
				}
			}
		}
		return set;
	}
	private void writeToFileForApriori(Map map) throws SQLException, FileNotFoundException, UnsupportedEncodingException{
		if(!new File(baseDir).exists()){
			new File(baseDir).mkdirs();
		}
		File file = new File(baseDir+"cw_dmsource_"+getPreMonthIndex());
		PrintWriter pw = new PrintWriter(file,"utf-8");
		for (Iterator it = map.values().iterator(); it.hasNext();) {
			Set e = (Set) it.next();
			StringBuffer sb = new StringBuffer();
			for (Iterator iter = e.iterator(); iter.hasNext();) {
				String str = (String) iter.next();
				sb.append(str+";");
			}
			if(sb.length()>0){
				pw.println(sb.toString().substring(0,sb.length()-1));
			}
		}
		pw.flush();
		pw.close();
	}
	public void execute(){
		log.info("CreateFileForApriori begin===>");
		clickLogTable = "clicklog_"+getPreMonthIndex();
		try {
			conn = DBBaseDao.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("CreateFileForApriori ERROR ====> get connection exception \n" + e.getMessage());
		}
		Map map = null;
		try {
			ArrayList al = getUserList();
			map = getArticleListByUUID(al);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(map!=null){
			try {
				writeToFileForApriori(map);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				log.error("CreateFileForApriori ERROR ====> File NOT FOUND exception \n" + e.getMessage());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				log.error("CreateFileForApriori ERROR ====> UnsupportedEncodin exception \n" + e.getMessage());
			} catch (SQLException e) {
				e.printStackTrace();
				log.error("CreateFileForApriori ERROR ====> SQL exception \n" + e.getMessage());
			}
		}
		try {
			if(conn!=null){conn.close();conn=null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			log.info("CreateFileForApriori end===>");
			DoProcess.execute();
		}
	}
	public static String getPreMonthIndex(){
		Calendar c =Calendar.getInstance();
//		c.add(Calendar.MONTH, -1);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMM");
		return df.format(c.getTime());
	}
	public static void main(String[] args) {
		CreateFileForApriori c = new CreateFileForApriori();
		c.execute();
	}
}
