<?php
class blog_link_block_Core {
	
	static function blog_links($user_id) {
		$link_model = new Link_Model();
		$view = new View('blog/blocks/appspace_links');
		$view->links = $link_model->find_by(array('user_id' => $user_id));
		return $view;
	}
}