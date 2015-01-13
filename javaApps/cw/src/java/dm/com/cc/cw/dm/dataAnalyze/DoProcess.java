package com.cc.cw.dm.dataAnalyze;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;

import com.cc.cw.web.CwConfiguration;

public class DoProcess {
	private static String baseDir = CwConfiguration.create().get("dm.path");
	static Logger log = Logger.getLogger("dmLogger");
	public static void execute() {
		log.info("DoProcess begin ===>");
		Runtime   runtime   =   Runtime.getRuntime();   
        Process   process   =   null;   
        InputStream   is   =   null;   
        InputStreamReader   isr   =   null;   
        BufferedReader   br   =   null;   
        String source = baseDir+"cw_dmsource_"+CreateFileForApriori.getPreMonthIndex();
        String target = baseDir+"cw_dmresult_"+CreateFileForApriori.getPreMonthIndex();
        try   {   
//            process   =   runtime.exec("apriori "+p+" src/conf/result_cw.txt");     //关键是这行   
        	process   =   runtime.exec("apriori "+source+" "+target+" -f\";\"");
        	log.info("apriori "+source+" "+target+" -f\";\"");
        }   catch   (IOException   e)   {   
        	log.error("DoProcess ERROR ====> IO exception \n" + e.getMessage());
        }   
        is   =   process.getInputStream();   
  
        isr=new   InputStreamReader(is);   
        br   =new   BufferedReader(isr);   
        try{   
            while   (   (br.readLine())   !=   null)   {   
//                log.info(line);   
            }   
        }catch     (IOException   e   )   {   
        	log.error("DoProcess ERROR ====> IO exception \n" + e.getMessage());
            e.printStackTrace();   
        }  
        log.info("DoProcess end ===>");
	}
	public static void main(String[] args) {
		DoProcess.execute();
	}
}
