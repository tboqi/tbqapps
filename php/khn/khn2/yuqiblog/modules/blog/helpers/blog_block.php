<?php
class blog_block_Core {
	
	static function setting($user_id) {
		$view = new View ( 'blog/blocks/appspace_setting' );
		$blog_model = new Blog_Model ( );
		$view->space = $blog_model->get_by ( array ('creator_id' => $user_id ) );
		
		$dir = APPPATH . 'views';
		$themes = array();
		if ($handle = opendir ( $dir )) {
			while ( false !== ($file = readdir ( $handle )) ) {
				if ($file != "." && $file != ".." && $file != ".svn") {
					$themes[] = $file;
				}
			}
			closedir ( $handle );
		}
		
		$view->themes = $themes;
		
		return $view;
	}
}