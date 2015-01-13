<?php
class Permission_Space_Template_Controller extends Space_Template_Controller {
	
	function __construct() {
		parent::__construct ();
		
		if (! Auth::instance ()->logged_in ()) {
			url::redirect_index ( 'user/login' );
		}
	}
}