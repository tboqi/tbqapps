<?php
class Helper_View {
	
	static function create_view($filename) {
		$theme = Kohana::$config->load('site.theme');
		return View::factory($theme . '/' . $filename);
	}
}