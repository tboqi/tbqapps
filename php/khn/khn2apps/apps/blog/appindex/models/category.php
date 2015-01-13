<?php
class Category_Model extends Base_Model {
	
	function __construct() {
		parent::__construct ();
		$this->table = 'categories';
	}
	
	function get_categories_by_artid($artid) {
		$sql = "select t.* from #__categories t left join #__article_category at on at.category_id=t.id where at.article_id=$artid order by show_order";
		return $this->result_from_sql ( $sql );
	}
	
	function find_all_categories_by_ctype($ctype) {
		$this->db->orderby('show_order', 'asc');
		return $this->db->getwhere ($this->table, array('ctype' => $ctype))->result_array ();
	}
	
	function categories_with_articlenum() {
		$sql = "SELECT * FROM yuqi_categories cate LEFT JOIN (SELECT COUNT(category_id) num, category_id FROM #__article_category GROUP BY category_id) c ON c.category_id=cate.id order by show_order";
		$categories = $this->result_from_sql($sql);
		//未分类文章
		$sql = "SELECT COUNT(*) FROM #__articles WHERE id NOT IN (SELECT DISTINCT article_id FROM #__article_category)";
		$obj->id = 0;
		$obj->num = $this->getone($sql);
		$obj->name = '未分类';
		array_push($categories, $obj);
		return $categories;
	}
	
	function find_in_ids($ids_array) {
		$ids = implode(',', $ids_array);
		$sql = "select id, name from #__categories where id in ({$ids})";
		$res = $this->db->query($sql);
		$ret = array();
 		foreach ($res as $row) {
 			$ret[] = $row;
 		}
 		return $ret;
	}
}