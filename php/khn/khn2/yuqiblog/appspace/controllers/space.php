<?php
class Space_Controller extends Permission_Space_Template_Controller {
	
	function __construct() {
		parent::__construct ();
	}
	
	function setting() {
		if ($_SERVER ['REQUEST_METHOD'] == 'POST') {
			$array = array (
				'creator_id' => $this->logged_user->id, 
				'name' => $this->input->post ( 'name' ), 
				'theme' => $this->input->post ( 'theme' ), 
				'slogan' => $this->input->post ( 'slogan' ), 
				'keywords' => $this->input->post ( 'keywords' ), 
				'description' => $this->input->post ( 'description' ) 
			);
			$space = $this->blog_model->get_by ( array ('creator_id' => $this->logged_user->id ) );
			if (empty ( $space )) {
				$b = $this->blog_model->create ( $array );
			} else {
				$b = $this->blog_model->update ( $array, $space->id );
			}
			if ($b) {
				url::redirect ( '', '300' );
			}
		}
		$content = blog_block::setting ( $this->logged_user->id );
		$this->_render ( $content );
	}
}