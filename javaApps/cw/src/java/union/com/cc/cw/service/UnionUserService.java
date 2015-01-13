package com.cc.cw.service;

import com.cc.cw.domain.UnionUser;

public interface UnionUserService {
	
	public UnionUser getWebsiteConfigMap(String domainName);
	
	public void saveIp(String ip, String domainName);
}
