package com.cc.cw.web.action.common;

import java.util.List;

import com.cc.cw.domain.AtomLabel;
import com.cc.cw.service.AtomLabelService;

/**
 * 标签action
 * @author dzh
 *
 */
public class TagsAction extends BaseActionSupport{

	private static final long serialVersionUID = -2101609737451897053L;
	
	//action所需服务
	private AtomLabelService labelService ;
	
	//页面所需数据
	private List<AtomLabel> labelList ;
	
	/**
	 * action 主方法 负责生成最热标签
	 * @return SUCCESS /ftl/tags.ftl
	 */
	public String execute(){
		labelList = labelService.getHotAtomLabel(1,100);
		return SUCCESS;
	}

	//所有服务、数据的get set方法
	public void setLabelService(AtomLabelService labelService) {
		this.labelService = labelService;
	}

	public List<AtomLabel> getLabelList() {
		return labelList;
	}

}
