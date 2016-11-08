<?php
class Model_Article_Tab extends Model_Base {
	
	function __construct() {
		$this->table = 'article_tabs';
	}
	
	function get_tab_id($tabname) {
		$tab_id = DB::select()->from($this->table)->where('tab', '=', $tabname)
		->execute()->get('id', 0);
		if ($tab_id > 0) {
			return $tab_id;
		} else {
			$insert = DB::insert($this->table)->columns(array('tab'))
			->values(array($tabname));
			
			list($insert_id, $affected_rows) = $insert->execute();
			return $insert_id;
		}
	}
}
