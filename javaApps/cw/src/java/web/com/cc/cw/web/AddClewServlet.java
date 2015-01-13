package com.cc.cw.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Clew;
import com.cc.cw.domain.Member;
import com.cc.cw.service.ClewService;

public class AddClewServlet extends HttpServlet{
	
	private static String CLEW_UPLOAD_DIR = CwConfiguration.create().get("clew_upload.dir");
	
	private static final long serialVersionUID = -9212417822405169035L;
	private Log log = LogFactory.getLog(getClass());
	private List<String> allowExtensionList ;
	private long allowSize = 0;
	private Member member = null;
	
	@SuppressWarnings("unchecked")
	public void init(){
		allowExtensionList = stringToArrayList(getInitParameter("AllowedExtensionsImage"));
		allowSize = Integer.parseInt(getInitParameter("AllowedSize")) * 1024 * 1024;
		log.info("allow arrayList");
		for(String s : allowExtensionList){
			log.info(s + "\n");
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		member =(Member) request.getSession().getAttribute("member");
		upload(request,response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
	
	@SuppressWarnings({"deprecation","unchecked"})
	public void upload(HttpServletRequest request, HttpServletResponse response){
		
		File clewDir = new File(CLEW_UPLOAD_DIR);//创建上传目录
		if(!clewDir.exists())
			clewDir.mkdirs();
		try{
			org.apache.commons.fileupload.DiskFileUpload upload = new org.apache.commons.fileupload.DiskFileUpload();
			List items = upload.parseRequest(request);
			Map fields=new HashMap();
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
			    FileItem item = (FileItem) iter.next();
			    if (item.isFormField())
			    	fields.put(item.getFieldName(),item.getString("UTF-8"));
			    else
			    	fields.put(item.getFieldName(),item);
			}
			
			String desc = fields.get("desc") == null ? "" : fields.get("desc").toString();
			String title = fields.get("title") == null ? "" : fields.get("title").toString();
			//页面表单元素值
			Map<String,Object> paraMap = new HashMap<String,Object>();
			paraMap.put("title", title);
			paraMap.put("desc", desc);
			
			if(member == null){
				String errorMsg = "error_member_null";
				ServletHelper.sendToErrorPage(request, response, errorMsg);
				return ;
			}
			if(desc == null || desc.equals("")){
				String errorMsg = "error_clew_contentnull";
				ServletHelper.sendToErrorPage(request, response, errorMsg);
				return ;
			}
			//得到图片
			FileItem uplFile=(FileItem)fields.get("image");
			long size = uplFile.getSize();
			//判断图片大小是否超过限制
			if(size > allowSize){
				log.info("size error");
				String errorMsg = "error_upload_errorsize";
				ServletHelper.sendToErrorPage(request, response, errorMsg);
				return ;
			}
			String extension = "";//图片后缀.jpeg...
				
			String fileNameLong=uplFile.getName();
			fileNameLong=fileNameLong.replace('\\','/');
			String[] pathParts=fileNameLong.split("/");
			String fileName=pathParts[pathParts.length-1];
			File pathToSave = null;
			log.info("fileName ---> " + fileName);
			if(fileName!=null && !fileName.equals("")){
				if(fileName.indexOf(".") > 0){//文件名合法性
					int position = fileName.lastIndexOf(".");
					extension = fileName.substring(position + 1 , fileName.length());
					if(!extIsAllowed(extension)){//后缀合法性
						log.info("the extension is not allow");
						String errorMsg = "error_upload_errorpostfix";
						ServletHelper.sendToErrorPage(request, response, errorMsg);
						return;
					}
				}else{
					log.info("file name is not correct : " + fileName);
					String errorMsg = "error_upload_errorpostfix";
					ServletHelper.sendToErrorPage(request, response, errorMsg);
					return ;
				}
				String newFileName = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date());
				pathToSave = new File(clewDir,newFileName + "." + extension);
				log.info("path to save : " + pathToSave);
				uplFile.write(pathToSave);
			}
			String imgPath = pathToSave == null ? "" : pathToSave.toString();
			
			//提交
			Clew clew = new Clew();
			clew.setCreater(member.getId());
			clew.setDiscription(desc);
			clew.setTitle(title);
			clew.setPicLink(imgPath == null ? "" : imgPath);
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
			ClewService clewService = (ClewService)ctx.getBean("clewService");
			clewService.add(clew);
			try {
				response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");	
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
			try {
				response.sendRedirect(request.getContextPath() + "/jsp/newclew.jsp");	
			} catch (Exception e) {
				e.printStackTrace();
			}
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
	 private boolean extIsAllowed(String ext) {
	 		
	 		ext=ext.toLowerCase();
	 		
	 		if(allowExtensionList == null || allowExtensionList.size() <= 0){
	 			return false;
	 		}else{
	 			if(allowExtensionList.contains(ext))
	 				return true;
	 			else
	 				return false;
	 		}
	 }
	
	/**
	 * 错误处理，错误类型1 文件过大,2 文件后缀不合法,3 文件名不合法,4 会员未登录,5 内容不能为空
	 * @param request
	 * @param response
	 * @param paraMap
	 */
	public void errorResponse(HttpServletRequest request, HttpServletResponse response,Map paraMap){
		
		request.getSession().setAttribute("paraMap", paraMap);
		try {
			response.sendRedirect(request.getContextPath() + "/jsp/newclew.jsp");	
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
