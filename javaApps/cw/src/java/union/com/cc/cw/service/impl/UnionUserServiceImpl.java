package com.cc.cw.service.impl;

import com.cc.cw.dao.UnionUserDao;
import com.cc.cw.domain.UnionUser;
import com.cc.cw.service.UnionUserService;

public class UnionUserServiceImpl implements UnionUserService {
	
	private UnionUserDao uudao;
	
	public UnionUser getWebsiteConfigMap(String domainName){
		UnionUser map = uudao.getConfigMap(domainName);
		return map;
	}
	
	public void saveIp(String ip, String domainName){
		if(getTodayCountByIp(ip, domainName) < 1) {
			//写入
			uudao.saveIp(ip, domainName);
		}
	}

	private int getTodayCountByIp(String ip, String domainName) {
		
		return uudao.getCount(ip, domainName);
	}

	public UnionUserDao getUudao() {
		return uudao;
	}

	public void setUudao(UnionUserDao uudao) {
		this.uudao = uudao;
	}
}
