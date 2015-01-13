<?php
header("Content-type: text/html; charset=utf-8"); 
$str = '我1是一串比较长的中文-www.ooso.net';
echo "mb_substr:" . mb_substr($str, 0, 6, 'utf-8');
echo "<br>";
echo "mb_strcut:" . mb_strcut($str, 0, 6, 'utf-8');
echo "<br>";

function substring($str, $start, $length) {
	//比较好用字符串截取函数
	$len = $length;
	if ($length < 0) {
		$str = strrev ( $str );
		$len = - $length;
	}
	$len = ($len < strlen ( $str )) ? $len : strlen ( $str );
	for($i = $start; $i < $len; $i ++) {
		if (ord ( substr ( $str, $i, 1 ) ) > 0xa0) {
			$tmpstr .= substr ( $str, $i, 2 );
			$i ++;
		} else {
			$tmpstr .= substr ( $str, $i, 1 );
		}
	}
	if ($length < 0)
		$tmpstr = strrev ( $tmpstr );
	return $tmpstr;
}
echo substring($str, 0, 6);
?>