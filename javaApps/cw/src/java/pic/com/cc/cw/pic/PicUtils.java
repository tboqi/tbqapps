package com.cc.cw.pic;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cc.cw.web.CwConfiguration;

public class PicUtils {

	private static List<String> getKeywordList() {
		String txtFilePath = CwConfiguration.create().get("pic.label.txt.path");
		List<String> list = new ArrayList<String>();
		File txtfile = new File(txtFilePath);
		try {
			//BufferedReader fr = new BufferedReader(new FileReader(txtfile));
			Reader r = new InputStreamReader(new FileInputStream(txtfile), "UTF-8");
			BufferedReader fr = new BufferedReader(r);
			String lineTxt;
			while ((lineTxt = fr.readLine()) != null) {
				if (StringUtils.isBlank(lineTxt))
					continue;
				lineTxt = lineTxt.trim();
				//lineTxt = new String(lineTxt.getBytes(), "UTF-8");
				list.add(lineTxt);
			}
		} catch (FileNotFoundException e) {
			return null;
		} catch (IOException e) {
			return null;
		}
		return list;
	}
	
	public static String replace(String content){
		List<String> list = getKeywordList();
		String replacement;
		String keyword;
		int imgIndex;
		int keyIndex;
		String[] t2;
		String temp1;
		String temp2 = "";
		if(list == null || list.size() == 0) return content;
		for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
			keyword = (String) iter.next();
			replacement = getReplacement(keyword);
			if(!content.contains(keyword))continue;
			imgIndex = content.indexOf("<img");
			keyIndex = content.indexOf(keyword);
			if(keyIndex > -1 && keyIndex <imgIndex){
				content = content.replaceFirst(keyword, replacement);
				continue;
			}
			String[] temp = content.split("<img");
			temp2 = temp[0];
			for (int i = 1; i < temp.length; i++) {
				String str = temp[i];
				imgIndex = str.indexOf(">");
				keyIndex = str.indexOf(keyword);
				if(keyIndex == -1) {
					temp2 += "<img" + temp[i];
					continue;
				}
				if(keyIndex > -1 && keyIndex <imgIndex){
					t2 = str.split(">", 2);
					t2[1] = t2[1].replaceFirst(keyword, replacement);
					temp1 = t2[0] + ">" + t2[1];
					temp2 += "<img" + temp1;
					continue;
				} else {
					temp1 = str.replaceFirst(keyword, replacement);
				}
				temp2 += "<img" + temp1;
			}							
			content = temp2;
		}
		
		return content;
	}

	private static String getReplacement(String keyword) {
		if(StringUtils.isBlank(keyword)) return null;
		
		try {
			return keyword + "<font color=\"blue\">[</font><a href=\"/pic/huaceList/" + URLEncoder.encode(keyword, "UTF-8") + "/0\" target=\"_blank\"><font color=\"blue\">看图片</font></a><font color=\"blue\">]</font>";
		} catch (UnsupportedEncodingException e) {
			return keyword + "<font color=\"blue\">[</font><a href=\"/pic/huaceList/" + keyword + "/0\" target=\"_blank\"><font color=\"blue\">看图片</font></a><font color=\"blue\">]</font>";
		}
	}
}
