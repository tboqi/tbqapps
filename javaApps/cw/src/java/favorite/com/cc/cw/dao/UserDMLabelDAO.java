package com.cc.cw.dao;

import java.util.List;

public interface UserDMLabelDAO {

	public int getCount(String uuid, int limit);	
	
	public List getUserLabels(String uuid, int limit) ;
}
