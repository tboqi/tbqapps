package com.cc.cw.service;

import com.cc.cw.domain.ChannelCategory;

public interface ChannelCategoryService {
	 public int add(ChannelCategory cc);
	 public boolean delete(int id);
	 public boolean exist(String content);
	 public ChannelCategory getById(int id);
	 public boolean updateContent(String oldContent,String newContent);
	
}
