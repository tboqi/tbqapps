
package com.cc.cw.util;
//import gnu.crypto.hash.HashFactory;
//import gnu.crypto.hash.IMessageDigest;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author hjs
 * @version 1.0
 */

public class FileUtil
{
    /** logger for Commons logging. */
    private static Log log = LogFactory.getLog(FileUtil.class);

  public static boolean createFile(String fileName) throws IOException
  {
  	boolean rtn = false;
    File file = new File(fileName);
    if (!file.exists())
    {
    	File f = new File(file.getParent());
    	f.mkdirs();
    	rtn = file.createNewFile();
    }
    return rtn;
  }
    
  public static boolean saveStringToFile(String content, String fileName)
  {
    boolean rtn = false;
    BufferedOutputStream out=null;
    try
    {
      if (!createPathByFileName(fileName))
      {
        return false;
      }
      File file = new File(fileName);
      if (!file.exists())
      {
        file.createNewFile();

      }
      out = new BufferedOutputStream(
          new FileOutputStream(file));
      out.write(content.getBytes("UTF-8"));
      out.close();
      rtn = true;
      
    }
    catch (Exception e)
    {
      log.info("saveStringToFile error:" + e.getMessage());
    }
    finally{
    	try{
    		out.close();
    	}
    	catch (Exception e){}
    }
    return rtn;
  }

  /**
   * ���ļ��а����ݶs�4
   * @param fileName
   * @return
   */
  public static String getStringFromFile(String fileName)
  {
	    String rtn = "";
	    String line = "";
	    BufferedReader bufferIn =null;
	    try
	    {
	      File file = new File(fileName);
	      if (file.exists())
	      {
	        bufferIn = new BufferedReader(
	            new InputStreamReader(
	            new FileInputStream(file)));
	        while ( (line = bufferIn.readLine()) != null)
	        {
	        	try {
	    		Thread.sleep(5);
	    		} catch (InterruptedException e1) {
	    			// TODO Auto-generated catch block
	    			e1.printStackTrace();
	    		}
	    		rtn = rtn + "\r\n" + line;
	        }
	        
	      }
	    }
	    catch (Exception e)
	    {
	      log.info("getStringFromFile error:" + e.getMessage());
	    }
	    finally{
	    	try{
	    		bufferIn.close();
	    	}
	    	catch(Exception e){}
	    }
	    return rtn;
  }

  public static String getLineFromFile(long pos, String fileName)
  {
    String rtn = "";
    String line = "";
    BufferedReader bufferIn =null;
    try
    {
      File file = new File(fileName);
      if (file.exists())
      {
        bufferIn = new BufferedReader(
            new InputStreamReader(
            new FileInputStream(file), "GB2312"));
        bufferIn.skip(pos);
        if ( (line = bufferIn.readLine()) != null)
        {
          rtn = line;
        }
        
      }
    }
    catch (Exception e)
    {
      log.info("getStringFromFile error:" + e.getMessage());
    }
    finally{
    	try{
    		bufferIn.close();
    	}
    	catch(Exception e){}
    }
    return rtn;
  }

  /**
   * ����ļ���Ŀ¼�����Ŀ¼���ڻ��ߴ����ɹ�����true,else return false
   * @param fileName
   * @return
   */
  public static boolean createPathByFileName(String fileName)
  {
    boolean rtn = false;
    File file = new File(fileName);
    File dir = file.getParentFile();

    if (dir != null)
    {
      if (!dir.exists())
      {
        rtn = dir.mkdirs();
      }
      else
      {
        rtn = true;
      }
    }
    return rtn;
  }

  /**
   * �����ļ���ȫ��,��test.gif  etc.
   * @param fileName
   * @return
   */
  public static String getAbsoluteFullName(String fileName)
  {
    String rtn = "";
    int i = 0;
    for (i = fileName.length() - 1; i >= 0; i--)
    {
      if (fileName.charAt(i) == '\\')
      {
        rtn = fileName.substring(i);
        break;
      }
    }
    return rtn;
  }

