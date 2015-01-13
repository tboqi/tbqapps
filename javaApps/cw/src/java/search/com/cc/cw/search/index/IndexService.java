package com.cc.cw.search.index;

public interface IndexService {
	/**
	 * 索引资源
	 * @param type 要索引的资源种类
	 */
	public boolean index();
	
	/**
	 * 删除索引库
	 */
	public void removeIndexDB();
	
	/**
	 * 根据指定的字段和值，删除最新的索引库中，相关的索引
	 * @param key
	 * @param value
	 */
	public void deleteIndex(String key,String value);
	
	/**
	 * 删除旧的索引库文件
	 *
	 */
	public boolean deleteOldIndex();
}
