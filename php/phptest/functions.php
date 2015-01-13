<?php
/**
 * @desc 全角字符与成半角字符的相互转换
 * @param $string
 * @param $flag 0=全角到半角,1=半角到全角
 */
function sbc2dbc($string, $flag = 0) {
	//全角
	$SBC = array ('０', '１', '２', '３', '４', 

	'５', '６', '７', '８', '９', 

	'Ａ', 'Ｂ', 'Ｃ', 'Ｄ', 'Ｅ', 

	'Ｆ', 'Ｇ', 'Ｈ', 'Ｉ', 'Ｊ', 

	'Ｋ', 'Ｌ', 'Ｍ', 'Ｎ', 'Ｏ', 

	'Ｐ', 'Ｑ', 'Ｒ', 'Ｓ', 'Ｔ', 

	'Ｕ', 'Ｖ', 'Ｗ', 'Ｘ', 'Ｙ', 

	'Ｚ', 'ａ', 'ｂ', 'ｃ', 'ｄ', 

	'ｅ', 'ｆ', 'ｇ', 'ｈ', 'ｉ', 

	'ｊ', 'ｋ', 'ｌ', 'ｍ', 'ｎ', 

	'ｏ', 'ｐ', 'ｑ', 'ｒ', 'ｓ', 

	'ｔ', 'ｕ', 'ｖ', 'ｗ', 'ｘ', 

	'ｙ', 'ｚ', '－', '　', '：', 

	'．', '，', '／', '％', '＃', 

	'！', '＠', '＆', '（', '）', 

	'＜', '＞', '＂', '＇', '？', 

	'［', '］', '｛', '｝', '＼', 

	'｜', '＋', '＝', '＿', '＾', 

	'￥', '￣', '｀' );
	
	//半角
	$DBC = array ('0', '1', '2', '3', '4', 

	'5', '6', '7', '8', '9', 

	'A', 'B', 'C', 'D', 'E', 

	'F', 'G', 'H', 'I', 'J', 

	'K', 'L', 'M', 'N', 'O', 

	'P', 'Q', 'R', 'S', 'T', 

	'U', 'V', 'W', 'X', 'Y', 

	'Z', 'a', 'b', 'c', 'd', 

	'e', 'f', 'g', 'h', 'i', 

	'j', 'k', 'l', 'm', 'n', 

	'o', 'p', 'q', 'r', 's', 

	't', 'u', 'v', 'w', 'x', 

	'y', 'z', '-', ' ', ':', 

	'.', ',', '/', '%', '#', 

	'!', '@', '&', '(', ')', 

	'<', '>', '"', '\'', '?', 

	'[', ']', '{', '}', '\\', 

	'|', '+', '=', '_', '^', 

	'￥', '~', '`' );
	
	//半角到全角
	if ($flag == 1) {
		return str_replace ( $DBC, $SBC, $string );
	} else {
		//全角到半角
		return str_replace ( $SBC, $DBC, $string );
	}
}

//去掉slassh
function sstripslashes($string) {
	if (is_array ( $string )) {
		foreach ( $string as $key => $val ) {
			$string [$key] = sstripslashes ( $val );
		}
	} else {
		$string = stripslashes ( $string );
	}
	return $string;
}

function isemail($email) {
	return strlen ( $email ) > 8 && preg_match ( "/^[-_+.[:alnum:]]+@((([[:alnum:]]|[[:alnum:]][[:alnum:]-]*[[:alnum:]])\.)+([a-z]{2,4})|(([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5])\.){3}([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5]))$/i", $email );
}

//取消HTML代码
function shtmlspecialchars($string) {
	if(is_array($string)) {
		foreach($string as $key => $val) {
			$string[$key] = shtmlspecialchars($val);
		}
	} else {
		$string = preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4})|[a-zA-Z][a-z0-9]{2,5});)/', '&\\1',
			str_replace(array('&', '"', '<', '>'), array('&amp;', '&quot;', '&lt;', '&gt;'), $string));
	}
	return $string;
}

function formhash() {
	$CI =& get_instance();
	$hashadd = defined('IN_ADMINCP') ? 'Only For XiKang AdminCP' : '';
	$formhash = substr(md5(substr(SITE_TIME, 0, -7).'|'.$CI->user->mid.'|'.md5($CI->config->item('site_key')).'|'.$hashadd), 8, 8);
	return $formhash;
}

function isbadword($string) {
	//只允许汉字，大小写字母，数字作为用户名
	return ! preg_match ( "/^[\x{4e00}-\x{9fa5}|a-z|A-Z|0-9]+$/u", $string );
}

//计算字符串长度,1个中文字符长度为1，1个英文字符串长度为0.5
function cnstrlen($str) {
	$i = 0;
	$count = 0;
	$len = strlen ( $str );
	while ( $i < $len ) {
		$chr = ord ( $str [$i] );
		if ($chr > 127) {
			$count ++;
		} else {
			$count += 0.5;
		}
		$i ++;
		if ($i >= $len)
			break;
		if ($chr & 0x80) {
			$chr <<= 1;
			while ( $chr & 0x80 ) {
				$i ++;
				$chr <<= 1;
			}
		}
	}
	return $count;
}