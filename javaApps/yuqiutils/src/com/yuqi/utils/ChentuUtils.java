package com.yuqi.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ChentuUtils {
	private static Log log = LogFactory.getLog(ChentuUtils.class);
	
	public static URLConnection getURLConnection(String webUrl) {
		URL url;
		URLConnection connection = null;
		try {
			url = new URL(webUrl);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("User-agent", "Mozilla/4.0");
		} catch (MalformedURLException e) {
			log.error("create URL error: " + webUrl);
		} catch (IOException e) {
			log.error("URLConnection error: " + webUrl);
		}

		return connection;
	}

	public static String connection2String(URLConnection connection) {
		InputStream is;
		try {
			is = connection.getInputStream();
			BufferedReader in = new BufferedReader(new InputStreamReader(is,
					"GBK"));
			return in.readLine();
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public static String getUrlContent(String url) {
		URLConnection connection = getURLConnection(url);
		return connection2String(connection);
	}
	
	public static String formatDate(Date date) {
		java.text.DateFormat df = new java.text.SimpleDateFormat(
		"yyyy-MM-dd HH:mm:ss");
		return  df.format(date);
	}

	public static String formatDate(Date date, String format) {
		java.text.DateFormat df = new java.text.SimpleDateFormat(format);
		return  df.format(date);
	}
	
	public static void mkdir(String path) {
		try {
			if (!(new File(path).isDirectory())) {
				new File(path).mkdir();
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		}
	}
}