  /**
   * �����ļ���ȫ��,��test.gif--��test  etc.
   * @param fileName
   * @return
   */
  public static String getAbsoluteName(String fileName)
  {
    String temp = "", rtn = "";
    int i = 0;
    for (i = fileName.length() - 1; i >= 0; i--)
    {
      if (fileName.charAt(i) == '\\')
      {
        temp = fileName.substring(i);
        break;
      }
    }
    for (i = 0; i < temp.length(); i++)
    {
      if (temp.charAt(i) == '.')
      {
        break;
      }
      rtn = temp.substring(1,i);
    }
    return rtn;
  }

  /**
   * �ж��ļ��Ƿ����
   * @param fileName
   * @return
   */
  public static boolean isFileExist(String fileName)
  {
    File file = new File(fileName);
    
    if (file.exists() && !file.isDirectory())
    {
      return true;
    }
    else
    {
      return false;
    }
  }


  /**
   * ɾ��ָ�����ļ�
   * @param fileName Ҫɾ����ļ����
   * @return �ɹ�����ture, ���򷵻�false
   */
  public static boolean removeFile(String fileName){
    boolean rtn = false;

    try{
        File file = new File(fileName);
        
    	if (file.exists() && !file.isDirectory())
    	{
    		rtn = file.delete();
    	}
    }catch(Exception e){
    	
    }
    
  	return rtn;
  }  
  
  /**
   * execute command line
   * @param cmd
   * @return
   */
  public static String execCmd(String cmd)
  {
    String rtn = "";
    String line = "";
    BufferedReader bf=null;
    try
    {
      Process process = Runtime.getRuntime().exec(cmd);
      bf = new BufferedReader(new InputStreamReader(process.
          getInputStream()));
      while ( (line = bf.readLine()) != null)
      {
        if (!line.trim().equals(""))
        {
          if (rtn.equals(""))
          {
            rtn = line;
          }
          else
          {
            rtn = rtn + "\n" + line;
          }
        }
      }
      process.waitFor();
    }
    catch (Exception e)
    {
      log.info("Error: " + e.getMessage());
    }
    finally{
    	try{
    		bf.close();
    	}
    	catch(Exception e){}
    }
    return rtn;
  }

  public static long getSize(String filename)
  {
  	long rtn = 0;
  	File aFile = new File(filename);
  	rtn = aFile.length();
  	return rtn;
  }

  /**
   * Determine whether a file or directory is actually a symbolic link.
   * 
   * @param file
   *            the file or directory to check
   * @return true if so
   */
  public static boolean isLink(final File file) {
      try {
          String os = System.getProperty("os.name");
          if (os.indexOf("Windows") >= 0) {
              return false;
          }
          if (file == null || !file.exists()) {
              return false;
          } else {
              String cnnpath = file.getCanonicalPath();
              String abspath = file.getAbsolutePath();
              log.debug("comparing " + cnnpath + " and " + abspath);
              return !abspath.equals(cnnpath);
          }
      } catch (IOException e) {
          log.warn("could not determine whether " + file.getAbsolutePath() + " is a symbolic link", e);
          return false;
      }
  }

