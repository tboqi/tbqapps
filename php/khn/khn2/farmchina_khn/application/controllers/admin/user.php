<?php
class User_Controller extends Base_Admin_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function index() {
	}
	
	function login() {
		$flag = $this->post ( "flag" );
		
		if ($flag == "do") {
			$post = new Validation ( $_POST );
			$username = $this->clean ( $this->post ( 'username' ) );
			$password = $this->clean ( $this->post ( 'password' ) );
			$post->add_rules ( 'username', 'required', 'length[5,30]', 'alpha_numeric' );
			$post->add_callbacks ( 'username', array ($this, '_username_is_exist' ) );
			$post->add_rules ( 'password', 'required' );
			$post->add_callbacks ( 'password', array ($this, '_password_is_error' ) );
			
			if ($post->validate ()) {
				$this->userLogin ( $username, $password );
				url::redirect ( "admin" );
			} else {
				$this->setData ( 'errors', $post->errors ( 'login_form' ) );
				$this->setData ( "username", $username );
				$this->setData ( "password", $password );
			}
		}
		
		$this->runAdmin ( 'user/login' );
	}
	
	public function _username_is_exist(Validation $array, $field) {
		$a = array ('username' => $array [$field], 'type_code' => 'admin' );
		if (! $this->MUser->isExist ( $a )) {
			$array->add_error ( $field, 'user_is_not_exist' );
		}
	}
	
	public function _password_is_error(Validation $array, $field) {
		$user = $this->MUser->userLogin ( $array ['username'], $array ['password'] );
		if ($user == false) {
			$array->add_error ( $field, 'password_is_error' );
		}
	}
	
	function userLogin($username, $password) {
		$currentUser = $this->MUser->userLogin ( $username, $password );
		if ($currentUser && is_object ( $currentUser ) && $currentUser->type_code) {
			$array = array ('adminUserID' => $currentUser->id );
			$this->session->set ( $array );
			$this->admin = $this->MUser->get ( $currentUser->id );
			$this->setData ( "admin", $this->admin );
		} else {
			$message = "用户名或密码错误";
			$this->setData ( "message", $message );
		}
	}
	
	function logout() {
		$this->session->delete ( 'adminUserID' );
		url::redirect ( "admin/user/login" );
	}
	
	function editPassword() {
		$this->checkAdmin ();
		$this->setData ( "pageTitle", "编辑密码" );
		
		if ($this->post ( "flag" ) == "do") {
			$post = new Validation ( $_POST );
			$post->pre_filter ( 'trim', TRUE );
			$post->add_rules ( 'oldpassword', 'required' );
			$post->add_callbacks ( 'oldpassword', array ($this, '_oldpassword_error' ) );
			$post->add_rules ( 'newpassword', 'required', 'length[5,30]', 'alpha_numeric', 'matches[passwordconfirm]' );
            
			if ($post->validate () ) {
				$newpassword = $this->clean ( $this->post ( "newpassword" ) );
				$passwordconfirm = $this->clean ( $this->post ( "passwordconfirm" ) );
				if ($newpassword == $passwordconfirm) {
					$this->admin->password = md5 ( $newpassword );
					$this->MUser->update ( $this->admin );
					$this->message ( "密码修改成功", url::site ( "admin/welcome/main" ) );
				}
			} else {
				$this->setData ( 'errors', $post->errors ( 'edit_password_admin' ) );
				$this->runAdmin ( "user/editPassword" );
			}
		} else {
			$this->runAdmin ( "user/editPassword" );
		}
	}
	
	function _oldpassword_error($array, $field) {
		if (md5 ( $array[$field] ) != $this->admin->password) {
			$array->add_error ( $field, 'oldpassword_error' );
		}
	}
}