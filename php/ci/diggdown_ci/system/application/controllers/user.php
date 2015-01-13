<?php
class User extends MY_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
		$this->regist ();
	}
	/*
	 * 验证
	 * 判断是否存在
	 * 注册
	 */
	function regist() {
		$this->setData ( "pageTitle", "注册" );
		if ($this->post ( "flag" ) == "do") {
			$rules ['username'] = "trim|required|min_length[4]|max_length[15]|callback_userExist";
			$rules ['nickname'] = "trim|required";
			$rules ['password'] = "trim|required|min_length[4]|max_length[15]|matches[passwd2]";
			$rules ['passwd2'] = "trim|required";
			$rules ['email'] = "trim|required|valid_email|callback_emailExist";
			$this->validation->set_rules ( $rules );
			
			$fields ['username'] = '用户名';
			$fields ['nickname'] = '妮称';
			$fields ['password'] = '密码';
			$fields ['passwd2'] = '密码确认';
			$fields ['email'] = '邮箱';
			$this->validation->set_fields ( $fields );
			
			if ($this->validation->run () != FALSE) {
				$user ['username'] = $this->clean ( $this->post ( "username" ) );
				$user ['nickname'] = $this->clean ( $this->post ( "nickname" ) );
				$user ['password'] = $this->clean ( $this->post ( "password" ) );
				$user ['email'] = $this->clean ( $this->post ( "email" ) );
				$passwordconfirm = $this->clean ( $this->post ( "passwd2" ) );
				if ($user ['password'] == $passwordconfirm) {
					$user ['password'] = md5 ( $user ['password'] );
					$user ['create_time'] = time ();
					$this->MUser->insert ( $user );
					$this->message ( "注册成功，请登录", site_url () );
				}
			}
		}
		$this->run ( 'user/regist' );
	}
	
	function doLogin() {
		$rules ['username'] = "required|callback_loginerror";
		$rules ['password'] = "required";
		$this->validation->set_rules ( $rules );
		if ($this->validation->run () == FALSE) {
			$this->run ( 'user/login', FALSE );
		} else {
			$username = $this->clean ( $this->post ( 'username' ) );
			$password = $this->clean ( $this->post ( 'password' ) );
			$this->userLogin ( $username, $password );
			$this->run ( 'user/userMenu', FALSE );
		}
	}
	
	function logout() {
		$this->session->unset_userdata ( 'userid' );
		delete_cookie ( "userinfo" );
		redirect ();
	}
	
	function editPassword() {
		$this->checkUser ();
		$this->setData ( "pageTitle", "编辑密码" );
		
		if ($this->post ( "flag" ) == "do") {
			$rules ['oldpassword'] = "trim|required|xss_clean|callback_password_check";
			$rules ['newpassword'] = "trim|required|min_length[5]|max_length[12]|matches[passwordconfirm]|xss_clean";
			$rules ['passwordconfirm'] = "trim|required";
			$this->validation->set_rules ( $rules );
			
			$fields ['oldpassword'] = '旧密码';
			$fields ['newpassword'] = '新密码';
			$fields ['passwordconfirm'] = '密码确认';
			$this->validation->set_fields ( $fields );
			if ($this->validation->run () == FALSE) {
				$this->run ( "user/editPassword" );
			} else {
				//				$oldpassword = $this->clean ( $this->post ( "oldpassword" ) );
				$newpassword = $this->clean ( $this->post ( "newpassword" ) );
				$passwordconfirm = $this->clean ( $this->post ( "passwordconfirm" ) );
				if ($newpassword == $passwordconfirm) {
					$this->my->password = md5 ( $newpassword );
					$this->MUser->update ( $this->my );
					$this->message ( "密码修改成功", site_url () );
				}
			}
		} else {
			$this->run ( "user/editPassword" );
		}
	}
	
	function password_check($oldpassword) {
		if (md5 ( $oldpassword ) == $this->my->password) {
			return TRUE;
		} else {
			$this->validation->set_message ( 'password_check', '原来的密码输入错误' );
			return false;
		}
	}
	
	function userExist($username) {
		$array = array ('username' => $username );
		if ($this->MUser->isExist ( $array )) {
			$this->validation->set_message ( 'userExist', '用户已存在' );
			return FALSE;
		} else {
			return TRUE;
		}
	}
	
	function emailExist($email) {
		$array = array ('email' => $email );
		if ($this->MUser->isExist ( $array )) {
			$this->validation->set_message ( 'emailExist', 'Email已注册' );
			return FALSE;
		} else {
			return TRUE;
		}
	}
	
	function loginerror($username) {
		$password = md5 ( $this->post ( 'password' ) );
		$array = array ("password" => $password, "username" => $username );
		$user = $this->MUser->isExist ( $array );
		if ($user === FALSE) {
			$this->validation->set_message ( 'loginerror', '用户名或密码错误' );
			return FALSE;
		} else {
			return TRUE;
		}
	}
	
	function edit() {
		$this->checkUser ();
		$this->setData ( "pageTitle", "编辑信息" );
		if ($this->post ( "flag" ) == "do") {
			$user ['id'] = $this->my->id;
			$user ['nickname'] = $this->clean ( $this->post ( "nickname" ) );
			$this->MUser->update ( $user );
			redirect ();
		}
		$this->run ( "user/edit" );
	}
}