  /**
   * Recursively remove a directory.
   * 
   * @param sourceDir
   *            the Directory to be removed
   * 
   * @return true on success, false otherwise.
   *         <p>
   */
  public static boolean removeDir(final File sourceDir) {
      // try {
      // org.apache.commons.io.FileUtils.deleteDirectory(sourceDir);
      // } catch (IOException e) {
      // log.warn("could not delete " + sourceDir, e);
      // return false;
      // }
      // log.debug("Succesfully removed directory: " + sourceDir);
      // return true;

      if (sourceDir == null) {
          return false;
      }

      boolean allsuccess = true;
      boolean success = true;
      int nrOfFilesDeleted = 0;
      int nrOfDirsDeleted = 0;

      if (sourceDir.isDirectory()) {
          File[] files = sourceDir.listFiles();

          // I've seen listFiles return null, so be carefull, guess dir names too long for OS
          if (files == null) {
              log.warn("Something funny with '" + sourceDir + "'. Name or path too long?");
              log.warn("Could not delete '" + sourceDir + "' from cache");

              // see whether we can rename the dir
              if (sourceDir.renameTo(new File(sourceDir.getParent(), "1"))) {
                  log.warn("Renamed '" + sourceDir + "'");

                  return removeDir(sourceDir); // try again
              } else {
                  log.warn("Could not rename '" + sourceDir + "' to '" + sourceDir.getParent() + "1'");
              }

              return false;
          }

          log.debug(sourceDir + ": is a directory with " + files.length + " docs");

          for (int i = 0; i < files.length; i++) {
              log.debug("removing " + files[i]);

              if (files[i].isDirectory()) {
                  success = removeDir(files[i]);
              } else {
                  success = files[i].delete();
              }

              if (!success) {
                  log.warn("could not delete " + files[i] + " from cache");
              } else {
                  nrOfFilesDeleted++;
              }

              allsuccess = allsuccess && success;
          }

          log.debug("removing " + sourceDir);
          success = sourceDir.delete();

          if (!success) {
              log.warn("could not delete " + sourceDir + " from cache");
          } else {
              nrOfDirsDeleted++;
          }

          allsuccess = allsuccess && success;
      }

      // TODO: make this info at outer level of recursion
      log.debug("Deleted: " + nrOfDirsDeleted + " directories and " + nrOfFilesDeleted + " files from " + sourceDir);
      log.debug("Exiting removeDir for: " + sourceDir + ", " + allsuccess);

      return allsuccess;
  }

  /**
   * Determine whether File is somewhere within Directory.
   * 
   * @param file
   *            the File.
   * @param dir
   *            the Directory.
   * 
   * @return true, if so.
   */
  public static boolean isIn(final File file, final File dir) {
      if ((file == null) || !file.isFile()) {
          return false;
      }

      if ((dir == null) || !dir.isDirectory()) {
          return false;
      }

      String fileString;
      String directoryString;

      try {
          directoryString = dir.getCanonicalPath();
          fileString = file.getCanonicalPath();

          return fileString.startsWith(directoryString);
      } catch (IOException e) {
          log.error("Can't determine whether file is in Dir", e);
      }

      return false;
  }

  /**
   * Get the casesensitive extension (without the '.') of a file.
   * 
   * @param sourceFile
   *            the File the extension is extracted from.
   * 
   * @return extension, empty string if no extension.
   */
  public static String getExtension(final File sourceFile) {
      if (sourceFile == null) {
          return "";
      }

      // get the extension of the source file
      int index = sourceFile.getName().lastIndexOf('.');

      if (index != -1) {
          return sourceFile.getName().substring(index + 1);
      }

      return "";
  }

  /**
   * ���غ�׺����"test.gif"���򷵻�".gif"
   * @param filename
   * @return
   */
  public static String getExtension(final String filename) {
      if (filename == null) {
          return "";
      }

      // get the extension of the source file
      int index = filename.lastIndexOf('.');

      if (index != -1) {
          return filename.substring(index);
      }

      return "";
  }    
  
  /**
   * ��ȡ�ļ���ǰ׺����./upload/test.gif���򷵻�./upload/test
   * 
   * @param sourceFile
   * @return
   */
  public static String getPrefixion(String filename){
  	if(filename == null){
  		return "";
  	}
  	
  	String prefixion = "";
  	
  	 // get the prefixion of the source file
      int index = filename.lastIndexOf('.');

      if (index != -1) {
      	prefixion = filename.substring(0,index);
      }

      if(prefixion.equals("")){
      	return filename;
      }else{
      	return prefixion;
      }
  }
  
  /**
   * Create a new directory in the given directory, with prefix and postfix.
   * 
   * @param sourceFile
   *            the sourceFile to use for the new directory
   * @param dir
   *            the (existing) directory to create the directory in.
   * 
   * @return newly created Directory or null.
   * @throws IOException
   *             directory can't be created
   */
  public static File createTempDir(final File sourceFile, final File dir) throws IOException {
      File unZipDestinationDirectory = null;

      try {
          // get the full path (not just the name, since we could have recursed into newly created directory)
          String destinationDirectory = sourceFile.getCanonicalPath();
          
          log.debug("destinationDirectory: " + destinationDirectory);

          // change extension into _
          int index = destinationDirectory.lastIndexOf('.');
          String extension;

          if (index != -1) {
              extension = destinationDirectory.substring(index + 1);
              destinationDirectory = destinationDirectory.substring(0, index) + '_' + extension;
          }

          // actually create the directory
          unZipDestinationDirectory = new File(destinationDirectory);
          boolean canCreate = unZipDestinationDirectory.mkdirs();

          if (!canCreate) {
              log.warn("Could not create: " + unZipDestinationDirectory);
          }

          log.debug("Created: " + unZipDestinationDirectory + " from File: " + sourceFile);
      } catch (Exception e) {
          log.error("error creating directory from file: " + sourceFile, e);
      }

      return unZipDestinationDirectory;
  }

