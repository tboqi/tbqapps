package com.cc.cw.dao;

import com.cc.cw.domain.UnionUser;

public interface UnionUserDao {

	UnionUser getConfigMap(String domainName);

	void saveIp(String ip, String domainName);

	int getCount(String ip, String domainName);

}
