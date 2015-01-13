package com.cc.cw.search.index;

import java.io.File;
import java.io.RandomAccessFile;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Set;
import java.util.TreeSet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.util.FileUtil;
import com.cc.cw.web.CwConfiguration;


/**
 * 索引帮助类
 * @author lsd037
 *
 */
public class IndexHelper {
	private static Log log = LogFactory.getLog(IndexHelper.class);
	private static String errorLogFile = CwConfiguration.create().get("index.errorFile"); 
	
	/**
	 * 根据索引库根目录，查找当前最新的索引库
	 * @param indexDir
	 * @return
	 */
	public static synchronized String getCurrentIndexDir(String indexDir) {
		String dir = "";
		String dotDone = "";
		dotDone = getCurrentDotDone(indexDir);
		if(dotDone.equals("")) {
			//log.info("没有任何索引库文件");
		}else {
			dir = dotDone.substring(0,dotDone.indexOf("."));
		}
		log.info("CurrentIndexDir --> "+dir);
		return dir;
	}
	
	/**
	 * 根据索引库根目录，查找当前最新的用来标示可查询索引库的.done文件
	 * @param indexDir
	 * @return
	 */
	public static synchronized String getCurrentDotDone(String indexDir) {
		String dotDone = "";
		long lastModifiedTime = 0;
		
		File indexDirectory = new File(indexDir);
		
		if(!indexDirectory.isDirectory()) {
			log.info("根目录不存在");
			return "";
		}
		File [] file = indexDirectory.listFiles();
		if(file.length <= 0) {
			log.info("没有任何索引库文件");
			return "";
		}else{
			lastModifiedTime = file[0].lastModified();
			for(int i = 0; i < file.length ; i++) {
				if(!file[i].isDirectory()) {
					if(lastModifiedTime <= file[i].lastModified()){
						lastModifiedTime = file[i].lastModified();
						dotDone = file[i].getAbsolutePath();
					}
				}
			}
		}
		return dotDone;
	}
	
	/**
	 * 返回当前时间，根据此返回值，来建立索引库
	 * @return
	 */
	public static synchronized String setUpIndexName() {
		String indexName = "";
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyyMMddhhmmssSS");
		indexName = df.format(date);
		return indexName;
	}

	
	public static void writeErrorLog(String xmlPath) {
		try{
		RandomAccessFile rf = new RandomAccessFile(errorLogFile, "rw");
		if (rf.length() == 0) {
			rf.write(("创建" + xmlPath + "出错，数据不全\r\n").getBytes());
			rf.close();
		} else {
				rf.seek(rf.length());
				rf.write(("创建" + xmlPath + "出错，数据不全\r\n").getBytes());
				rf.close();
			}
		}catch(Exception e){
			log.error("创建错误日志失败");
		}
	}
	
	/**
	 * 设置权重
	 * @param value
	 * @return
	 */
	public static synchronized float setBoost(int value){
		float boost = 1.0f;
		if(value >= 10 && value < 15)
			boost = 1.5f;
		if(value >= 20 && value < 25)
			boost = 2.0f;
		if(value >= 30 && value < 35)
			boost = 2.5f;
		if(value >= 40 && value < 45)
			boost = 3.0f;
		
		return boost;
	}
	
	public static synchronized float setBoostByDate(Date date){
		long createTime = date.getTime();
		long currTime = new Date().getTime();
		long oneDay = 24 * 60 * 60 * 1000;
		int value = new Long((currTime - createTime) / oneDay).intValue();
		float boost = 1.0f;
		if(value == 0 && value < 5)
			boost = 4.5f;
		if(value >= 5 && value < 10)
			boost = 4.0f;
		if(value >= 10 && value < 15)
			boost = 3.5f;
		if(value >= 15 && value < 20)
			boost = 3.0f;
		if(value >= 20 && value < 25)
			boost = 2.5f;
		if(value >= 25 && value < 30)
			boost = 2.0f;
		
		return boost;
	}
	
	public static void deleteOldIndex(String path){
    	File file = new File(path);
   	  	File[] files = file.listFiles();
   		Set<Long> timeSet = new TreeSet<Long>();
	   	for(File f : files){
	   		if(f.isDirectory()) continue;
	   		long indexTime = Long.parseLong(f.getName().substring(0,f.getName().indexOf(".")));
	   		timeSet.add(indexTime);
		}
	   	log.info(timeSet);
	   	Object[] objects = timeSet.toArray();
   		for(int i = 0; i < objects.length -2 ;i++){
   			long time = (Long)objects[i];
   			log.info(time);
   			if(FileUtil.removeDir(new File(path+time)))
   				FileUtil.removeFile(path+time+".done");
	   	}
    }
	
	public static void main(String [] args) {
		GregorianCalendar sunday = new GregorianCalendar(2007,6,17);
		
		setBoostByDate(sunday.getTime());
	}
}
