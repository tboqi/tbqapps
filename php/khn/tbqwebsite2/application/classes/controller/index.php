<?php
class Controller_Index extends Controller_Template {
	
	function action_index_bak() {
		$this->template->content = '';
		$this->sub_title = '首页';
	}
	
	function action_index() {
		$content = Helper_View::create_view('test');
		$content->render();
	}
}