<?php
class MCategory extends MY_Model {
	
	function __construct() {
		parent::__construct ();
		
		$this->table = "categories";
	}
	
	/**
	 * 判断在category_creator中是否已存在记录
	 *
	 * @param int $cateID
	 * @param int $userID
	 */
	function isExistCC($cateID, $userID) {
		$sql = "select * from category_creator where creator_id=? and category_id=?";
		$array = array($userID, $cateID );
		return $this->object($sql, $array);
	}
	
	function insertCC($cateID, $userID) {
		$sql = "insert into category_creator (creator_id, category_id) values (?, ?)";
		$this->db->query ( $sql, array ($userID, $cateID ) );
	}
	
	function findCategoriesByUserID($userID) {
		$sql = "select * from categories c 
		left join category_creator cc on cc.category_id=c.id
		where cc.creator_id=?";
		$array = array($userID);
		return $this->objects($sql, $array);
	}
	
	function findCategoriesWithMostDownloads($num) {
		$sql = "select id, c.name, catenum from categories c
		left join (select count(*) as catenum, category_id 
			from downloads group by category_id) dcount on dcount.category_id=c.id
		where catenum is not null
		order by dcount.catenum desc limit ?";
		$array = array($num);
		return $this->objects($sql, $array);
	}
	
	function delete($cateID, $userID) {
		$this->db->delete('category_creator', array('category_id' => $cateID, 'creator_id' => $userID));
		$this->db->delete('downloads', array('category_id' => $cateID, 'user_id' => $userID));
	}
	
	function all() {
		$sql = "select * from categories";
		return $this->objects($sql);
	}
	
	function isMyCategory($userID, $cateID) {
		$sql = "select * from category_creator where creator_id=? and category_id=?";
		$query = $this->db->query ( $sql, array ($userID, $cateID ) );
		return $query->num_rows ();
	}
}
