package com.cc.cw.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.Element;

import com.cc.cw.util.XmlUtil;

public class CAdDelAction extends CMyAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2554566088856251026L;

	protected transient Log log = LogFactory.getLog(getClass());

	private static String baseDir = CwConfiguration.create().get("adpics.dir");
	private String position;
	private String idx;
	List<Map<String,String>> wList = null;

	public List<Map<String, String>> getWList() {
		return wList;
	}

	public void setWList(List<Map<String, String>> list) {
		wList = list;
	}

	@Override
	public String doExecute() {
		position = getRequest().getParameter("position");
		idx = getRequest().getParameter("idx");
		log.info("position:"+position);
		log.info("index:"+idx);
		if(position==null || idx==null){
			log.info("parameter error.");
			return INPUT;
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
		
		List items = null;
		if(w!=null){
			//delete
			items = XmlUtil.getKids(w);
			if(items!=null && items.size()>0){
				int pos = -1;
				if(idx!=null)pos = Integer.parseInt(idx);
				log.info("delete node");
				if(pos<items.size()){
					XmlUtil.delete(w, pos);
					XmlUtil.saveXmlFile(dc, baseDir+"/"+xmlFile);
					items.remove(pos);
				}
			}
		}

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
		
		return SUCCESS;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
}
