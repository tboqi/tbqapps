package com.cc.cw.web.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import com.cc.cw.util.StringUtils;

public class LinkManager {
	
	public static String parseHomeLink(String htmlLink){
		return Constants.URLPattern.INDEX_JSP;
	}

	public static boolean isHomeLink(String htmlLink){
		return (htmlLink!=null) && (htmlLink.startsWith(Constants.URLPattern.INDEX_HTML));
	}

	public static String parseNewRumoursLink(String htmlLink){
        String title = StringUtils.getFileTitle(StringUtils.getFilename(htmlLink));
    	StringBuffer sb = new StringBuffer();
    	sb.append(Constants.URLPattern.NEWRUMOURS_JSP);
    	sb.append("?pageId=");
    	sb.append(title);
    	htmlLink = sb.toString();
		return htmlLink;
	}

	public static boolean isNewRumoursLink(String htmlLink){
		return (htmlLink!=null) && (htmlLink.startsWith(Constants.URLPattern.NEWRUMOURS_HTML));
	}

	public static String constructNewRumoursLink(String contextPath, int pageId){
		StringBuffer linkBuffer = new StringBuffer();
		linkBuffer.append(Constants.URLPattern.NEWRUMOURS_HTML);
		linkBuffer.append(pageId);
		linkBuffer.append(".html");
		return contextPath + linkBuffer.toString();
	}	

	public static String parseRumourLink(String htmlLink){
        String title = StringUtils.getFileTitle(StringUtils.getFilename(htmlLink));
    	StringBuffer sb = new StringBuffer();
    	sb.append(Constants.URLPattern.RUMOUR_JSP);
    	sb.append("?id=");
    	sb.append(title);
    	htmlLink = sb.toString();
		return htmlLink;
	}

	public static boolean isRumourLink(String htmlLink){
		return (htmlLink!=null) && (htmlLink.startsWith(Constants.URLPattern.RUMOUR_HTML));
	}

	public static String constructRumourLink(String contextPath, int id){
		String sid = id + "";
		int len = sid.length();
		for(int i=0;i<7-len;i++){
			sid = "0" + sid;
		}
		String u = sid.substring(0,4);
		String l = sid.substring(4);
		
		StringBuffer linkBuffer = new StringBuffer();
		linkBuffer.append(Constants.URLPattern.RUMOUR_HTML);
		linkBuffer.append(u);
		linkBuffer.append("/");
		linkBuffer.append(l);
		linkBuffer.append("/");
		linkBuffer.append(id);
		linkBuffer.append(".html");
		return contextPath + linkBuffer.toString();
	}	
    
	public static void generateHtml(String urlPath, File htmlFile) throws IOException{
        URL url = new URL(urlPath);            
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        try {
            conn.connect();

            BufferedInputStream bis = new BufferedInputStream(conn
                    .getInputStream());
            FileOutputStream fos = new FileOutputStream(htmlFile);
            byte[] buf = new byte[1024];
            int size = 0;
            while ((size = bis.read(buf)) != -1) {
                fos.write(buf, 0, size);
            }
            fos.close();
            bis.close();
            conn.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
	public static void main(String[] argv) {
		
	}
}
