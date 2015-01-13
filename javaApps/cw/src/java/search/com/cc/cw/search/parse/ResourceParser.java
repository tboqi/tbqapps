package com.cc.cw.search.parse;

import java.util.List;

public interface ResourceParser {

	/**
	 * 读取文件得到最后索引的资源id
	 * @return	最后索引的资源id
	 */
	public String getLastIndexedId();
	
	/**
	 * 得到未被索引的资源列表
	 * @param from
	 * @return
	 */
	public List parseResource(String from);
	
	/**
	 * 更新存储文件为最后索引的资源ID
	 * @param lastIndexedRecord
	 */
	public void updateIndexRecord(String lastIndexedRecord);
	
	/**
	 * 检查是否有未被索引的资源
	 * @param lastIndexId - 上次索引到的id
	 * @return boolean
	 */
	public boolean haveNewResource(String lastIndexId);
}
