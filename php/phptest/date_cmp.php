<?php
$date = '2010-10-12';
/**
 * 比较输入的日期和当前日期的比较
 * 
 * 大于当前日期返回1，小于等于返回0
 */
function date_cmp($date) {
	$date = explode ( '-', $date );
	list ( $y, $m, $d ) = $date;
	$input = mktime ( 0, 0, 0, $m, $d, $y);
	$now = time();
	return $input > $now;
}

echo date_cmp($date);