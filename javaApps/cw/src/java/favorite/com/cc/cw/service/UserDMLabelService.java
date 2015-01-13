package com.cc.cw.service;

import java.util.List;

public interface UserDMLabelService {

	public List getFavoriteLabelArticles(String uuid, int labelCount, int start, int count);
	public int getFavoriteLabelArticlesCount(String uuid, int labelCount);
	public List getFavoriteLabels(String uuid, int labelCount);
}
