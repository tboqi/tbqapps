<?php
class MSearch extends MY_Model {
	function __construct() {
		parent::__construct ();
		$this->table = "download_search";
	}
	
	function searchCount($key) {
		$sql = "select d.* from downloads d
		inner join download_search ds on ds.download_id=d.id
		where ds.key=?";
		$query = $this->db->query ( $sql, array ($key ) );
		return $query->num_rows ();
	}
	
	function initSearch($key) {
		$sql = "select d.id, d.title, d.description
		from downloads d
		where d.title like '%{$key}%' or d.description like '%{$key}%'";
		$query = $this->db->query ( $sql );
		$objects = $query->result ();
		if (is_array ( $objects ) && count ( $objects )) {
			$array ['key'] = $key;
			foreach ( $objects as $obj ) {
				$array ['download_id'] = $obj->id;
				$array ['widget'] = $this->widget($obj->title, $obj->description, $key);
				if ($array ['widget'] > 0) {
					$this->insert ( $array );
				}
			}
		}
	}
	
	function searchResult($key, $start, $num) {
		$sql = "select d.* from downloads d
		inner join download_search ds on ds.download_id=d.id
		where ds.key=?
		order by ds.widget desc limit ?, ?";
		return $this->objects ( $sql, array ($key, $start, $num ) );
	}
	
	/**
	 * 删除downID相关的search
	 * 选择所有相关的searchkey，注意有重复
	 * 判断downtitle和$downDescription中包含每个key的数量，如果大于0记录数据库
	 *
	 * @param int $downID
	 * @param string $downTitle
	 * @param string $downDescription
	 */
	function checkSearch($downID, $downTitle, $downDescription) {
		$this->db->delete ( $this->table, array ('download_id' => $downID ) );
		$sql = "select distinct `key` from download_search";
		$objects = $this->objects ( $sql );
		foreach ( $objects as $obj ) {
			$key = $obj->key;
			$widget = $this->widget($downTitle, $downDescription, $key);
			$array = array ('key' => $key, 'widget' => $widget, 'download_id' => $downID );
			if ($array ['widget'] > 0) {
				$this->insert ( $array );
			}
		}
	}
	
	private function widget($downTitle, $downDescription, $key) {
//		$downTitle = eregi_replace("<[^>]*>", "", $downTitle);
//		$downDescription = eregi_replace("<[^>]*>", "", $downDescription);
		return substr_count ( $downTitle, $key ) + substr_count ( $downDescription, $key );
	}
}