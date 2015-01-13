package com.cc.cw.dm.module;

public class LabelRules {
	private String sourcetags;
	private String targettags;
	private String type;
	public LabelRules(String sourcetags, String targettags, String type) {
		super();
		this.sourcetags = sourcetags;
		this.targettags = targettags;
		this.type = type;
	}
	public LabelRules(){
		
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSourcetags() {
		return sourcetags;
	}
	public void setSourcetags(String sourcetags) {
		this.sourcetags = sourcetags;
	}
	public String getTargettags() {
		return targettags;
	}
	public void setTargettags(String targettags) {
		this.targettags = targettags;
	}
}
