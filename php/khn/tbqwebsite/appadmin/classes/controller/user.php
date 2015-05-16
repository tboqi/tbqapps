<?php
class Controller_User extends Controller_Template {
	
	function before() {
		$this->auto_render = false;
		parent::before();
	}
	
	function action_login() {
		$this->response->body(View::factory('user/login'));
	}
	
	function action_login_do() {
		$username = trim($_POST['username']);
		$password = trim($_POST['password']);
		
		$post = Validation::factory($_POST)
		->rule('username', 'not_empty')
		->rule('password', 'not_empty')
		->rule('username', 'Checker::login', array($username, $password));
		
		$result = array();
		
		if ($post->check()) {
			$result['status'] = 1;
			$result['url'] = URL::site();
			//写入cookie
			$this->remember_login($username, $password);
		} else {
			$result['status'] = 0;
			$result['errors'] = $post->errors('error_msg');
		}
		
		$this->auto_render = false;
		echo json_encode($result);
	}
	public function action_logout() {
		Auth::instance ()->logout ();
		$this->auth_destroy ();
		header ( 'location:' . URL::base () );
		exit ();
	}
}