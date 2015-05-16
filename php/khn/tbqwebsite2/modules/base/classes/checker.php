<?php
class Checker {
	
	static function login($username, $password) {
		$auth = Auth::instance ();
		if ($auth->login ( $username, $password, TRUE )) {
			return true;
		}
		return false;
	}
}