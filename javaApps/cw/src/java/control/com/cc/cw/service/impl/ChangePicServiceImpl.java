package com.cc.cw.service.impl;

import com.cc.cw.dao.IndexPicDAO;
import com.cc.cw.domain.IndexPic;
import com.cc.cw.service.ChangePicService;

public class ChangePicServiceImpl implements ChangePicService {

	private IndexPicDAO indexPicDAO;

	public void save(IndexPic indexpic) {
		indexPicDAO.save(indexpic);
	}

	public IndexPicDAO getIndexPicDAO() {
		return indexPicDAO;
	}

	public void setIndexPicDAO(IndexPicDAO indexPicDAO) {
		this.indexPicDAO = indexPicDAO;
	}

	public IndexPic getIndexPic() {
		return indexPicDAO.getIndexPic();
	}

}
