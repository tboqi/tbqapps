<?php
class hcache_Core {
	/**
	 * 生成key
	 * @param string $type helper|model|block
	 * @param string $class_name
	 * @param string $function_name
	 * @param mix $vars
	 */
	static function parse_key($type, $class_name, $function_name, $vars = NULL) {
		$str = "$type|$class_name|$function_name";
		if (is_null($vars)) {
		} elseif (is_array($vars)) {
			$str .= '|' . implode('|', $vars);
		} else {
			$str .= '|' . $vars;
		}
		return md5($str);
	}
}