<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class User_Controller extends Template_Controller {
	
	function __construct() {
		parent::__construct();
	}
	
	public function login() {
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			// Load the user
			$user = ORM::factory ( 'user', $this->input->post ( 'username' ) );
			
			if (Auth::instance ()->login ( $user, $this->input->post ( 'password' ), TRUE )) {
				$url = $this->input->post('url');
				$url = !empty($url) ? $url : url::site();
				if (strpos($url, 'user/login' ) > 0 ) {
					if (Auth::instance()->logged_in('ADMIN')) {
						url::redirect_admin();
					}
					url::redirect();
				} 
				
				header ( "location:{$url}" );
				exit ();
			} else {
				url::redirect();
			}
		}
		
		if (Auth::instance ()->logged_in ()) {
			Auth::instance ()->logout ( TRUE );
		}
		
		$this->set_page_title('登录');
		$this->initContent('user_login', array('url' =>isset ( $_SERVER ['HTTP_REFERER'] ) ? $_SERVER ['HTTP_REFERER'] : url::base ()));
	}
	
	public function logout() {
		// Force a complete logout
		Auth::instance ()->logout ( TRUE );
		// Redirect back to the login page
		url::redirect ();
	}
} 