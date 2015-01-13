package com.cc.cw.dm.dataAnalyze;

public class InsertRule {
	public static void main(String[] args) {
		String str = "2 <- 1 3 4  (20.0, 100.0)";
		str = str.substring(0,str.indexOf('('));
		String[] s = str.split(" ");
		boolean b = true;
		for (int i = 0; i < s.length; i++) {
			if(b){
				if(s[i].equals("<-")){
					b = false;
				}else{
				}
			}else{
			}
			
		}
	}
}
