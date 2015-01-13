<?php
class Auth extends Auth_Core {
	public static function factory($config = array()) {
		return new Auth ( $config );
	}
	
	/**
	 * Return a static instance of Auth.
	 *
	 * @return  object
	 */
	public static function instance($config = array()) {
		static $instance;
		
		// Load the Auth instance
		empty ( $instance ) and $instance = new Auth ( $config );
		
		return $instance;
	}
	
	/**
	 * Loads Session and configuration options.
	 *
	 * @return  void
	 */
	public function __construct($config = array()) {
		parent::__construct ( $config );
	}
	
	/**
	 * Log out a user by removing the related session variables.
	 *
	 * @param   boolean  completely destroy the session
	 * @return  boolean
	 */
	function logout($destroy = FALSE) {
		$user = parent::get_user ();
		$user->session_id = '';
		$user->save ();
		// Force a complete logout
		parent::logout ( $destroy );
	}
	
	/**
	 * Attempt to log in a user by using an ORM object and plain-text password.
	 *
	 * @param   string   username to log in
	 * @param   string   password to check against
	 * @param   boolean  enable auto-login
	 * @return  boolean
	 */
	public function login($username, $password, $remember = FALSE) {
		if (parent::login ( $username, $password, $remember )) {
			$user = parent::get_user ();
			$user->session_id = Session::instance ()->id ();
			$user->save ();
			return TRUE;
		} else {
			return false;
		}
	}
	
	/**
	 * Attempt to automatically log a user in.
	 *
	 * @return  boolean
	 */
	public function auto_login() {
		$b = parent::auto_login ();
		if ($b) {
			$user = parent::get_user ();
			$user->session_id = Session::instance ()->id ();
			$user->save ();
		}
		return $b;
	}
}