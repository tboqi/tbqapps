package com.cc.cw.domain;

import java.util.Date;

public class UserLabel {

	private String label;

	private String uuid;

	private int clicktime;

	private Date updatetime;
	
	private float weight;

	
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getClicktime() {
		return clicktime;
	}

	public void setClicktime(int clicktime) {
		this.clicktime = clicktime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

}
