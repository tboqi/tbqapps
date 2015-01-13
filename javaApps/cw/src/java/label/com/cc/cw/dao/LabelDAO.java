package com.cc.cw.dao;

import java.util.List;

import com.cc.cw.domain.Label;

public interface LabelDAO {
	
	public Label get(int id);
	
	public int add(Label label);
	
	public int update(Label label);
	
	public int remove(int id);
	
	public List<Label> getByArticleId(int articleId);
	
	public Label getByArticleIdMemberId(int articleId,int memberId);
	

	public List<Label> getAllLabels();

	public List<Label> getNewLabels(int id);

	public int countNewLabels(int id);

	public List<Label> search(String key,int start,int count);

	public int searchCount(String key);
}
