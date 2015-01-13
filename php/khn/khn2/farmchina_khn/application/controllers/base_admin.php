<?php
defined ( 'SYSPATH' ) or die ( 'No direct access allowed.' );

abstract class Base_Admin_Controller extends Controller {
	protected $admin = null;
	
	public function __construct() {
		parent::__construct ();
		
		$adminUserID = intval ( $this->session->get ( 'adminUserID' ) );
		if ($adminUserID >= 1) {
			$this->admin = $this->MUser->get ( $adminUserID );
			$this->data ['admin'] = $this->admin;
		}
		
		if ($this->auto_render == TRUE) {
			// Render the template immediately after the controller method
			Event::add ( 'system.post_controller', array ($this, '_render' ) );
		}
	}
	
	protected function checkAdmin() {
		if (intval ( $this->session->get ( 'adminUserID' ) ) < 1) {
			$this->setMessage ( "您没有登录" );
			url::redirect ( "admin/user/login" );
			exit ();
		}
	}
	
	protected function runAdmin($page) {
		$this->template = new View ( 'admin/' . $page );
		$this->dataToTemplate ();
	}
}