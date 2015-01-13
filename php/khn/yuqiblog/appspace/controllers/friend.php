<?php
class Friend_Controller extends Permission_Space_Template_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function index() {
		$this->flist();
	}
	
	function flist() {
		$friend_model = new Friend_Model();
		$view = new View('friend/list');
		$view->friends = $friend_model->my_friends($this->logged_user->id);
		$this->_render($view);
	}
	
	function request($friend_id) {
		$friend_model = new Friend_Model();
		$friend_model->request($this->logged_user->id, $friend_id);
	}
	
	function accept($id) {
		$friend_model = new Friend_Model();
		$friend_model->accept($id);
		url::redirect();
	}
}