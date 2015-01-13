package com.cc.cw.dao;

import java.util.List;

public interface UserLabelDAO {

	public int getCount(String uuid, int limit, int memberId);	
	
	public List getUserLabels(String uuid, int limit) ;
}
