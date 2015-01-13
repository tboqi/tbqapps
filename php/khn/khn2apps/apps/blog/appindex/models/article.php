<?php
class Article_Model extends Base_Model {
	
	private $user_model;
	
	function __construct() {
		parent::__construct ();
		$this->table = 'articles';
		$this->user_model = new Userext_Model();
	}
	
	function find($results = 15, $startIndex = 0) {
		$results = intval($results);
		$startIndex = intval($startIndex);
		
		$this->db->limit($results, $startIndex);
		$query = $this->db->select($this->list_fields)->from($this->table)->orderby('id', 'DESC')->get();
		$array = $query->result_array();
		return $array;
	}
	
	function find_by_user_id($user_id, $results = 15, $startIndex = 0) {
		$user_id = intval($user_id);
		$results = intval($results);
		$startIndex = intval($startIndex);
		
		$this->db->limit($results, $startIndex);
		$query = $this->db->select($this->list_fields)->orderby('id', 'DESC')->getwhere($this->table, array('user_id' => $user_id));
		
		$array = $query->result_array();
		return $array;
	}
	
	function new_articles($num, $start = 0) {
		$query = $this->db->select($this->list_fields)->orderby ( array ('id' => 'desc' ) )->get ( $this->table, $num, $start );
		return $query->result_array ();
	}
	
	function read_times($id) {
		$id = intval($id);
		
		$sql = "update #__articles set read_times=read_times+1 where id={$id}";
		$this->db->query ( $sql );
	}
	
	function add_article_category($article_id, $category_ids) {
		if (empty($category_ids) || !is_array($category_ids)) {
			$this->db->update('articles', array('categories' => ''), array('id' => $article_id));
			return ;
		}
		
		$article_id = intval($article_id);
		
		$this->db->query('delete from #__article_category where article_id = ' . $article_id);
		foreach ( $category_ids as $cid ) {
			$cid = intval($cid);
			$this->create(array('article_id' => $article_id, 'category_id' => $cid), 'article_category');
		}
		$sql = 'select id, name from #__categories where id in (' . implode(',', $category_ids) . ')';
		$query = $this->db->query($sql);
		$array = $query->result();
		$cate_arr = array();
		foreach ($array as $row) {
			$cate_arr[] = $row;
		}
		$cate_json = json_encode($cate_arr);
		$this->db->update('articles', array('categories' => $cate_json), array('id' => $article_id));
	}
	/**
	 * 
	 * @param int $aid
	 * @param string $tabs
	 */
	function add_article_tab($aid, $tabs) {
		$aid = intval($aid);
		
		$this->db->query('delete from #__article_tab where article_id = ' . $aid);
		
		$tabs = trim ( $tabs );
		if (empty ( $tabs )) {
			$this->db->query("update #__articles set tabs='' where id = " . $aid);
			return;
		}
		
		$arr = array();
		
		$tab_array = explode ( ',', $tabs );
		foreach ( $tab_array as $tab ) {
			$tab = trim ( $tab );
			if (empty ( $tab )) {
				continue;
			}
			if (! ($this->existed ( array ('tab' => $tab ), 'tabs' ))) {
				$tab_id = $this->create ( array ('tab' => $tab ), 'tabs' );
			} else {
				$tab_id = $this->getone ( "select id from #__tabs where tab='{$tab}'" );
			}
			$sql = "insert into #__article_tab (article_id, tab_id) value ('{$aid}', {$tab_id})";
			$this->db->query ( $sql );
			$arr[] = array('id' => $tab_id, 'tab' => $tab);
		}
		$this->update(array('tabs' => json_encode($arr)), $aid);
	}
	
	function find_article_ids_by_category_id($category_id) {
		$category_id = intval ( $category_id );
		
		$key = hcache::parse_key('model', 'Article_Model', 'find_article_ids_by_category_id', $category_id );
		
		$article_ids = $this->cache->get ( $key );
		if (is_null($article_ids)) {
			$article_ids_array = $this->find_by(array('category_id' => $category_id), 'article_category');
			$article_ids = $split = '';
			foreach ($article_ids_array as $value) {
				$article_ids .= $split . $value->article_id;
				$split = ',';
			}
			
			$this->cache->set ( $key, $article_ids );
		}
		
		return $article_ids;
	}
	
