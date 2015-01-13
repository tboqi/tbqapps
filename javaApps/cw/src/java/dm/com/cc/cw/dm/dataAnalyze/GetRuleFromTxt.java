package com.cc.cw.dm.dataAnalyze;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.cc.cw.web.CwConfiguration;

public class GetRuleFromTxt {
	private static String baseDir = CwConfiguration.create().get("dm.path");
	public List<String[]> getRules() throws IOException{
		FileInputStream fis = new FileInputStream(baseDir+"cw_dmresult_"+CreateFileForApriori.getPreMonthIndex());
		InputStreamReader isr = new InputStreamReader(fis,"utf-8");
		BufferedReader br = new BufferedReader(isr);
		ArrayList<String[]> al = new ArrayList<String[]>();
		
		String str = null;
		
		while((str=br.readLine())!=null){
			StringBuffer sb = new StringBuffer();
			String[] rules = new String[2];
			String[] s = str.substring(0,str.indexOf('(')).split(" ");
			boolean b = true;
			boolean flag = true;
			for (int i = 0; i < s.length; i++) {
				if(b){
					if(s[i].equals("<-")){
						b = false;
					}else{
						sb.append(s[i]+";");
					}
				}else{
					if(flag){
						if(sb.length()>0){
							rules[1] = sb.substring(0, sb.length()-1).toString();
							sb = new StringBuffer();
						}else{
							break;
						}
						flag = false;
					}
					sb.append(s[i]+";");
				}
			}
			if(sb.length()>0){
				rules[0] = sb.substring(0, sb.length()-1).toString();
				al.add(rules);
			}
		}
//		for (Iterator it = al.iterator(); it.hasNext();) {
//			String[] e = (String[]) it.next();
//		}
		return al;
	}
	public static void main(String[] args) throws IOException {
		GetRuleFromTxt g = new GetRuleFromTxt();
		g.getRules();
	}
}
