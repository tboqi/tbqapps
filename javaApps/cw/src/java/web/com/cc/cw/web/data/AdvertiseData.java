package com.cc.cw.web.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.Element;

import com.cc.cw.util.XmlUtil;
import com.cc.cw.web.CwConfiguration;

public class AdvertiseData {

	protected static transient Log log = LogFactory.getLog(AdvertiseData.class);
	private static String baseDir = CwConfiguration.create().get("adpics.dir");
	
	public static List<Map<String,String>> getAds(String position){
		List<Map<String,String>> wList = null;
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
			items = XmlUtil.getKids(w);
		}
		if(items!=null && items.size()>0){
			wList = new ArrayList<Map<String,String>>();
			for(int i=0;i<items.size();i++){
				Element e = (Element)items.get(i);
				if(e==null)continue;
				Map<String,String> item = new HashMap<String,String>();
				item.put("idx", ""+i);
				item.put("url", e.attributeValue("url"));
				item.put("pic", e.getText());
				wList.add(item);
			}
		}
		return wList;
	}
	
}
