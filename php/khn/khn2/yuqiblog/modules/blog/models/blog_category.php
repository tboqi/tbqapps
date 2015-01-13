<?php

class Blog_Category_Model extends Category_Model {
	
	/**
	 * 
	 */
	function __construct() {
		parent::__construct ();
	
	}
	
	function insert_user_category($user_id, $category_id) {
		$array = array ('user_id' => $user_id, 'category_id' => $category_id );
		if (! $this->existed ( $array, 'user_category' )) {
			return $this->create ( $array, 'user_category' );
		}
		return FALSE;
	}
	
	function find_categories($user_id) {
		$sql = "select c.id, c.name from #__categories c
		left join #__user_category uc on uc.category_id=c.id
		where uc.user_id=?";
		$query = $this->db->query ( $sql, array ($user_id ) );
		return $query->result_array ();
	}
	
	function categories_orderby_article_counts($num = 10) {
		$sql = "select c.id, c.name, ac.num 
		from #__categories c
		left join (select count(*) as num, category_id from #__article_categories group by category_id) ac on ac.category_id=c.id
		order by ac.num desc
		limit {$num}";
		return $this->result_from_sql($sql);
	}
	
	function delete($category_id, $user_id) {
		$sql = "delete from #__user_category where category_id=? and user_id=?";
		return $this->db->query ( $sql, array ($category_id, $user_id ) );
	}
}