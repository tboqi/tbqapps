package com.xiaoshuo.stock.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author ÌÆ²®çù
 *
 */
public class MyUtils {

	public static String replaceAllSpace(String arg){
		arg = arg.replaceAll("\n", "");
		arg = arg.replaceAll(" ", "");
		arg = arg.replaceAll("\t", "");
		arg = arg.replaceAll("\r", "");
		return arg;
	}
	
	public static Date str2date(String date, String format){
		Date rtn = null;
		SimpleDateFormat formatter=new SimpleDateFormat(format);
		try{
			rtn = formatter.parse(date);
		} catch (Exception e) {
		}
		return rtn;
	}
}
