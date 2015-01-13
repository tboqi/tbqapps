package com.cc.cw.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.cc.cw.domain.Member;

public class UploadServlet extends HttpServlet{
	/**
	 * 
	 */
	private Log log = LogFactory.getLog(getClass());
	private static final long serialVersionUID = -1587679698542951696L;
	private static String baseDir = CwConfiguration.create().get("upload.dir");
	private static boolean debug=false;
	private static boolean enabled=false;
	@SuppressWarnings("unchecked")
	private static Hashtable allowedExtensions;
	@SuppressWarnings("unchecked")
	private static Hashtable deniedExtensions;
	
	private static long maxSize = 20971520;//20M
	
	/**
	 * Initialize the servlet.<br>
	 * Retrieve from the servlet configuration the "baseDir" which is the root of the file repository:<br>
	 * If not specified the value of "/UserFiles/" will be used.<br>
	 * Also it retrieve all allowed and denied extensions to be handled.
	 *
	 */
	@SuppressWarnings("unchecked")
	 public void init() throws ServletException {
	 	debug=(new Boolean(getInitParameter("debug"))).booleanValue();
	 	
	 	
		enabled=(new Boolean(getInitParameter("enabled"))).booleanValue();
		log.debug("basedir ................." + baseDir);
		String realBaseDir=baseDir;//getServletContext().getRealPath(baseDir);
		log.debug("the upload for article's picture dir :"+realBaseDir);
		File baseFile=new File(realBaseDir);
		if(!baseFile.exists()){
			baseFile.mkdir();
		}
		
		allowedExtensions = new Hashtable(3);
		deniedExtensions = new Hashtable(3);
				
		allowedExtensions.put("File",stringToArrayList(getInitParameter("AllowedExtensionsFile")));
		deniedExtensions.put("File",stringToArrayList(getInitParameter("DeniedExtensionsFile")));

		allowedExtensions.put("Image",stringToArrayList(getInitParameter("AllowedExtensionsImage")));
		deniedExtensions.put("Image",stringToArrayList(getInitParameter("DeniedExtensionsImage")));
		
		allowedExtensions.put("Flash",stringToArrayList(getInitParameter("AllowedExtensionsFlash")));
		deniedExtensions.put("Flash",stringToArrayList(getInitParameter("DeniedExtensionsFlash")));
			
	}
	

	/**
	 * Manage the Upload requests.<br>
	 *
	 * The servlet accepts commands sent in the following format:<br>
	 * simpleUploader?Type=ResourceType<br><br>
	 * It store the file (renaming it in case a file with the same name exists) and then return an HTML file
	 * with a javascript command in it.
	 *
	 */	
	@SuppressWarnings({"unchecked","deprecation"})
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control","no-cache");
		PrintWriter out = response.getWriter();
		
		String typeStr=request.getParameter("Type");
		String category = (String)request.getSession().getAttribute("category_upload");
		Object authorId = request.getSession().getAttribute("authorId");
		Object articleId = request.getSession().getAttribute("articleId");
		request.getSession().removeAttribute("category_upload");
		request.getSession().removeAttribute("authorId");
		request.getSession().removeAttribute("articleId");
		
		Member member = (Member)request.getSession().getAttribute("member");
		if(member == null){
			String errorMsg = "error_member_null";
			ServletHelper.sendToErrorPage(request, response, errorMsg);
			return ;
		}
		int memberId = member.getId();
		
		String currentDirPath = "";
		String currentPath = "";
		if(category == null || category.equals("")){
			currentPath=baseDir + memberId + "/" + "temp";
			currentDirPath=currentPath;//getServletContext().getRealPath(currentPath);
			//currentPath=request.getContextPath()+currentPath;
			File file = new File(currentDirPath);
			if(!file.isDirectory())
				file.mkdirs();
		}else{
			log.debug(" ---------------------------> remark");
			currentPath=baseDir + authorId +"/" + articleId + "/"+ "temp";
			currentDirPath=currentPath;//getServletContext().getRealPath(currentPath);
			//currentPath=request.getContextPath()+currentPath;
			File file = new File(currentDirPath);
			if(!file.isDirectory())
				file.mkdirs();
		}
		