	function count_by_category_id($category_id) {
		$category_id = intval ( $category_id );
		
		if ($category_id > 0) {
			$sql = "SELECT count(*) FROM #__articles WHERE id IN (" . $this->find_article_ids_by_category_id($category_id) . ")";
		} else {
			$sql = "SELECT count(*) FROM #__articles WHERE id NOT IN (SELECT DISTINCT article_id FROM #__article_category)";
			return $this->getone($sql);
		}
	}
	
	function find_by_category_id($category_id, $results = 15, $startIndex = 0) {
		$category_id = intval ( $category_id );
		$results = intval ( $results );
		$startIndex = intval ( $startIndex );
		
		if ($category_id > 0) {
			$sql = "select {$this->list_fields} FROM #__articles WHERE id IN (" . $this->find_article_ids_by_category_id($category_id) . ")";
		} else {
			$sql = "SELECT {$this->list_fields} FROM #__articles WHERE id NOT IN (SELECT DISTINCT article_id FROM #__article_category)";
		}
		$sql .= " order by id desc limit {$startIndex}, {$results}";
		$array = $this->result_from_sql ( $sql );
		return $array;
	}
	
	function find_article_ids_by_tabid($tabid) {
		$tabid = intval ( $tabid );
		
		$key = hcache::parse_key('model', 'Article_Model', 'find_article_ids_by_tabid', $tabid );
		
		$article_ids = $this->cache->get ( $key );
		if (is_null($article_ids)) {
			$article_ids_array = $this->find_by(array('tab_id' => $tabid), 'article_tab');
			$article_ids = $split = '';
			foreach ($article_ids_array as $value) {
				$article_ids .= $split . $value->article_id;
				$split = ',';
			}
			
			$this->cache->set ( $key, $article_ids );
		}
		
		return $article_ids;
	}
	
	function count_by_tabid($tabid) {
		$tabid = intval ( $tabid );
		
		$sql = "select count(*) from #__articles where id in (" . $this->find_article_ids_by_tabid ( $tabid ) . ")";
		return $this->getone ( $sql );
	}

	function find_by_tabid($tabid, $results = 15, $startIndex = 0) {
		$tabid = intval ( $tabid );
		
		$sql = "select {$this->list_fields} from #__articles where id in (" . $this->find_article_ids_by_tabid ( $tabid ) . ")";
		$sql .= " order by id desc limit {$startIndex}, {$results}";
		$array = $this->result_from_sql ( $sql );
		
		return $array;
	}
	
	function find_rand($results = 15) {
		$results = intval($results);
		
		$this->db->limit($results);
		$query = $this->db->select($this->list_fields)->from($this->table)->orderby(NULL, 'RAND()')->get();
		$array = $query->result_array();
		return $array;
	}
	
	function count_by_searchkey ( $key ) {
//		$key = $this->db->escape($key);
		$sql = "select count(*) from #__articles where title like '%{$key}%' or content like '%{$key}%' or summary like '%{$key}%'";
		return $this->getone ( $sql );
	}
	
	function find_by_searchkey ( $key, $results = 15, $startIndex = 0 ) {
//		$key = $this->db->escape($key);
		
		$sql = "select {$this->list_fields} from #__articles where title like '%{$key}%' or content like '%{$key}%' or summary like '%{$key}%'";
		$sql .= " order by id desc limit {$startIndex}, {$results}";
		$array = $this->result_from_sql ( $sql );
		
		return $array;
	}
	
	function find_relative($article_id, $results = 10) {
		$results = intval($results);
		
		$sql = "select {$this->list_fields} from #__articles where id in (select distinct article_id from #__article_tab where tab_id in (select tab_id from #__article_tab where article_id={$article_id}) and article_id<>{$article_id}) order by id desc limit {$results}";
		
		$query = $this->db->query($sql);
		$array = $query->result_array();
		return $array;
	}
	
	function find_start_id($start_id = 0) {
		$sql = "select {$this->list_fields} from #__articles where id > $start_id order by id limit 20";
		return $this->db->query($sql)->result_array();
	}
	
	function update_categories_by_ids($ids) {
		$ids = implode(',', $ids);
		$this->db->query("update #__articles set categories='' where id in ({$ids})");
	}
}