<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class Userext_Model extends Base_Model {
	
	function __construct() {
		parent::__construct();
	}
	
	// This class can be replaced or extended
	function get($user_id) {
		$user_id = intval($user_id);
		$key = hcache::parse_key('model', 'Userext_Model', 'get', $user_id);
		$object = $this->cache->get ( $key );
		if (is_null($object)) {
			$object = ORM::factory ( 'user' );
			$object->find ( $user_id );
			$this->cache->set ( $key, $object );
		}
		
		return $object;
	}

} // End User Model