<?php

class Welcome_Controller extends Space_Template_Controller {
	
	public function index() {
		if ($this->blog_model->is_existed ( 'creator_id', $this->space_owner->id ) || $this->space_owner->id != $this->logged_user->id) {
			$content = blog_article_block::article_list ( 0, $this->space_owner->id );
		} else {
			$content = blog_block::setting ( $this->space_owner->id );
			$this->init ( new Space ( ) );
		}
		
		$this->_render ( $content );
	}
} 