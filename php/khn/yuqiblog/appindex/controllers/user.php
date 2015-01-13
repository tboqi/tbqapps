<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

class User_Controller extends Template_Controller {
	
	public function index() {
		$this->regist ();
	}
	
	public function regist() {
		if ($_SERVER ['REQUEST_METHOD'] == 'POST') {
			$post = new Validation ( $_POST );
			$post->pre_filter ( 'trim', TRUE );
			$post->add_rules ( 'username', 'required', 'length[2,10]', 'alpha_numeric' );
			$post->add_rules ( 'nickname', 'required' );
			$post->add_rules ( 'password', 'required', 'length[2,10]', 'alpha_dash' );
			$post->add_rules ( 'password2', 'required', 'matches[password]' );
			$post->add_rules ( 'email', 'required', 'email' );
			$post->add_callbacks ( 'username', array ($this, 'username_is_existed' ) );
			$post->add_callbacks ( 'email', array ($this, 'email_is_existed' ) );
			
			$user = ORM::factory ( 'user' );
			if ($post->validate ()) {
				// 把表单的字段赋值给 $user 的属性
				foreach ( $_POST as $key => $val ) {
					if ($key == 'password2') {
						$user->password_confirm = $val;
						continue;
					}
					$user->$key = $val;
				}
				$user->regist_time = time();
				if ($user->add ( ORM::factory ( 'role', 'REGISTER' ) ) and $user->save ()) {
					Auth::instance ()->login ( $_POST ['username'], $_POST ['password'], TRUE );
					
					printf ( '{status: %d, url: "%s"}', 1, url::site () );
					exit ();
				}
			} else {
				$errors = array ('username' => '', 'nickname' => '', 'password' => '', 'password2' => '', 'email' => '' );
				$errors = arr::overwrite ( $errors, $post->errors ( 'user_regist_errors' ) );
				$errors = json_encode ( $errors );
				printf ( '{status: %d, errors: %s}', 0, $errors );
				exit ();
			}
		}
		$content = new View ( 'user/appindex_regist' );
		$this->set_description ( 'regist' );
		$this->set_keywords ( 'regist' );
		$this->set_page_title ( 'regist' );
		$this->_render ( $content );
	}
	
	function username_is_existed($post) {
		if (array_key_exists ( 'username', $post->errors () ))
			return;
		
		$user = ORM::factory ( 'user', $post->username );
		if ($user->id > 0) {
			$post->add_error ( 'username', 'username_is_existed' );
		}
	}
	
	function email_is_existed($post) {
		if (array_key_exists ( 'email', $post->errors () ))
			return;
		
		$user = ORM::factory ( 'user', $post->email );
		if ($user->id > 0) {
			$post->add_error ( 'email', 'email_is_existed' );
		}
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
		$this->set_description('登录');
		$this->set_keywords('登录');
		$content = new View ( 'user/appindex_login' );
		$content->url = isset ( $_SERVER ['HTTP_REFERER'] ) ? $_SERVER ['HTTP_REFERER'] : url::base ();
		$this->_render($content);
	}
	
	public function logout() {
		// Force a complete logout
		Auth::instance ()->logout ( TRUE );
		// Redirect back to the login page
		url::redirect ();
	}
} 