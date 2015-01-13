package com.yuqi.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;

public class StringUtil {

	@SuppressWarnings("unchecked")
	public static String file2string(String fileAddr) {
		FileInputStream is = null;
		try {
			is = new FileInputStream(fileAddr);
		} catch (FileNotFoundException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		//byte[] b = new byte[100];
		ArrayList list = new ArrayList();
		byte b = 0;
		do {
			try {
				b = (byte) is.read();
			} catch (IOException e) {
				// TODO 自动生成 catch 块
				e.printStackTrace();
			}
			list.add(b);
		}while(b != -1);
		byte[] bs = new byte[list.size()];
		for(int i=0; i<list.size()-1; i++) {
			bs[i] = (Byte) list.get(i);
		}
 		try {
			return new String(bs, "utf8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
			return null;
		}
	}

	public static String getCNData(){
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int day = c.get(Calendar.DATE);
		
		return year + "年" + month + "月" + day + "日";
	}
}
