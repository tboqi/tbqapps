<?php
class Helper_View {
	
	static function create_view($filename) {
		return View::factory($filename);
	}
}