package com.cc.cw.service.impl;

import com.cc.cw.dao.ChannelCategoryDAO;
import com.cc.cw.domain.ChannelCategory;
import com.cc.cw.service.ChannelCategoryService;

public class ChannelCategoryServiceImpl implements ChannelCategoryService {
    private ChannelCategoryDAO dao;
	public int add(ChannelCategory cc) {
		return dao.add(cc);		  
	}

	public boolean delete(int id) {
		return dao.delete(id)>0?true:false;
	}

	public boolean exist(String content) {
		return dao.getByContent(content) == null ? false : true; 
	}

	public ChannelCategory getById(int id) {
		return dao.getById(id);
	}

	public ChannelCategoryDAO getDao() {
		return dao;
	}
	
	

	public void setDao(ChannelCategoryDAO dao) {
		this.dao = dao;
	}

	public boolean updateContent(String oldContent, String newContent) {
		int row=0;
		if(exist(oldContent)){
			int count=dao.getByContent(oldContent).getCount();
			row=dao.increaseCountByContent(oldContent,count);
		}else{
			ChannelCategory cc = new ChannelCategory();
			cc.setContent(newContent);
			row=dao.add(cc);
		}
		return row > 0;
	}
	

}
