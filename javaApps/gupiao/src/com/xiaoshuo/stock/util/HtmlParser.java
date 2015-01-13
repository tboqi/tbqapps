package com.xiaoshuo.stock.util;

/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.io.IOException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.Source;
import au.id.jericho.lib.html.StartTag;


public class HtmlParser {

    @SuppressWarnings("deprecation")
	private String[] parseContent(Source source){
        
        //如果node.tag不为空和level[也就是depth]不等于0
        //在正文中，getallstarttag(node.tag)。and depth=node.level
        //在此循环每个范围.   	
    	
    	String[] s = null;
    	List list = source.findAllStartTags("ol");
    	if(list!=null && list.size()>0)s = new String[list.size()];
    	Iterator it = list.iterator();
    	int idx = 0;
    	while(it!=null && it.hasNext()){
    		StartTag st = (StartTag)it.next();//范围为空的时候，范围是整个html
    		if(st==null)continue;
            Element e = st.getElement();
            if(e==null)continue;
            s[idx] = e.extractText();
            idx++;
//            int a = e.getBegin();
//            int b = e.getEnd();
//            int idx = 0;
//            while(b>a){
//            	StartTag s = source.findNextStartTag(a);
//            	Element t = s.getElement();
//            	//if(idx==3 || idx==5)
//            	System.out.println(t.extractText());
//            	a = s.getEnd();
//            	idx ++;
//            }            
    	}
        return s;
    }
 
    public String[] getData(String sourceUrlString){
        try{
	        //MasonTagTypes.register();
	        Source source = new Source(new URL(sourceUrlString));
	        return parseContent(source);
        }catch(IOException e){
        	e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args){
    }

}
