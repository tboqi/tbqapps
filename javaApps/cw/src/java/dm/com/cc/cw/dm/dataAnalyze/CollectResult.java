package com.cc.cw.dm.dataAnalyze;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.cc.cw.dm.DBUtils.DBBaseDao;
import com.cc.cw.dm.module.ClickLog;
import com.cc.cw.dm.module.LabelRules;

public class CollectResult {
	
	private Connection conn;
	private String timelog;
	private String logtablename;
	static Logger log = Logger.getLogger("dmLogger");
	
	public CollectResult(){
	}
	/**
	 * 根据UUID的到具体用户某时间段内曾点过的所有新闻
	 * between：从表dmtimelog中查询开始时间
	 * and：当前时间
	 * from表：clicklog_+年+月
	 * @param time 截止时间
	 * @param uuid 
	 * @return List（ClickLog）
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<ClickLog> getLogsByUUID(String time,String uuid) throws SQLException{
		List<ClickLog> list = new ArrayList<ClickLog>();
		String sql = "select a.uuid,a.articleid,b.ChannelId,a.clicktime from "+logtablename+" a inner join article b on a.articleid=b.Id where a.clicktime between '"+getTimeLog()+"' and '" + time + "' and a.uuid='"+uuid+"'";
		QueryRunner qr = new QueryRunner();
		ResultSetHandler rsh = new BeanListHandler(ClickLog.class);
		list = (ArrayList<ClickLog>) qr.query(conn, sql, rsh);
		return list;
	}
	/**
	 * 得到该时间段内所有活动用户列表
	 * between：从表dmtimelog中查询开始时间
	 * and：当前时间
	 * from表：clicklog_+年+月
	 * @param time
	 * @return 只包含uuid的list
	 * @throws SQLException
	 */
	private List getUUIDList(String time) throws SQLException{
		String sql = "select distinct uuid from " + logtablename + " where clicktime between '"+getTimeLog()+"' and '" + time + "'";
//		log.info("getUUIDList sql ====>"+sql);
		QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
		return (ArrayList)qr.query(conn, sql, rsh);
	}
	/*
	 * 从数据库中得到上次分析时间 并附值给timelog
	 */
	private String getTimeLogFormDB() throws SQLException{
		String sql = "select dmtime from dmtimelog";
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        List timeList = (ArrayList)qr.query(conn, sql, rsh);
        if(timeList.iterator().hasNext()){
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	return sdf.format((Timestamp) ((Object[])timeList.iterator().next())[0]);
        }else{
        	throw new SQLException("logtime not found");
        }
	}
	/*
	 * 得到上次的分析时间
	 */
	private String getTimeLog() throws SQLException{
		if(timelog==null){
			timelog = this.getTimeLogFormDB();
		}
		return timelog;
	}
	private void updateTime(String time) throws SQLException{
		String sql = "update dmtimelog set dmtime='"+time+"'";
        QueryRunner qr = new QueryRunner();
        qr.update(conn,sql);
	}
	/**
	 * 数据统计主逻辑方法
	 *
	 */
	public void execute() {
		log.info("collectResult begin ====>");
		timelog = null;
		//组织表名为:clicklog_+年+月，例：clicklog_200707
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMM");
		logtablename = "clicklog_"+df.format(d);
		try {
			conn = DBBaseDao.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("collectResult ERROR ====> get connection exception \n" + e.getMessage());
		}
		try {
//			conn.setAutoCommit(false);
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df1.format(d);
		List userlist = getUUIDList(now);
//		log.info("userlist size ====>"+userlist.size());
		
		Map<String,Double> tagsmap = new HashMap<String,Double>();//保存标签及权重信息：key：标签 value：权重
		Map<Integer,Integer> channelmap = new HashMap<Integer, Integer>();//保存频道id及权重信息：key：标签 value：权重
		//a:循环所有的uuid
		for (Iterator it = userlist.iterator(); it.hasNext();) {
			String uuid = (String) ((Object[])it.next())[0];
			if(uuid.length()==32){
				//b:根据uuid获得访问过哪些文章
				List<ClickLog> tagsList = getLogsByUUID(now,uuid);
				tagsmap.clear();
				channelmap.clear();
				//c:循环用户访问过的文章，并得到相应的标签
				for (Iterator iter = tagsList.iterator(); iter.hasNext();) {
					ClickLog log = (ClickLog) iter.next();
					log.setTags(getTagsByArticleId(log.getArticleid()));
					if(log.getTags()!=null && !log.getTags().equals("")){
						//获得总热门度
						int alltag = getArticleCount(log.getArticleid());
						//拆分字符串，获得单个标签的热门度
						String[] strs = log.getTags().split(" ");
						for (int i = 0; i < strs.length; i++) {
							int curtag = getCountByLabelName(log.getArticleid(),strs[i]);
							double weight = 0;
							if(alltag>0){
								weight = curtag/(double)alltag;//计算权重
							}
							if(tagsmap.containsKey(strs[i])){//如果已经包含此标签，则增加权重
								Double ii = tagsmap.get(strs[i]);
								tagsmap.put(strs[i], ii + weight);
							}else{
								tagsmap.put(strs[i], weight);
							}
						}
					}
					if(log.getChannelId()!=null&&log.getChannelId()!=0){
						if(channelmap.containsKey(log.getChannelId())){
							Integer jj = channelmap.get(log.getChannelId());
							channelmap.put(log.getChannelId(),jj+1);
						}else{
							channelmap.put(log.getChannelId(),1);
						}
					}
					
				}
				channelInsert(channelmap,uuid,now);
				tagsInsert(tagsmap,uuid,now);
				
			}
		}
		updateTime(now);//更新统计时间
		LabelPool l = new LabelPool(userlist);
		l.execute();
		log.info("collectResult end ====>");
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("collectResult ERROR ====> SQLException\n" + e.getMessage());
//			try{conn.rollback();}catch(Exception ee){}
		}
		try {
			if(conn!=null){conn.close();conn=null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 得到某条新闻的全部tag总数
	 * @param articleId
	 * @return int - 所有标签的热门度和
	 * @throws SQLException
	 */
	private Integer getArticleCount(Integer articleId) throws SQLException{
		String sql = "select sum(Count) from atomLabel where ArticleId="+articleId;
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
		List list = (ArrayList)qr.query(conn, sql, rsh);
		if(list.size()>0){
			if((((Object[])list.get(0))[0])!=null){
				return ((BigDecimal) ((Object[])list.get(0))[0]).intValue();
			}
		}
		return 0;
	}
	/**
	 * 根据tag的名称 得到这个tag在该新闻中出现的次数
	 * @param articleId
	 * @param label
	 * @return int - 热门度
	 * @throws SQLException
	 */
	private Integer getCountByLabelName(Integer articleId,String label) throws SQLException{
		String sql = "select Count from atomLabel where ArticleId="+articleId+" and Content='"+label+"'";
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
		List list = (ArrayList)qr.query(conn, sql, rsh);
		if(list.size()>0){
			if((Object[])list.get(0)!=null){
				return (Integer) ((Object[])list.get(0))[0];
			}
		}
		return 0;
	}
	/**
	 * 将map中的对象插入到用户喜好的tags表中,tag是按照权重排序的
	 * 每条新闻不同tag的权重计算方式为:  每个tag在该新闻中的出现次数/该新闻全部的tag总数
	 * 根据tag权重累加的顺序入库.并只保留权重最大的20个tag
	 */
	@SuppressWarnings("unchecked")
	private void tagsInsert(Map<String,Double> tagsmap,String uuid,String now) throws SQLException{
		Comparator<Double> comp = new Comparator<Double>(){
			public int compare(Double o1, Double o2){
				if(o1==o2){
					return 0;
				}else if(o1>o2){
					return -1;
				}else{
					return 1;
				}
			}
		};
		TreeMap<Double, String> sortmap = new TreeMap<Double, String>(comp);
//		Map<String,Integer> insertMap = new HashMap<String, Integer>();
		Set set = tagsmap.entrySet();
		for (Iterator it = set.iterator(); it.hasNext();) {
			Map.Entry<String,Double> e = (Map.Entry<String,Double>) it.next();
			if(sortmap.containsKey(e.getValue())){//将tagsmap的alue做key，key做value
				String str = sortmap.get(e.getValue());
				sortmap.put(e.getValue(), str+";"+e.getKey());
			}else{
				sortmap.put(e.getValue(), e.getKey());
			}
		}
		Set sortset = sortmap.entrySet();
		QueryRunner qr = new QueryRunner();
		for (Iterator it = sortset.iterator(); it.hasNext();) {
			Map.Entry<Double, String> entry = (Map.Entry<Double, String>) it.next();
			String[] str = entry.getValue().split(";");
			for (int i = 0; i < str.length; i++) {
				if(isExists(uuid,str[i],"label")){
					qr.update(conn, "update "+getHashTableName("label", uuid)+" set weight=weight+"+(Double)entry.getKey()+",updatetime='"+now+"' where uuid='"+uuid+"' and label='"+str[i]+"'");
				}else{
					qr.update(conn,"insert into "+getHashTableName("label", uuid)+" values('"+uuid+"','"+str[i]+"',0,'"+now+"',"+entry.getKey()+",'dm')");
				}
			}
		}
		//取出第20条数据；删除20以后的记录
		ResultSetHandler rsh = new ArrayListHandler();
		ArrayList al = (ArrayList) qr.query(conn, "select weight from "+getHashTableName("label", uuid)+" where uuid='"+uuid+"' order by weight desc limit 19,1", rsh);
		if(al.size()>0){
			qr.update(conn, "delete from "+getHashTableName("label", uuid)+" where uuid='"+uuid+"' and weight<'"+((Object[])al.get(0))[0]+"'");
		}
	}
	/**
	 * 将map中的对象插入到用户的喜好的channel表中并增加clicktime字段（clicktime + map的value）
	 * @param channelmap
	 * @param uuid
	 * @param now
	 * @throws SQLException
	 */
	private void channelInsert(Map<Integer,Integer> channelmap,String uuid,String now) throws SQLException{
		QueryRunner qr = new QueryRunner();
		Set set = channelmap.entrySet();
		for (Iterator it = set.iterator(); it.hasNext();) {
			Map.Entry entry = (Map.Entry) it.next();
			if(isExists(uuid,(Integer)entry.getKey(),"channel")){
				qr.update(conn, "update "+getHashTableName("channel", uuid)+" set clicktime=clicktime+"+(Integer)entry.getValue()+",updatetime='"+now+"' where uuid='"+uuid+"' and channelId="+entry.getKey());
			}else{
				qr.update(conn,"insert "+getHashTableName("channel", uuid)+" values('"+uuid+"','"+entry.getKey()+"',"+entry.getValue()+",'"+now+"')");
			}
		}
		ResultSetHandler rsh = new ArrayListHandler();
		ArrayList al = (ArrayList) qr.query(conn, "select clicktime from "+getHashTableName("channel", uuid)+" where uuid='"+uuid+"' order by clicktime desc limit 19,1", rsh);
		if(al.size()>0){
			qr.update(conn, "delete from "+getHashTableName("label", uuid)+" where uuid='"+uuid+"' and clicktime<'"+((Object[])al.get(0))[0]+"'");
		}
	}
	/**
	 * 判断记录是否已经存在, 存在将进行update操作, 不存在将进行insert操作
	 * @param uuid
	 * @param channelId
	 * @param type
	 * @return boolean
	 * @throws SQLException
	 */
	private boolean isExists(String uuid,Object channelId,String type) throws SQLException{
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        String str = null;
        if(type.equals("channel")){
        	str = "channelId";
        }else if(type.equals("label")){
        	str = "label";
        }
        String sql = "select uuid from "+getHashTableName(type, uuid)+" where uuid='"+uuid+"' and "+str+"='"+channelId+"'";
        ArrayList al = (ArrayList) qr.query(conn, sql, rsh);
        if(al.size()>0){
        	return true;
        }
        return false;
	}
	
	/**
	 * 根据文章id查询标签，结果按标签热门程度排序
	 * @param id
	 * @return String 以空格分隔的所有标签
	 * @throws SQLException
	 */
	private String getTagsByArticleId(int id) throws SQLException{
		StringBuffer tags=new StringBuffer();
		String sql = "select Content from atomLabel where ArticleId="+id+" order by Count desc limit 0,10";
        QueryRunner qr = new QueryRunner();
        ResultSetHandler rsh = new ArrayListHandler();
        ArrayList al = (ArrayList) qr.query(conn, sql, rsh);
        for (Iterator it = al.iterator(); it.hasNext();) {
			Object[] e = (Object[]) it.next();
			if(((String)e[0]).trim()!=null&&!((String)e[0]).trim().equals("")){
				tags.append(e[0]+" ");
			}
		}
		return tags.length()>0?tags.substring(0, (tags.length()-1)):"";
	}
	/*
	 * 根据用户的UUID得到对应该用户,不同类别表的名字
	 */
	private String getHashTableName(String type,String uuid){
		if(type.endsWith("channel")){
			return "user_channel_"+HashUtil.getHashCode(uuid);
		}else if(type.endsWith("label")){
			return "user_label_"+HashUtil.getHashCode(uuid);
		}
		return null;
	}
	public void updateLabelPool(){
		
	}
	synchronized public void executeByManual(List<LabelRules> rules) {
		Calendar c =Calendar.getInstance();
		String tablename = "clicklog_"+c.get(Calendar.YEAR)+c.get(Calendar.MONTH);
		LabelPool pool = new LabelPool();
		pool.executeByManual(tablename, rules);
	}
	public static void main(String[] args) throws SQLException {

	}

}
