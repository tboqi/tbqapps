package com.cc.cw.search.parse;

import java.util.List;

import com.cc.cw.domain.SimpleArticle;
import com.cc.cw.service.ArticleService;

public class ArticleResourceParse extends ResourceParseImpl {
	private ArticleService service = null;

	public String getPath(){
		return FILEPATH + "articleIndexedRecord.txt";
	}

	public boolean haveNewResource(String id) {
		if(id != null && !(id.equals(""))){
			return service.haveNewResource(Integer.parseInt(id));
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<SimpleArticle> parseResource(String from) {
		try{
			if(from != null && !(from.equals(""))){
				return service.getNewFromId(Integer.parseInt(from));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public void setService(ArticleService service) {
		this.service = service;
	}
	
}
