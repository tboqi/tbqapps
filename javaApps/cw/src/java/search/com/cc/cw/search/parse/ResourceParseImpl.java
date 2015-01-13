package com.cc.cw.search.parse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.util.FileUtil;
import com.cc.cw.web.CwConfiguration;


public abstract class ResourceParseImpl implements ResourceParser {

	protected static final String FILEPATH = CwConfiguration.create().get("index.indexedRecord.path");
	protected final Log log = LogFactory.getLog(getClass());
	
		
	public String getLastIndexedId(){
		String id = "";
		String path = getPath();
		log.info("path == "+path);
		if(FileUtil.isFileExist(path)==false)
		{
			try {
				FileUtil.createFile(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			FileUtil.saveStringToFile("0", path);
		}
		File file = new File(path);
		InputStream in = null;
		if(file != null){
			try {
				in = new FileInputStream(file);
				byte[] buff = new byte[in.available()];
				in.read(buff);
				id = new String(buff);
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(in != null)
					in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return id;
	}
	
	protected abstract String getPath();
	


	public void updateIndexRecord(String lastIndexedRecord) {
		String path = getPath();
		File file = new File(path);
		OutputStream out = null;
		try {
		    out = new FileOutputStream(file);
		    out.write(lastIndexedRecord.getBytes());
			log.info("update record file set lastIndexedRecord =========>> "+ lastIndexedRecord);
			log.info("update "+path+" completed..............");
			out.close();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
