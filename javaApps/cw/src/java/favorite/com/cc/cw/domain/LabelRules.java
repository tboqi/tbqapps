package com.cc.cw.domain;

import java.util.Date;

public class LabelRules {

	private int id;
	private String sourceTags;
	private String targetTags;
	private String type;
	private Date createTime;
	private String operatorName;
	private Date disuseTime;
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String string) {
		this.operatorName = string;
	}
	public String getSourceTags() {
		return sourceTags;
	}
	public void setSourceTags(String sourceTags) {
		this.sourceTags = sourceTags;
	}
	public String getTargetTags() {
		return targetTags;
	}
	public void setTargetTags(String targetTags) {
		this.targetTags = targetTags;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getDisuseTime() {
		return disuseTime;
	}
	public void setDisuseTime(Date disuseTime) {
		this.disuseTime = disuseTime;
	}
}

