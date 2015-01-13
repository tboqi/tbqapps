package com.cc.cw.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cc.cw.util.FileUtil;
import com.cc.cw.web.util.Constants;
import com.cc.cw.web.util.LinkManager;

/**
 * ����̬html��ʽ�������ַת����ʵ�ʵĶ�̬ҳ����ȥ
 * <br/>(1)8Ŀ��pages/column/column_XX.html --> 
 * <br/>(2)ͼ�飺pages/book/2005-10/book_XX.html -->
 * 
 * @author ����
 *
 */
public class PageServlet extends HttpServlet {
    private static final long serialVersionUID = 836325121952198088L; 
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String newLink = "";
    	RequestDispatcher rd = null;
        String pathInfo = request.getServletPath();
        if(request.getPathInfo()!=null)
        	pathInfo=pathInfo+request.getPathInfo();

        File htmlFile = new File(Constants.URLPattern.HTML_PATH+pathInfo);
        int rtn = needDispatch(htmlFile);
        if(rtn==0){ 
        	newLink = parse(pathInfo);
	        if(newLink!=null && !newLink.equals(pathInfo)){	            
	            //generate html files.
	        	String urlPath = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+newLink;

	        	LinkManager.generateHtml(urlPath, htmlFile);	
	        	//redispatch
	         	rd = request.getRequestDispatcher(newLink);	            
	            rd.forward(request, response);	
	            return;
	        }
        }else if(rtn==1){
        	ServletOutputStream out = response.getOutputStream();
        	FileInputStream fis = new FileInputStream(htmlFile);
        	byte[] buf = new byte[1024];
			int size = 0;

			while ((size = fis.read(buf)) != -1) {
				out.write(buf, 0, size);
			}
        	fis.close();
        	out.close();
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
    
    private String parse(String pathInfo){ 
    	if(LinkManager.isHomeLink(pathInfo)){
        	return LinkManager.parseHomeLink(pathInfo);
        } 

    	if(LinkManager.isRumourLink(pathInfo)){
        	return LinkManager.parseRumourLink(pathInfo);
        } 

    	if(LinkManager.isNewRumoursLink(pathInfo)){
        	return LinkManager.parseNewRumoursLink(pathInfo);
        } 
        return pathInfo;
    }
    
    private int needDispatch(File path){
    	int rtn = 1;  
    	if(path==null){
    		return 1;
    	}
    	if(path!=null && "html".equals(FileUtil.getExtension(path))){
    		long timeval = 0;
    		if(path.getPath().contains(Constants.URLPattern.INDEX_HTML)){
    			timeval = Constants.URLPattern.MAIN_INTERVAL;
    			if((System.currentTimeMillis()-path.lastModified())>timeval){
        			if(!path.getParentFile().exists())
        				path.getParentFile().mkdirs();
        			rtn = 0;
    			}
    		}
    		else if(path.getPath().contains(Constants.URLPattern.NEWRUMOURS_HTML)){
    			timeval = Constants.URLPattern.NEWRUMOURS_INTERVAL;
    			if((System.currentTimeMillis()-path.lastModified())>timeval){
        			if(!path.getParentFile().exists())
        				path.getParentFile().mkdirs();
        			rtn = 0;
    			}
    		}
    	}
    	
    	return rtn;
    }
}
