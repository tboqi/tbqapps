<?php
class Category_Model extends Base_Model {
	
	function __construct() {
		parent::__construct ();
		$this->table = 'categories';
	}
	
	function find($results = 15, $startIndex = 0, $sort = 'id', $dir = 'asc') {
		$sql = "select id, title from #__categories order by {$sort} {$dir} 
	   limit {$startIndex}, {$results}";
		return $this->result_from_sql ( $sql );
	}
	
	function find_by_user($id) {
		$sql = "select c.id, c.name from #__categories c
		left join #__user_category uc on uc.category_id=c.id
		where uc.user_id=?";
		$query = $this->db->query($sql, array($id));
		return $query->result_array();
	}
	
	function delete_article_category($article_id) {
		return $this->db->delete('article_categories', array('article_id' => $article_id));
	}
}