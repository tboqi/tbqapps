<?php
abstract class Admin_Template_Controller extends Controller {
	private $template;
	protected $data = array ();
	
	function __construct() {
		parent::__construct ();
		$this->checkAdmin ();
		$this->template = new View ( 'template' );
	}
	
	protected function render($title, $content) {
		$this->template->title = $title;
		$content->title = $title;
		$this->template->content = $content;
		$this->template->render ( TRUE );
	}
	
	protected function checkAdmin() {
		if (! Auth::instance ()->logged_in ( 'ADMIN' )) {
			//			$this->setMessage ( "您没有登录" );
			url::redirect_index ( "user/login" );
			exit ();
		}
	}
	
	protected function runAdmin($page) {
		$this->template = new View ( $page );
		$this->dataToTemplate ();
		$this->template->render ( TRUE );
	}
	
	protected function dataToTemplate() {
		foreach ( $this->data as $key => $value ) {
			$this->template->$key = $value;
		}
	}
}