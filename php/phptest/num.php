<?php
/**
 * 计算2的n次方
 */
function twoncifang($n) {
	$res = pow ( 2, $n );
	$res = $res / 1024 / 1024 / 1024;
	return $res;
}

echo twoncifang ( 32 );