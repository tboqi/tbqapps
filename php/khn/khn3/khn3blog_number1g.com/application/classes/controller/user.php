<?php defined('SYSPATH') or die('No direct script access.');

class Controller_User extends Controller_Template {
	
	public function action_index()
	{
		$this->response->body('hello, world!');
	}
	
	public function action_login()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$username = trim($_POST['username']);
			$password = trim($_POST['password']);
			
			$post = Validation::factory($_POST)
			->rule('username', 'not_empty')
			->rule('password', 'not_empty')
			->rule('username', 'Checker::login', array($username, $password));
			
			$result = array();
			
			if ($post->check()) {
				$result['status'] = 1;
				$result['url'] = URL::base();
				//写入cookie
				$this->remember_login($username, $password);
			} else {
				$result['status'] = 0;
				$result['errors'] = $post->errors('error_msg');
			}
			
			$this->auto_render = false;
			echo json_encode($result);
		} else {
			$content = Helper_View::create_view('user_login');
			$content->url = '';
			$this->template->content = $content;
			$this->sub_title = '登录';
		}
	}
	
	public function action_logout()
	{
		Auth::instance ()->logout ();
		$this->auth_destroy();
		// $this->auth_destroy();
		header('location:'. URL::base());
		exit;
	}

} // End User
