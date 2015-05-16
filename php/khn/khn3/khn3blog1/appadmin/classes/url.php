<?php defined('SYSPATH') or die('No direct script access.');

class URL extends Kohana_URL {
	
	public static function site_common($uri = '', $protocol = NULL, $index = TRUE)
	{
		$url = self::site($uri, $protocol, $index);
		return str_replace('/admin/', '/', $url);
	}
}