  /**
   * Get the casesensitive basename (without the '.') of a file.
   * 
   * @param sourceFile
   *            the File the basename is extracted from.
   * 
   * @return basename, entire name if no extension.
   */
  public static String getBasename(final File sourceFile) {
      if (sourceFile == null) {
          return "";
      }

      // get the basename of the source file
      int index = sourceFile.getName().lastIndexOf('.');

      if (index != -1) {
          return sourceFile.getName().substring(0, index);
      }

      return sourceFile.getName();
  }

  /**
   * Get the MD5 hash (unique identifier based on contents) of a file.
   * 
   * <p>
   * N.B. This is an expensive operation, since the entire file is read.
   * </p>
   * 
   * @param sourceFile
   *            the File the MD5 hash is created from, can take null or not a normalFile
   * 
   * @return MD5 hash of file as a String, null if it can't create a hash.
   */
  public static String getMD5Hash(final File sourceFile) {
      /*log.debug("Getting MD5 hash for " + sourceFile);

      final char[] HEX = "0123456789abcdef".toCharArray();

      if (sourceFile == null || !sourceFile.isFile()) {
          log.error("Error creating MD5 Hash for " + sourceFile);
          return null;
      }
      BufferedInputStream bis = null;
      try {
          IMessageDigest md = HashFactory.getInstance("MD5");
          if (md == null) {
              log.error("Error creating MessageDigest for " + sourceFile);
              return null;
          }

          bis = new BufferedInputStream(new FileInputStream(sourceFile));
          md.reset();
          int len = 0;
          byte[] buffer = new byte[8192];
          while ((len = bis.read(buffer)) > -1) {
              md.update(buffer, 0, len);
          }

          byte[] bytes = md.digest();
          if (bytes == null) {
              log.error("MessageDigest has no bytes for " + sourceFile);

              return null;
          }

          // base64? encode the digest
          StringBuffer sb = new StringBuffer(bytes.length * 2);
          int b;
          for (int i = 0; i < bytes.length; i++) {
              b = bytes[i] & 0xFF;
              sb.append(HEX[b >>> 4]);
              sb.append(HEX[b & 0x0F]);
          }

          log.debug("MD5 hash for " + sourceFile + " is " + sb);
          return sb.toString();
      } catch (FileNotFoundException e) {
          log.error("Can't determine MD5 hash for " + sourceFile, e);

          return null;
      } catch (IOException e) {
          log.error("Can't determine MD5 hash for " + sourceFile, e);

          return null;
      } finally {
          if (bis != null) {
              try {
                  bis.close();
              } catch (IOException e) {
                  log.warn("Can't close stream for " + sourceFile, e);
              }
          }
      }*/
  	return null;
  }
  
  /**
   * ����Ŀ¼�����isFile=true,�򴴽�path.getParent()��Ŀ¼��
   * ���򴴽�pathָ����·��
   */
  public static boolean mkdirs(String path, boolean isFile) throws IOException{
	File f = new File(path);

	if(isFile)
		return f.getParentFile().mkdirs();
	else
		return f.mkdirs();
  }    
  
  public static boolean exists(String filename){
  	File f = new File(filename);
  	
  	return f.exists();
  }
  
