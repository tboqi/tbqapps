<?php
class Resource {
	
	static public function css($filename) 
	{
		return URL::base() . "static/admin/css/{$filename}";
	}
	
	static function js($filename) {
		return URL::base() . "static/admin/js/{$filename}";
	}

	static function image($filename) {
		return URL::base() . "static/admin/images/{$filename}";
	}

	static function js_common($filename) {
		return URL::base() . "static/js/{$filename}";
	}
}
