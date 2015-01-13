package com.cc.cw.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

public class UploadClewImgProcessor implements AjaxProcessor{

	@SuppressWarnings({"deprecation","unchecked"})
	public void process(HttpServletRequest request, HttpServletResponse response){
		
		
		String currentPath="temp";
		File file = new File(currentPath);
		if(!file.isDirectory())
			file.mkdirs();
		
		String newName="";
		@SuppressWarnings("unused") String fileUrl="";
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
			
			
			
			String fileNameLong=uplFile.getName();
			fileNameLong=fileNameLong.replace('\\','/');
			String[] pathParts=fileNameLong.split("/");
			String fileName=pathParts[pathParts.length-1];
			
			String nameWithoutExt=getNameWithoutExtension(fileName);
			String ext=getExtension(fileName);
			File pathToSave=new File(currentPath,fileName);
			
			fileUrl=currentPath+"/"+fileName;
			
				int counter=1;
				while(pathToSave.exists()){
					newName=nameWithoutExt+"("+counter+")"+"."+ext;
					fileUrl=currentPath+"/"+newName;
					pathToSave=new File(currentPath,newName);
					counter++;
					}
				uplFile.write(pathToSave);
			}catch (Exception ex) {
			}
	}
	
	/*
	 * This method was fixed after Kris Barnhoorn (kurioskronic) submitted SF bug #991489
	 */
  	private static String getNameWithoutExtension(String fileName) {
    		return fileName.substring(0, fileName.lastIndexOf("."));
    	}
    	
	/*
	 * This method was fixed after Kris Barnhoorn (kurioskronic) submitted SF bug #991489
	 */
	private String getExtension(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".")+1);
	}

}
