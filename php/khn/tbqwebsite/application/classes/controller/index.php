<?php
class Controller_Index extends Controller_Template {
	
	function action_index() {
		$this->template->content = '';
		$this->sub_title = '首页';
	}
	
	function before() {
		parent::before();
	}
}