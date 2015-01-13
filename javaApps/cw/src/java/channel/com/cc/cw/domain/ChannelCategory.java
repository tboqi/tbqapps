package com.cc.cw.domain;
/**
 * 频道类型，通过频道申请时候指定的关键字，创建频道，如果此
 * 关键字已经出现在表中，将把count+1，
 * @author dzh
 * 上午09:55:47
 */
public class ChannelCategory {

	private int id;
	
	private String content;
	
	private int count;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
