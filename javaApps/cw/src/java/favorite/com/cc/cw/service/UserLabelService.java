package com.cc.cw.service;

import java.util.List;

public interface UserLabelService {

	public List getFavoriteLabelArticles(String uuid, int labelCount, int start, int count, int memberId);
	public int getFavoriteLabelArticlesCount(String uuid, int labelCount, int memberId);
	public List getFavoriteLabels(String uuid, int labelCount);
}
