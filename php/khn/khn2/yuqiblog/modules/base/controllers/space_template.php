<?php
class Space_Template_Controller extends Template_Controller {
	
	protected $theme = '';
	
	protected $blog_model;
	
	protected $space_owner;
	
	function __construct() {
		$this->blog_model = new Blog_Model ( );
		if (isset($_GET['user_id']) && intval($_GET['user_id']) > 0) {
			$space = $this->blog_model->get_by ( array ('creator_id' => intval($_GET['user_id']) ) );
			$this->space_owner = ORM::factory('user', intval($_GET['user_id']));
		} elseif (Auth::instance ()->logged_in () || Auth::instance ()->auto_login()) {
			$this->space_owner = $this->logged_user = Auth::instance ()->get_user ();
			$space = $this->blog_model->get_by ( array ('creator_id' => $this->logged_user->id ) );
		} else {
			url::redirect_index();
		}
		if (empty($space)) {
			$space = new Space();
		}
		$this->theme = $space->theme;
		parent::__construct ();
		
		$this->init ( $space );
		
		$this->template_file = $this->theme . '/template';
		
		$this->template->theme = $space->theme;
		$this->template->space = $space;
		$this->template->space_owner = $this->space_owner;
	}
	
	public function run_before_view() {
		Session::instance()->set('current_space_theme', $this->theme);
	}
	
	protected function init($object) {
		if (empty ( $object )) {
			$object = new Space ( );
		}
		$this->set_page_title ( $object->name );
		$this->set_keywords ( $object->keywords );
		$this->set_description ( $object->description );
		$this->set_slogan ( $object->slogan );
	}
}