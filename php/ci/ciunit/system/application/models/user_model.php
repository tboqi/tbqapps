<?php
class User_Model extends Model {
	
	function User_Model() {
		parent::Model();
	}
	
	function get_userid() {
		return 1;
	}
	
	function get_username() {
		return 'abc';
	}
}