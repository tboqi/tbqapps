package com.cc.cw.dm.dataAnalyze;

import java.util.UUID;

public class HashUtil {
	public static int getHashCode(String value) {
		return Math.abs(value.hashCode() % 10);
	}
	public static String getUUID(){
		UUID uuidObj = UUID.randomUUID();
		String uuid = uuidObj.toString().replace("-","");
		return uuid;
	}
	public static void main(String[] args) {

	}
}
