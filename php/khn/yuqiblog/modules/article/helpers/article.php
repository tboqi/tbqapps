<?php
defined ( 'SYSPATH' ) or die ( 'No direct script access.' );

class article_Core {
	
	public static function summary($content) {
		$content = strip_tags ( $content );
		return $content;
	}
}
 