  public static boolean saveHtmlFile(String myurl,String outurl)
  {
  	boolean rtn = false;
	try {
		URL url = new URL(myurl);	           
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		//log.info("save html file..");
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn
				.getInputStream());
		FileOutputStream fos = new FileOutputStream(outurl);
		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = bis.read(buf)) != -1) {
			Thread.sleep(5);
			fos.write(buf, 0, size);
		}
		fos.close();
		bis.close();
		conn.disconnect();
		rtn = true;
	} catch (Exception e) {
		e.printStackTrace();
	}
	return rtn;
  }

  public static String saveHtmlFileToString(String myurl)
  {
	StringBuffer outBuf = null;
	try {
		URL url = new URL(myurl);	           
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		//log.info("save html file..");
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn
				.getInputStream());
		byte[] buf = new byte[1024];
		outBuf = new StringBuffer();
		while (bis.read(buf) != -1) {
			Thread.sleep(5);
			outBuf.append(new String(buf));
		}
		bis.close();
		conn.disconnect();
	} catch (Exception e) {
		e.printStackTrace();
	}
	if(outBuf!=null)
		return outBuf.toString();
	else
		return null;
  }
	
	public static boolean wget(String urlPath, String destFile) {
		//log.info("begin generate html...");

		try {
			URL url = new URL(urlPath);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.connect();

			BufferedInputStream bis = new BufferedInputStream(conn
					.getInputStream());
			FileOutputStream fos = new FileOutputStream(destFile);
			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = bis.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
			fos.close();
			bis.close();
			conn.disconnect();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		//log.info("generate " + htmlFile.getAbsolutePath() + " from " +urlPath + " successfully!");	    
		return false;
	}

    public static void get(String url, String destFile) throws IOException{
    	String site = "";
		String tmp[] = url.split("://");
		FileUtil.createPathByFileName(destFile);
		if(tmp.length>1){
			site = tmp[0]+"://"+tmp[1].substring(0,tmp[1].indexOf("/")+1);
		}
    	String cmds = "wget " + url 
    		+ " -U " + "\"Mozilla/5.0 (X11; U; Linux i686; zh-CN; rv:1.8) Gecko/20060117 Firefox RAYS/3:1.5.0-1.rays13 Firefox/1.5\""
    		+ " --referer=" + site 
    		+ " -O " + destFile
    		+ " -S &";
    	Runtime.getRuntime().exec(cmds);
	  	//Process process = Runtime.getRuntime().exec(cmds);
	  	/*BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(process.getInputStream()));

	  	String strBuffer = "";
	  	while ((strBuffer = bufferedReader.readLine()) != null) {
	  		log.info(strBuffer); 
	  	}
	  	bufferedReader.close(); */
    }
    
    
    public static void copy(File src, File des, FileFilter filter) throws IOException {
		if (src.isFile()) {
			if (!des.exists())
				des.mkdirs();
			File newFile = new File(des, src.getName());
			FileChannel in = new FileInputStream(src).getChannel();
			if (!newFile.exists())
				newFile.createNewFile();

			FileChannel out = new FileOutputStream(newFile).getChannel();
			out.transferFrom(in, 0, in.size());
			in.close();
			out.close();
		} else {
			File[] children = src.listFiles(filter);
			des = new File(des, src.getName());
			for (int i = 0; i < children.length; i++) {
				copy(children[i], des, filter);
			}
		}
	}
    
    public static boolean downloadImg(String urlPath, File destFile) {
        String site = "";
        String tmp[] = urlPath.split("://");
        if(tmp.length>1){
            site = tmp[0]+"://"+tmp[1].substring(0,tmp[1].indexOf("/")+1);
        }
        try {
            URL url = new URL(urlPath);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestProperty("User-Agent", "Baiduspider ( http://www.baidu.com/search/spider.htm)");
            conn.setRequestProperty("referer", site);
            conn.connect();

            BufferedInputStream bis = new BufferedInputStream(conn
                    .getInputStream());
            File parent = destFile.getParentFile();
            if(parent!= null && !parent.exists())
            	parent.mkdirs();
            
            destFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(destFile);
            byte[] buf = new byte[1024];
            int size = 0;
            while ((size = bis.read(buf)) != -1) {
                fos.write(buf, 0, size);
            }
            fos.close();
            bis.close();
            conn.disconnect();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //log.info("generate " htmlFile.getAbsolutePath() " from " urlPath " successfully!");        
        return false;
    }
    
    public static void writeLog(String strLogPath, String strLogFile, String msg) {
		java.io.File fd = new java.io.File(strLogPath);
		if (!fd.exists()) {
			fd.mkdirs();
		}

		String strLogFileName = strLogPath + strLogFile;
		PrintWriter out = null;
		try {
			try {
				java.io.File f = new java.io.File(strLogFileName);
				if (!f.exists()) {
					File ff = new File(f.getParent());
			    	ff.mkdirs();
					f.createNewFile();
				}
				out = new PrintWriter(new FileWriter(strLogFileName, true)); 
				String strDate = Convert.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
				StringBuffer sb = new StringBuffer();
				sb.append(strDate);
				sb.append(" ");
				sb.append(msg);
				out.println(sb);
			} finally {
				if (out != null)
					out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    /**
     * 获得某目录下所有文件
     * @param path
     * @return 所有子文件的全名集合
     */
    public static String[] listAllSubFile(String path){
    	String[] dirNames = null;
    	File file = new File(path);
    	
    	if(file.exists()){
    		File[] files = file.listFiles();
    		dirNames = new String[files.length];
    		for(int i = 0 ; i < files.length ;i++){
    			String dirName = files[i].getAbsolutePath();
    			dirNames[i] = dirName;
    		}
    	}
    	
    	return dirNames;
    }
    
    /**
     * 获得某目录下最新的文件
     * @param path
     * @return 最新文件名
     */
    public static String getTheNewestFile(String path){
    	File file = new File(path);
    	if(!file.exists()){
    		return null;
    	}
    	String fileName = null;
    	File[] childFiles = file.listFiles();
    	long time = 0l;
    	for(File f : childFiles){
    		if(f.lastModified() > time){
    			fileName = f.getAbsolutePath();
    		}
    		time = f.lastModified();
    	}
    	
    	return fileName;
    }
    
    public static String readFile(String file){
    	StringBuffer contents = null;
    	File readFile = new File(file);
    	if(!readFile.exists()){
    		return null;
    	}
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(readFile),"UTF-8"));
			String tempStr = "";
			int i = 0;
			contents = new StringBuffer();
			while((tempStr = br.readLine())!=null){
				contents.append(tempStr);
				contents.append(System.getProperty("line.separator"));
				i++;
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	return contents.toString();
    }
    
    public static void writeContent(String filePath, String content){
    	try{
    		createPathByFileName(filePath);
    		File file = new File(filePath);
    		if(!file.exists())createFile(filePath);
    		PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(file)));
			pw.println(content);
			pw.close();
    	}catch(IOException e){
    		e.printStackTrace();
    	}
    }

	public static void writeListToFile(String fileName, List<String> list){
		if(list==null || list.size()<=0)return;
		File file = new File(fileName);
		if(!file.exists()){
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(file));
			for(String str:list){
				if(str==null)continue;
				bw.write(str);
				bw.write("\r\n");
			}
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static List<String> loadLinesFromFile(String fileName){
		File file = new File(fileName);
		if(!file.exists()){
			return null;
		}
		List<String> itemList = new ArrayList<String>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String tempStr = "";
			while((tempStr = br.readLine())!=null){
				if(tempStr==null){
					itemList.add("");
				}
				else{
					itemList.add(tempStr);
				}
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return itemList;
	}
	
  public static void main(String[] args)
  {
// downloadImg("http://www.sinaimg.cn/ty/g/p/2007-06-24/U397P6T12D2999257F44DT20070624091418_small_min.jpg",
// new File("D:\\sina.gif"));
	  // http://www.sinaimg.cn/ty/g/p/2007-06-25/u397p6t12d3000409f44dt20070625090826_small_min.jpg
	  //http://www.sinaimg.cn/ty/g/p/2007-06-25/U397P6T12D3000409F44DT20070625090826_small_min.jpg
	  
//	  writeLog("e:/ffffff/dddd/","aaa.txt","this is a test!!!");
//	  listAllDir("e:/data/rumour/refer/");
//	  readFile("e:/data/rumour/refer/sohu/2007-07.log");
	  String content = FileUtil.readFile("e:/data/rumour/hotarticles/100/0022/hotarticles.txt");
	  
	  log.info(content.split(System.getProperty("line.separator")).length);
	  
  }
  
}
