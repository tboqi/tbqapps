<?php
class User_Controller extends Admin_Template_Controller {
	function __construct() {
		parent::__construct ();
	}
	
	function search($p = 1) {
		$limit = 3;
		$offset = 0;
		
		if ($p < 1) {
			$p = 1;
		}
		
		if ( ! $this->input->get('key') ) {
			$users = user::find_all($offset, $limit);
			$num_rows = user::count_all();
		} else {
			$users = user::search($this->input->get('key'), $offset, $limit );
			$num_rows = user::count_search($this->input->get('key'));
		}
		$pagination = new Pagination(array(
		    'base_url'    		=> 'user/search',
		    'total_items'    	=> $num_rows,
		    'items_per_page' 	=> $limit,
				'uri_segment'			=> 3,
		    'style'          	=> 'digg'
		));
		$this->data['users'] = $users;
		$this->data['pagination'] = $pagination;
		$this->dataToTemplate();
		$this->runAdmin('user/appadmin_search');
	}
}