<?php
class Resource {
	
	static public function css($filename) 
	{
		return URL::base() . "static/css/{$filename}";
	}
	
	static function js($filename) {
		return URL::base() . "static/js/{$filename}";
	}
}
