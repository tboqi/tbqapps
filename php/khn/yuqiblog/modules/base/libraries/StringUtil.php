<?php

class StringUtil {
	
	function removeHtmltag($string) {
		return eregi_replace ( "<[^>]*>", "", $string );
	}
	
	/**
	 * 计算$key在$string 中出现的次数
	 *
	 * @param string $string
	 * @param string $key
	 * @return string
	 */
	function widget($string, $key) {
		return substr_count ( $string, $key );
	}
	
	/**  
	 *   截取中文部分字符串  
	 *  
	 *   截取指定字符串指定长度的函数,该函数可自动判定中英文,不会出现乱码  
	 *  
	 *   @access   public  
	 *   @param   string         $str         要处理的字符串  
	 *   @param   int               $strlen   要截取的长度默认为10  
	 *   @param   string         $other     是否要加上省略号,默认会加上  
	 *   @return   string  
	 */
	
	static function showtitle($str, $strlen = 26, $other = true) {
		$j = 0;
		for($i = 0; $i < $strlen; $i ++)
			if (ord ( substr ( $str, $i, 1 ) ) > 0xa0)
				$j ++;
			if ($j % 2 != 0)
				$strlen ++;
			$rstr = substr ( $str, 0, $strlen );
			if (strlen ( $str ) > $strlen && $other) {
				$rstr .= '...';
		}
		return $rstr;
	}
}

?>