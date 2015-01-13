package com.cc.cw.web.data;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.util.FileUtil;
import com.cc.cw.web.CwConfiguration;

public class HomeCastData {

	protected static transient Log log = LogFactory.getLog(AdvertiseData.class);
	private static String baseDir = CwConfiguration.create().get("broadcast.path");
	
	public static String getBroadCast(){
		return FileUtil.getStringFromFile(baseDir);
	}

	public static void setBroadCast(String content){
		FileUtil.writeContent(baseDir, content);
	}
	
	public static void main(String args[]){
		HomeCastData.setBroadCast("我很好啊哈哈哈");
		log.info(HomeCastData.getBroadCast());
	}
}
