<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class User_Model extends Auth_User_Model {
	
	// This class can be replaced or extended
	function get($user_id) {
		$object = ORM::factory ( 'user' );
		$object->find ( $user_id );
		return $object;
	}

} // End User Model