package com.cc.cw.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.math.NumberUtils;

public class DateTimeUtil {

	private static final long ADAY = 24*60*60*1000;
	/**
	 * 根据传人日期得到星期
	 * @param date
	 * @return	0-6
	 */
	public static int getDayFromDate(Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		int week = calendar.get(Calendar.DAY_OF_WEEK);
		return --week;
	}
	
	/**
	 * 根据传入日期得到小时
	 * @param date
	 * @return 0-23
	 */
	public static int getHourFromDay(Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		return hour;
	}
	
	/**
	 * 得到传入日期的周日的日期
	 * @param date
	 * @return	星期日的日期
	 */
	public static String getBeginDate(Date date){
		int currentDate = getDayFromDate(date);
		long monday = date.getTime()-currentDate*ADAY;
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String beginDate = formatter.format(new Date(monday));
	    
		return beginDate;
	}
	
	/**
	 * 得到传入日期的周六的日期
	 * @param date
	 * @return	星期六的日期
	 */
	public static String getLastDate(Date date){
		int currentDate = getDayFromDate(date);
		//通过总天数计算到周末的天数差
		currentDate = 6-currentDate;
		long saturday = date.getTime()+currentDate*ADAY;

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String endDate = formatter.format(new Date(saturday));
	    
		return endDate;
	}
	
	/**
	 * 将给定字符串转换为日期
	 * @param str
	 * @return
	 */
	public static Date parseStringToDate(String str){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * 将给定字符串和格式转换为日期
	 * @param str
	 * @param pattern
	 * @return
	 */
	public static Date parseStringToDate(String str,String pattern){
		DateFormat dateFormat = new SimpleDateFormat(pattern);
		Date date = null;
		try {
			date = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	
	public static String parseDateToString(Date date){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = dateFormat.format(date);
		
		return dateStr;
	}
	
	public static String parseDateToString(Date date,String pattern){
		DateFormat dateFormat = new SimpleDateFormat(pattern);
		String dateStr = dateFormat.format(date);
		
		return dateStr;
	}

	  public static java.util.Date incDate(java.util.Date d,int format,int step)
	  {
	    GregorianCalendar g1 = new GregorianCalendar();
	    g1.setTime(d);
	    if(format==Calendar.YEAR)
	    	g1.add(Calendar.YEAR,step);
	    if(format==Calendar.MONTH)
	    	g1.add(Calendar.MONTH,step);
	    if(format==Calendar.DAY_OF_MONTH)
	    	g1.add(Calendar.DAY_OF_MONTH,step);
	    return g1.getTime();
	  }
	  
	public static void main(String[] args) throws Exception {

	}

	public static String getDateFormat(java.util.Date d){
	    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    return formatter.format(d);
	  }
	/**
	 * 由日期（格式为2007/09/10）获得一个Map，key分别为year,month,day
	 * @param date
	 * @return
	 */
	public static Map<String, Object> getFromDate(String date){
		Map<String, Object> map = new HashMap<String, Object>();
		String[] args = date.split("/");
		map.put("year", new Integer(NumberUtils.toInt(args[0])));
		map.put("month", new Integer(NumberUtils.toInt(args[1])));
		map.put("day", new Integer(NumberUtils.toInt(args[2])));
		return map;
	}
}
