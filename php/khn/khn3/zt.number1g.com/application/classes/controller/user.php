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
			
			$auth = Auth::instance ();
			
			$url = URL::base();
			if ($auth->login ( $username, $password, TRUE )) {
				$url = $_POST['url'];
				$url = !empty($url) ? $url : URL::base();
				//写入cookie
				$this->remember_login($username, $password);
			}
			header('location:'. $url);
			exit;
		}
		
		$content = View::factory('user_login');
		$content->url = '';
		$this->template->content = $content;
		$this->sub_title = '登录';
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
