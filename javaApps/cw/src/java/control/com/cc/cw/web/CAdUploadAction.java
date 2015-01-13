package com.cc.cw.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.Element;

import com.cc.cw.util.XmlUtil;

public class CAdUploadAction extends CMyAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2720423111027108821L;

	protected transient Log log = LogFactory.getLog(getClass());

	private static String baseDir = CwConfiguration.create().get("adpics.dir");
	File imgFile;
	private String position = "article";
	private String imgFileContentType;
	private String imgFileFileName;
	private String url;
	private String coverPath;
	List<Map<String,String>> wList = null;

	public List<Map<String, String>> getWList() {
		return wList;
	}

	public void setWList(List<Map<String, String>> list) {
		wList = list;
	}

	@Override
	public String doExecute() {

		if(imgFile!=null){
		int idx = imgFileFileName.lastIndexOf(".");
		if(idx>0){
			String t = ""+new Date().getTime();
			imgFileFileName = t + imgFileFileName.substring(idx);
		}else{
			log.error("invalid input file: " + imgFileFileName);
			return INPUT;
		}

		File imgPath = new File(baseDir+position);
		if(!imgPath.exists())imgPath.mkdirs();

		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(imgFile));
			File f = new File(imgPath,imgFileFileName);
			coverPath = f.getAbsolutePath();
			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(f));
			byte [] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return INPUT;
		} catch (IOException e) {
			e.printStackTrace();
			return INPUT;
		}
		}
		//if upload pic success, then write file
		//the file is /data/rumour/adpics/ads.xml
		String xmlFile = "ads.xml";
		Document dc = XmlUtil.getDC(baseDir+xmlFile,"root");
		Element w = XmlUtil.select(dc,"/root/"+position);
		if(w==null){
			Element r = XmlUtil.getRootNode(dc);
			if(r==null)r = XmlUtil.addRootNode(dc, "root");
			if(r!=null)w = XmlUtil.addNode(r, position, "");
		}
		if(w!=null && url!=null && !url.trim().equals("")
				 && coverPath!=null && !coverPath.trim().equals("")){
			XmlUtil.addNode(w, "pic", "url", url, coverPath);
			XmlUtil.saveXmlFile(dc, baseDir+"/"+xmlFile);
		}
		if(w!=null){
			List items = XmlUtil.getKids(w);
			if(items!=null && items.size()>0){
				wList = new ArrayList<Map<String,String>>();
				for(int i=0;i<items.size();i++){
					Element e = (Element)items.get(i);
					Map<String,String> item = new HashMap<String,String>();
					item.put("idx", ""+i);
					item.put("url", e.attributeValue("url"));
					item.put("pic", e.getText());
					wList.add(item);
				}
			}
		}
		
		return SUCCESS;
	}
	
	public File getImgFile() {
		return imgFile;
	}
	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	public String getImgFileContentType() {
		return imgFileContentType;
	}
	public void setImgFileContentType(String imgFileContentType) {
		this.imgFileContentType = imgFileContentType;
	}
	public String getImgFileFileName() {
		return imgFileFileName;
	}
	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
