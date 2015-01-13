package com.cc.cw.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class URLCoderUtil {
	private static String str = "";
	
	public URLCoderUtil(){}
	
	/**
	 * 将字符串进行编码
	 * @param s	被编码的字符串
	 * @param charsetType  字符集
	 * @return
	 */
	public static String encode(String s, String charsetType){
		try {
			str = URLEncoder.encode(s,charsetType);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	/**
	 * 将字符串进行解码
	 * @param s	被解码的字符串
	 * @param charsetType  字符集
	 * @return
	 */
	public static String decode(String s, String charsetType){
		try {
			str = URLDecoder.decode(s,charsetType);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	public static void main(String[] args){

	}
}
