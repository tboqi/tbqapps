package com.cc.cw.web.util;

public final class Constants {
	
	/**
	 * 一些常量
	 * @author Administrator
	 *
	 */
	public static final class URLPattern{
		public static final String HTML_PATH = "/data/rumour/html/";
		
		//首页
		public static final String INDEX_JSP  = "/jsp/index.jsp";
		public static final String INDEX_HTML  = "/index.html";
		public static final int MAIN_INTERVAL = 1000*60*1*1*1;
		
		//最新传闻列表
		public static final String NEWRUMOURS_JSP  = "/jsp/rumourslist.jsp";
		public static final String NEWRUMOURS_HTML  = "/pages/newrumours/";
		public static final int NEWRUMOURS_INTERVAL = 1000*60*1*1*1;
		
		//传闻
		public static final String RUMOUR_JSP  = "/jsp/rumour.jsp";
		public static final String RUMOUR_HTML  = "/pages/rumour/";
		public static final int RUMOUR_INTERVAL = 1000*60*1*1*1;
		
	}
	//广播
	public static final int BROADCAST_LAPIAO = 0;//拉票
	public static final int BROADCAST_MUJUAN = 1;//募捐
	public static final int BROADCAST_FVOTE = 2;//一次投票
	public static final int BROADCAST_SVOTE = 3;//二次投票
	public static final int BROADCAST_FLAGELSE = -1;//flag字段所用，-1表示为非拉票的所有广播行为
	public static final int BROADCAST_INDEXNUM = 20;//首页选取的广播条数
	
	public static final int INTROPRIVILEGE = 2;//推广人，每为系统增加一位用户，所给奖励票数
	public static final int REGISTUSERTIMERADDPRIVILEGE = 2; //注册用户 每隔相应的时间所奖励的票数
	public static final int UNREGISTUSERTIMERADDPRIVILEGE = 1; //注册用户 每隔相应的时间所奖励的票数
	
	public static final int FIRSTLOGINUSERPRIVILEGE = 2; //第一次登录用户赠送的票数
	public static final int FIRSTREGISTUSERPRIVILEGE = 2;//注册用户赠送的票数
	
	public static final long INTERVAL = 2 * 60 * 60 * 1000; //领票间隔时间
	public static final int AUTOINITIATEVOTEDATE = 10;
}
