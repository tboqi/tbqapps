<?php
class User_Controller extends Admin_Template_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function editPassword() {
		if ($_SERVER['REQUEST_METHOD']== 'POST') {
			$post = new Validation ( $_POST );
			$post->pre_filter ( 'trim', TRUE );
			$post->add_rules ( 'newPass', 'required', 'length[5,30]' );
			$post->add_rules('newPass2', 'matches[newPass]');
			
			if ($post->validate ()) {
				$newPass = $this->input->xss_clean($this->input->post ( 'newPass' ));
				$current_user = Auth::instance ()->get_user ();
				$current_user->password = $newPass;
				$current_user->save ();
				echo sprintf ( '{status: %d, url: "%s"}', 1, url::site('admin/user/editPassword') );
				exit ();
			} else {
				$errors = array ('newPass' => '', 'newPass2' => '' );
				$errors = arr::overwrite ( $errors, $post->errors ( 'editPass_form_errors' ) );
				$errors = json_encode ( $errors );
				echo sprintf ( '{status: %d, errors: %s}', 0, $errors );
				exit ();
			}
		}
		$this->set_page_title('修改密码');
		$this->initContent('admin/user/edit_password', array('title' => '修改密码'));
	}
}