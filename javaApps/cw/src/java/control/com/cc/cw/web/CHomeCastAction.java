package com.cc.cw.web;

import com.cc.cw.web.data.HomeCastData;

public class CHomeCastAction extends CMyAction {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8724924285352768730L;

	private String action;	// action: get or set
	
	private String strCast;	// return get result
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getStrCast() {
		return strCast;
	}

	public void setStrCast(String strCast) {
		this.strCast = strCast;
	}

	@Override
	public String doExecute() {
		if(action==null || action.trim().equals(""))
			action = "get";
		
		if("get".equalsIgnoreCase(action)){
			strCast = HomeCastData.getBroadCast();
		}		
		else if("set".equalsIgnoreCase(action)){
			HomeCastData.setBroadCast(strCast);
		}
		else return INPUT;
		
		if(strCast==null)strCast="";
		
		return SUCCESS;
	}

}