		String retVal="0";
		String newName="";
		String fileUrl="";
		String errorMessage="";
		
		if(enabled) {		
			org.apache.commons.fileupload.DiskFileUpload upload = new org.apache.commons.fileupload.DiskFileUpload();
			try {
				List items = upload.parseRequest(request);
				Map fields=new HashMap();
				
				Iterator iter = items.iterator();
				while (iter.hasNext()) {
				    FileItem item = (FileItem) iter.next();
				    if (item.isFormField())
				    	fields.put(item.getFieldName(),item.getString());
				    else
				    	fields.put(item.getFieldName(),item);
				}
				FileItem uplFile=(FileItem)fields.get("NewFile");
				
				if(hasSpace(currentDirPath,uplFile.getSize())){
				
				
				String fileNameLong=uplFile.getName();
				fileNameLong=fileNameLong.replace('\\','/');
				String[] pathParts=fileNameLong.split("/");
				String fileName=pathParts[pathParts.length-1];
				
				String nameWithoutExt=new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date());//getNameWithoutExtension(fileName);
				String ext=getExtension(fileName);
				ext.toLowerCase();
				fileName = nameWithoutExt + "." + ext;
				File pathToSave=new File(currentDirPath,fileName);
				
				fileUrl=currentPath+"/"+fileName;
				if(extIsAllowed(typeStr,ext)) {
					int counter=1;
					while(pathToSave.exists()){
						newName=nameWithoutExt+"("+counter+")"+"."+ext;
						fileUrl=currentPath+"/"+newName;
						retVal="201";
						pathToSave=new File(currentDirPath,newName);
						counter++;
						}
					uplFile.write(pathToSave);
				}
				else {
					retVal="202";
					errorMessage="";
				}}else{
					retVal="1";
					errorMessage="not enough space";
				}
			}catch (Exception ex) {
				if (debug) ex.printStackTrace();
				retVal="203";
			}
		}
		else {
			retVal="1";
			errorMessage="This file uploader is disabled. Please check the WEB-INF/web.xml file";
		}
		
		
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.OnUploadCompleted("+retVal+",'"+fileUrl+"','"+newName+"','"+errorMessage+"');");
		out.println("</script>");
		out.flush();
		out.close();
	}


	/*
	 * This method was fixed after Kris Barnhoorn (kurioskronic) submitted SF bug #991489
	 */
	private String getExtension(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".")+1);
	}



	/**
	 * Helper function to convert the configuration string to an ArrayList.
	 */
	@SuppressWarnings("unchecked")
	 private ArrayList stringToArrayList(String str) {
	 
	 String[] strArr=str.split("\\|");
	 	 
	 ArrayList tmp=new ArrayList();
	 if(str.length()>0) {
		 for(int i=0;i<strArr.length;++i) {
		 		tmp.add(strArr[i].toLowerCase());
			}
		}
		return tmp;
	 }


	/**
	 * Helper function to verify if a file extension is allowed or not allowed.
	 */
	@SuppressWarnings("unchecked")
	 private boolean extIsAllowed(String fileType, String ext) {
	 		
	 		ext=ext.toLowerCase();
	 		
	 		ArrayList allowList=(ArrayList)allowedExtensions.get(fileType);
	 		ArrayList denyList=(ArrayList)deniedExtensions.get(fileType);
	 		
	 		if(allowList.size()==0)
	 			if(denyList.contains(ext))
	 				return false;
	 			else
	 				return true;

	 		if(denyList.size()==0)
	 			if(allowList.contains(ext))
	 				return true;
	 			else
	 				return false;
	 
	 		return false;
	 }
	 
	 private boolean hasSpace(String dir , long newFileSize){
		 File list = new File(dir);
		 File[] fileset = list.listFiles();
		 long size = 0;
		 for(File file : fileset)
			 size = size + file.length();
		 size = size + newFileSize;
		 return maxSize > size;
	 }
}
