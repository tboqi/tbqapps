package com.cc.cw.service.impl;

import java.util.List;

import com.cc.cw.dao.FriendLinkDAO;
import com.cc.cw.domain.FriendLink;
import com.cc.cw.service.FriendLinkService;

public class FriendLinkServiceImpl implements FriendLinkService {

	private FriendLinkDAO flDAO;

	public void delete(int id) {
		flDAO.delete(id);
	}

	public int getCount() {
		return flDAO.getCount();
	}

	public int getCount(String condition) {
		return flDAO.getCount(condition);
	}

	public List<FriendLink> getLink(int start, int num) {
		return flDAO.getLink(start, num);
	}

	public List<FriendLink> getLink(String condition, int start, int num) {
		return flDAO.getLink(condition, start, num);
	}

	public List<FriendLink> getLinkIndex() {
		return flDAO.getLink("where display=2");
	}

	public void insert(FriendLink link) {
		flDAO.insert(link);
	}

	public void update(FriendLink link) {
		flDAO.update(link);
	}

	public FriendLinkDAO getFlDAO() {
		return flDAO;
	}

	public void setFlDAO(FriendLinkDAO flDAO) {
		this.flDAO = flDAO;
	}

	public List<FriendLink> getLinkForPic() {
		String condition = "where ";
		condition += "logoUrl is not null and logoUrl != '' and display=1";
		return flDAO.getLink(condition);
	}

	public List<FriendLink> getLinkForText() {
		String condition = "where ";
		condition += "(logoUrl is null or logoUrl = '') and display=1";
		return flDAO.getLink(condition);
	}

	public FriendLink get(int i) {
		return flDAO.get(i);
	}

	public List<FriendLink> getUncheckLink(int i, int j) {
		String condition = "where display=0";
		return flDAO.getLink(condition, i, j);
	}
}
