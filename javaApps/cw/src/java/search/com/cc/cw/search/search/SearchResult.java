package com.cc.cw.search.search;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * ��
 * @author xiat
 * @version 1.0
 * @date 2006-4-11 11:55:30
 */
public class SearchResult implements Serializable {
	private static final long serialVersionUID = -1056925075583470096L;

	private List<Map<String,String>> searchItems;

	private long totalItemCount;

	private long usedTime;

	private int currentPos;

	private int currentLength;

	public int getCurrentLength() {
		return currentLength;
	}

	public void setCurrentLength(int currentLength) {
		this.currentLength = currentLength;
	}

	public int getCurrentPos() {
		return currentPos;
	}

	public void setCurrentPos(int currentPos) {
		this.currentPos = currentPos;
	}

	public List<Map<String,String>> getSearchItems() {
		if (searchItems == null) {
			searchItems = new ArrayList<Map<String,String>>();
		}
		return searchItems;
	}

	public void setSearchItems(List<Map<String,String>> searchItems) {
		this.searchItems = searchItems;
	}

	public long getTotalItemCount() {
		return totalItemCount;
	}

	public void setTotalItemCount(long count) {
		this.totalItemCount = count;
	}

	public long getUsedTime() {
		return usedTime;
	}

	public void setUsedTime(long usedTime) {
		this.usedTime = usedTime;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("totalItemCount=");
		sb.append(this.totalItemCount);
		sb.append("; currentPos=");
		sb.append(this.currentPos);
		sb.append("; currentLength=");
		sb.append(this.currentLength);
		sb.append("; usedTime=");
		sb.append(this.usedTime);
		sb.append("\n Reocrds:\n");
//		for (SearchItem r : getSearchItems()) {
//			sb.append(r.toString());
//			sb.append("\n");
//		}

		return sb.toString();
	}
}
