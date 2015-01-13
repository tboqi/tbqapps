<?php
class Category_Controller extends Space_Template_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function manage() {
		$view = new View ( 'blog/appspace_category_manage' );
		$cate_model = new Blog_Category_Model ( );
		$view->categories = $cate_model->find_categories ( $this->logged_user->id );
		$this->_render ( $view );
	}
	
	function add() {
		$view = new View ( 'blog/appspace_category_form' );
		$view->title = '新建分类';
		$this->_render ( $view );
	}
	
	function save() {
		$post = new Validation ( $_POST );
		$post->pre_filter ( 'trim', TRUE );
		$post->add_rules ( 'category_name', 'required', 'length[2,10]' );
		
		// 如果通过规则检测
		if ($post->validate ()) {
			$array = array ('name' => $this->input->post ( 'category_name' ) );
			$cate_model = new Blog_Category_Model ( );
			if ($cate_model->is_existed ( 'name', $this->input->post ( 'category_name' ) )) {
				$cate = $cate_model->get_by ( $array );
				$cate_model->insert_user_category ( $this->logged_user->id, $cate->id );
			} else {
				$cate_id = $cate_model->create ( $array );
				$cate_model->insert_user_category ( $this->logged_user->id, $cate_id );
			}
			echo sprintf ( '{status: %d, url: "%s"}', 1, url::site ( 'category/manage' ) );
			exit ();
		} else {
			$errors = array ('category_name' => '' );
			$errors = arr::overwrite ( $errors, $post->errors ( 'category_form_errors' ) );
			$errors = json_encode ( $errors );
			echo sprintf ( '{status: %d, errors: %s}', 0, $errors );
			exit ();
		}
	}
	
	function delete($id) {
		$cate_model = new Blog_Category_Model ( );
		$cate_model->delete ( $id, $this->logged_user->id );
		url::redirect ( url::site ( 'category/manage' ) );
	}
}