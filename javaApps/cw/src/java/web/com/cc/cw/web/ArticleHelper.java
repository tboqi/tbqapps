package com.cc.cw.web;

public class ArticleHelper {
	
	/**
	 * 从内容中得到第一个img的路径，将img的html代码取出，做为封面
	 * @param content
	 * @return
	 */
	public static String getCover(String content){
		if(content==null)return null;
		int start = 0;
		int end = 0;
		String img = "";
		String newContent = content.toLowerCase();
		start = newContent.indexOf("<img");
		if(start >= 0){
			String temp = content.substring(start);
			end = temp.indexOf(">");
			img = temp.substring(0,end+1);
		}
		return img;
	}
	
	public static String getCover(String content,int height,int width){
		if(content==null)return null;
		int start = 0;
		String img = "";
		String newContent = content.toLowerCase();
		start = newContent.indexOf("src");
		if(start > 0){
			String temp = content.substring(start) ;
			start = temp.indexOf("=");
			temp = temp.substring(start+1);
			temp = temp.trim();
			int end = temp.indexOf(" ");
			String context = temp.substring(0,end);
			if(context==null)return null;			
			String hstyle = " height="+height+" ";
			String wstyle = " width="+width+" ";			
			img = "<img src="+context+hstyle+wstyle+">";
		}
		return img;
	}
	
	public static String getCover(String content,String title,int height,int width){
		if(content==null)return null;
		int start = 0;
		String img = "";
		String newContent = content.toLowerCase();
		start = newContent.indexOf("src");
		if(start > 0){
			String temp = content.substring(start) ;
			start = temp.indexOf("=");
			temp = temp.substring(start+1);
			temp = temp.trim();
			int end = temp.indexOf(" ");
			String context = temp.substring(0,end);
			if(context==null)return null;			
			String hstyle = " height="+height+" ";
			String wstyle = " width="+width+" ";	
			String showTitle = "alt="+title;
			img = "<img class=\"img01\" src="+context+hstyle+wstyle+showTitle+">";
		}
		return img;
	}
	
	public static String getCoverSrc(String content){
		content = getCover(content);
		if(content == null || content.equals("")){
			return "";
		}
		int start = 0;
		String context = "";
		String newContent = content.toLowerCase();
		start = newContent.indexOf(" src");
		if(start > 0){
			String temp = content.substring(start) ;
			start = temp.indexOf("=");
			temp = temp.substring(start+1);
			temp = temp.trim();
			int end = 0;
			if(temp.indexOf(" ") != -1){
				end = temp.indexOf(" ");
			}
			else if(temp.indexOf("/>") != -1){
				end = temp.indexOf("/>");
			}else{
				end = temp.indexOf(">");
			}
			context = temp.substring(0,end);
			if(context==null)return null;			
		}
		return context.replaceAll("\"","");
	}
	
	public static void main(String [] args){

	}

}
