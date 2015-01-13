package com.cc.cw.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class HtmlConvert {

	/**
	 * 获取没有html标记的字符串,并将一些转义字符替换成其本身
	 * @param str
	 */
	public static String html2Text(String str){
		Map<String,String> ESCMap = new HashMap<String,String>();
		  ESCMap.put("&ldquo;", "“");
		  ESCMap.put("&rdquo;", "”");
		  ESCMap.put("&nbsp;", " ");
		  ESCMap.put("&quot;", "\"");
		  String text = cleanHtmlTag(str);
		  Set<String> keySet = ESCMap.keySet();
		  for(String key : keySet){
			  if(text.contains(key)){
				  text = text.replaceAll(key, ESCMap.get(key));
			  }
		  }
		  return text;
	}
	
	/**
	 * 将字符串中的html标签去掉
	 * @param str
	 * @return
	 */
	public static String cleanHtmlTag(String str){
		if( str==null || str.trim().equals("")){
			return str;
		}
		if(!str.contains("<")){
			return str;
		}
		
		str = str.replaceAll("<script.*</script>", "");
		str = str.replaceAll("<SCRIPT.*</SCRIPT>", "");
		str = str.replaceAll("<style.*</style>", "");
		str = str.replaceAll("<STYLE.*</STYLE>", "");
		str = str.replaceAll("</?[^>]+>", ""); // 剔出了<html>的标签
		str = str.replace("&nbsp;", "");
		str=str.replace(".","");
		str=str.replace("\"","‘");
		str=str.replace("'","‘");
		
		return str;
	}
	
	public static void main(String [] args){

	}
	
}
