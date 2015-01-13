<?php
class Album_Model extends Base_Model {
	function __construct() {
		parent::__construct();
		$this->table = 'album';
	}
	
	function albums_by_user_id($user_id) {
		return $this->db->getwhere($this->table, array('user_id' => $user_id));
	}
}