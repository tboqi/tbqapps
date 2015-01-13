package com.cc.cw.dm.dataAnalyze;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.cc.cw.dm.DBUtils.DBBaseDao;
import com.cc.cw.dm.module.LabelRules;

public class LabelPool {
	private Connection conn;
	private List userList;
	
	static Logger log = Logger.getLogger("dmLogger");
	
	public LabelPool(List userList) {
		super();
		this.userList = userList;
	}
	public LabelPool(){
	}
	@SuppressWarnings("unchecked")
	private List<LabelRules> getLabelRules() throws SQLException{
		String sql = "select sourcetags,targettags,type from cw_labelrules";
		QueryRunner qr = new QueryRunner();
		ResultSetHandler rsh = new BeanListHandler(LabelRules.class);
		return (ArrayList)qr.query(conn, sql, rsh);
	}
	private List<String> getUserLablesByUUID(String uuid) throws SQLException{
		String sql = "select label from user_label_"+HashUtil.getHashCode(uuid)+" where uuid='"+uuid+"' order by weight limit 10";
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        List<String> userlabels = new ArrayList<String>();
        for (Iterator it = ((ArrayList)qr.query(conn, sql, rsh)).iterator(); it.hasNext();) {
			String str = (String) ((Object[])it.next())[0];
			userlabels.add(str);
		}
		return userlabels;
	}
	private List<String> generateLabels(List<LabelRules> rules, List<String> userlabels){
		List<String> generatelabels = new ArrayList<String>();
		for (Iterator it = rules.iterator(); it.hasNext();) {
			LabelRules rule = (LabelRules) it.next();
			String[] strs = rule.getSourcetags().split(";");
			boolean flag = true;
			for (int i = 0; i < strs.length; i++) {
				if(!userlabels.contains(strs[i])){
					flag = false;
					break;
				}
			}
			if(flag){
				String[] s = rule.getTargettags().split(";");
				for (int i = 0; i < s.length; i++) {
					//如果规则产生的label 不在用户模型的label池中，则将label放入用户规则池  （目前userlabels只取了用户的前10条做比较，看效果定是否要全取出做比较）
					if(!userlabels.contains(s[i])){
						generatelabels.add(s[i]);
					}
				}
			}
		}
		return generatelabels;
	}
	@SuppressWarnings("deprecation")
	private void insertORupdate(String uuid, List<String> generatelabels,String type) throws SQLException{
		QueryRunner qr = new QueryRunner();
		for (Iterator it = generatelabels.iterator(); it.hasNext();) {
			String str = (String) it.next();
			if(isInUserLabel(uuid, str)){
				if(isExists(uuid,str)){
					qr.update(conn, "update user_dmlabel_"+HashUtil.getHashCode(uuid)+" set updatetime='"+new Date().toLocaleString()+"' where uuid='"+uuid+"' and label='"+str+"'");
				}else{
					qr.update(conn, "insert into user_dmlabel_"+HashUtil.getHashCode(uuid)+" values('"+uuid+"','"+str+"','"+new Date().toLocaleString()+"','dm',null)");
				}
			}
		}
		ResultSetHandler rsh = new ArrayListHandler();
		ArrayList al = (ArrayList) qr.query(conn, "select updatetime from user_dmlabel_"+HashUtil.getHashCode(uuid)+" where uuid='"+uuid+"' order by updatetime desc limit 19,1", rsh);
		if(al.size()>0){
			qr.update(conn, "delete from user_dmlabel_"+HashUtil.getHashCode(uuid)+" where uuid='"+uuid+"' and updatetime<'"+((Object[])al.get(0))[0]+"'");
		}
	}
	/*
	 * 判断记录是否已经存在
	 * 存在将进行update操作
	 * 不存在将进行insert操作
	 */
	private boolean isExists(String uuid,String label) throws SQLException{
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        String sql = "select uuid from user_dmlabel_"+HashUtil.getHashCode(uuid)+" where uuid='"+uuid+"' and label='"+label+"'";
        ArrayList al = (ArrayList) qr.query(conn, sql, rsh);
        if(al.size()>0){
        	return true;
        }
        return false;
	}
	private boolean isInUserLabel(String uuid,String label) throws SQLException{
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        String sql = "select uuid from user_label_"+HashUtil.getHashCode(uuid)+" where uuid='"+uuid+"' and label='"+label+"'";
        ArrayList al = (ArrayList) qr.query(conn, sql, rsh);
        if(al.size()>0){
        	return true;
        }
        return false;
	}
	public void execute() {
		log.info("LabelPool begin ====>");
		try {
			conn = DBBaseDao.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("LabelPool ERROR ====> get connection exception \n" + e.getMessage());
		}
		List<LabelRules> rules;
		try {
			rules = getLabelRules();
			if(userList==null&&rules==null){
				return;
			}
			for (Iterator it = userList.iterator(); it.hasNext();) {
				String uuid = (String) ((Object[])it.next())[0];
				List<String> userlabels = getUserLablesByUUID(uuid);
				List<String> generatelabels = generateLabels(rules,userlabels);
				insertORupdate(uuid, generatelabels,"dm");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
			log.error("LabelPool ERROR ====> SQL exception \n" + e1.getMessage());
		}
		try {
			if(conn!=null){conn.close();conn=null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		log.info("LabelPool end ====>");
	}
	public void executeByManual(String tablename,List<LabelRules> rules) {
		try {
			conn = DBBaseDao.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("LabelPool ByManual ERROR ====> get connection exception \n" + e.getMessage());
		}
		try{
			List userlist = getUserList(tablename);
			if(userList==null&&rules==null){
				return;
			}
			for (Iterator it = userlist.iterator(); it.hasNext();) {
				String uuid = (String) ((Object[])it.next())[0];
				List<String> userlabels = getUserLablesByUUID(uuid);
				List<String> generatelabels = generateLabels(rules,userlabels);
				insertORupdate(uuid, generatelabels,"dm");
			}
		} catch(SQLException e){
			e.printStackTrace();
			log.error("LabelPool ByManual ERROR ====> SQL exception \n" + e.getMessage());
		}
		try {
			if(conn!=null){conn.close();conn=null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private List getUserList(String tablename) throws SQLException{
		String sql = "select distinct uuid from "+tablename;
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
		return (ArrayList)qr.query(conn, sql, rsh);
	}
}
