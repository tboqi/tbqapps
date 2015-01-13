<?php
class User_Controller extends Permission_Space_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function avatar() {
		$msg = '';
		if (! empty ( $_FILES )) {
			$files = Validation::factory ( $_FILES )->add_rules ( 'avatar', 'upload::valid', 'upload::required', 'upload::type[gif,jpg,png]', 'upload::size[3M]' );
			if ($files->validate ()) {
				// 暂存文件
				$filename = upload::save ( 'avatar', NULL, DOCROOT . 'upload/' . $this->logged_user->id . '/avatar' );
				$this->logged_user->avatar = basename($filename);
				$this->logged_user->save();
				$msg = '上传成功';
			} else {
				$msg = '上传失败';
			}
		}
		$content = new View ( 'user/appspace_upload_avatar' );
		$content->msg = $msg;
		$this->_render ( $content );
	}
	
	function editpassword() {
		$msg = '';
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$salt = Auth::instance()->find_salt ( $this->logged_user->password );
			$password = Auth::instance()->hash_password ( $this->input->post('oldpassword'), $salt );
			if ($password == $this->logged_user->password) {
				if ($this->input->post('newpassword') == $this->input->post('password_confirm')) {
					$this->logged_user->password = $this->input->post('newpassword');
					$this->logged_user->save();
					url::redirect();
				} else {
					$msg = '两次密码输入不一致';
				}
			} else {
				$msg = '旧密码输入错误';
			}
		}
		$content = new View ( 'user/appspace_user_editpassword' );
		$content->msg = $msg;
		$this->_render ( $content );
	}
	
	function profile() {
		$msg = '';
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$nickname = $this->input->post('nickname');
			if ( empty( $nickname ) ) {
				$msg = '必须填写昵称';
			} else {
				$this->logged_user->nickname = $this->input->post('nickname');
				$this->logged_user->save();
				url::redirect();
			}
		}
		$content = new View ( 'user/appspace_user_profile' );
		$content->msg = $msg;
		$this->_render ( $content );
	}
}