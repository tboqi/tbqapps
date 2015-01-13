package com.cc.cw.search.index;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Set;
import java.util.TreeSet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.cjk.CJKAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;

import com.cc.cw.service.MemberService;
import com.cc.cw.util.FileUtil;
import com.cc.cw.web.CwConfiguration;

public abstract class IndexManagerImpl implements IndexManager {
	protected final Log log = LogFactory.getLog(getClass());
	protected static final String INDEXROOT = CwConfiguration.create().get("index.dir");
	String indexDir = "";
	MemberService memberService = null;
	

	public IndexManagerImpl(){
		indexDir = getIndexDir();
//		log.info("init index dir to: "+indexDir);
	}
	
	public abstract String getIndexDir();
	
	public synchronized void createIndexDB() {
		IndexWriter writer = null;
		String dir = "";
		boolean isCreate = false;
		try {
			dir = copyToNewIndex(IndexHelper.getCurrentIndexDir(indexDir));
			if(dir == null) {
				dir = indexDir + IndexHelper.setUpIndexName();
				isCreate = true;
			}
		} catch (IOException e1) {
			log.error("拷贝文件失败");
			e1.printStackTrace();
		}
		writer = createIndexWriter(dir,isCreate);//索引库为刚刚拷贝好的目录
		try {
			addDocumentToWriter(writer);
			writer.optimize();
			makeIndexAvailable(dir);
		} catch (IOException e) {
			log.error("添加索引失败");
			e.printStackTrace();
		}finally{
			try {
				writer.close();
			} catch (IOException e) {
				log.error("关闭writer出错");
				e.printStackTrace();
			}
		}
		
	}
	/**
	 * 拷贝旧的索引库
	 * @param oldDir
	 * @return
	 * @throws IOException
	 */
	private synchronized String copyToNewIndex(String oldDir) throws IOException {
		File oldIndexDir = new File(oldDir);
		if(!oldIndexDir.exists()) {
			log.info("no old indexDB...");
			return null;
		}
		File [] indexFiles = oldIndexDir.listFiles();
		if(indexFiles == null || indexFiles.length <= 1){
			log.error("没有文件");
			return "";
		}
		String newIndex = indexDir  + IndexHelper.setUpIndexName();
		File newIndexDir = new File(newIndex);//创建新的索引库
		newIndexDir.mkdirs();
		for(int i=0;i<indexFiles.length;i++){
			FileInputStream input=new FileInputStream(indexFiles[i]);
			FileOutputStream output=new FileOutputStream(newIndexDir+ "/" + indexFiles[i].getName());
			byte[] b=new byte[1024];
			int len = 0;
			while((len=input.read(b))!=-1){
			    output.write(b,0,len);
			}
			output.flush();
			output.close();
			input.close();
		}
		
		return newIndexDir.getAbsolutePath();
	}
	/**
	 * 根据传入目录参数打开索引库，isCreate参数设置覆盖或创建。
	 * @param dir
	 * @param isCreate
	 * @return
	 */
	private synchronized IndexWriter createIndexWriter(String dir,boolean isCreate) {
		IndexWriter writer = null;
		try {
			writer = new IndexWriter(dir,new CJKAnalyzer(), isCreate);
		} catch (IOException e) {
			log.error("创建索引库失败");
			e.printStackTrace();
		}
		return writer;
	}
	/**
	 * 将封装好的Document添加到流
	 * @param writer
	 */
	protected abstract void addDocumentToWriter(final IndexWriter writer);
	/**
	 * 添加索引到索引库
	 * @param writer
	 */
	public synchronized void addDocument(final IndexWriter writer, Document doc){
		try {
			writer.addDocument(doc);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 把指定的索引库标示为可以被索引。此方法仅仅创建一个和指定索引库同名的.done文件。
	 * 查询时将根据最新的.done文件进行查询。
	 * @param indexName
	 * @throws IOException
	 */
	private synchronized void makeIndexAvailable(String indexName) throws IOException {
		File file = new File(indexName+".done");
		file.createNewFile();
	}

	/**
	 * 把指定的索引库标示为不可被索引。删除.done文件
	 * @param indexName
	 * @throws IOException
	 */
	public synchronized void makeIndexInvalidate(String indexName) throws IOException{
		File file = new File(indexName+".done");
		file.delete();
	}
	
	public boolean deleteOldIndex() {
    	File file = new File(indexDir);
    	if(!file.exists())
    		return true;
   	  	File[] files = file.listFiles();
   	  	if(files.length > 2){
	   		Set<Long> timeSet = new TreeSet<Long>();
		   	for(File f : files){
		   		if(f.isDirectory()) continue;
		   		long indexTime = Long.parseLong(f.getName().substring(0,f.getName().indexOf(".")));
		   		timeSet.add(indexTime);
			}
		   	
		   	Object[] objects = timeSet.toArray();
	   		for(int i = 0; i < objects.length -2 ;i++){
	   			long time = (Long)objects[i];
	   			if(FileUtil.removeDir(new File(indexDir+time)))
	   				FileUtil.removeFile(indexDir+time+".done");
		   	}
   	  	}else{
   	  		log.info("no index to delete...................");
   	  	}
   		return true;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
}
