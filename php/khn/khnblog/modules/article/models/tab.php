<?php
class Tab_Model extends Base_Model {
	
	function __construct() {
		parent::__construct();
		$this->table = 'tabs';
	}

	function get_tabs_by_artid($artid) {
		$sql = "select t.* from #__tabs t
		        left join #__article_tab at on at.tab_id=t.id
		        where at.article_id=$artid";
		return $this->result_from_sql ( $sql );
	}
}