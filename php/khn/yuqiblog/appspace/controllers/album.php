<?php
class Album_Controller extends Space_Template_Controller {
	function __construct() {
		parent::__construct();
	}
	
	function create() {
		if ($_POST) {
			$album_model = new Album_Model();
			$array = array(
				'name' => $this->input->post('name'), 
				'description' => $this->input->post('description'),
				'user_id' => $this->logged_user->id,
			);
			$album_model->create($array);
			url::redirect('album');
		}
		$this->_render(new View('gallery/create_album'));
	}
	
	function index() {
		$this->myalbums();
	}
	
	function myalbums($p = 1) {
		$p = intval($p);
		if ($p < 1) {
			$p = 1;
		}
		$num = 10;
		
		$album_model = new Album_Model();
		$myalbums_count = $album_model->count_by_user_id($this->logged_user->id);
		$myalbums = $album_model->result_by_user_id($this->logged_user->id, $p, $num);
		$view = new View('gallery/albums');
		$view->albums = $myalbums;
		$this->_render($view);
	}
}