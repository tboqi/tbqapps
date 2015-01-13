<?php
//$argc  参数个数
//$argv	参数数组，0是文件名, 1是接口名，后面都是参数
header ( 'Content-Type:text/plain; charset=utf8' ); //这里好像不起作用，控制台还是不显示中文
if ($argc < 2)
	die ( 'no interface name' );
$interfaceName = $argv [1];
$interfaceName = mysql_escape_string ( $interfaceName );
$conn = mysql_connect ( 'localhost', 'root', '' );
mysql_select_db ( 'interface' );
$sql = "select * from interfaces where `name` = '{$interfaceName}'";
$query = mysql_query ( $sql ) or die ( 'sql error' );
$row = mysql_fetch_object ( $query );

//检查传入的参数是否和设定的参数数量相同
$parameters = $row->parameters == '' ? array () : unserialize ( $parameters );
$pnum = count ( $parameters );
$inputNum = $argc - 2;
if ($pnum != $inputNum) {
	die ( 'input parameter num error' );
} else {
	//执行更新缓存
	$sql = $row->sql;
	if ($inputNum == 0) {
		$query = mysql_query ( $sql );
	} else {
		$segments = explode ( '?', $sql );
		$result = $segments[0];
		$j = 1;
		for($i = 2; $i < $argc; $i ++) {
			$result .= ' \'' . mysql_escape_string($argv[$i]) . '\' ' . $segments[$j];
			$j++;
		}
		$sql = $result;
//		echo $sql;exit;
		$query = mysql_query ( $sql );
	}
	if(mysql_num_rows($query) >= 1) {
		$data = array();
		while($res = mysql_fetch_object($query)) {
			$data[] = $res;
		}
		$key = parseKey($row, array_slice($argv, 2));
		$memcache_obj = new Memcache ();
		$memcache_obj->connect ( '192.168.1.210', 11200 );
		$memcache_obj->set ( $key, $data, MEMCACHE_COMPRESSED, $row->cachetime );
	} else {
		die('no data');
	}
}

function parseKey($row, $paraArray) {
	for($i = 0; $i < count ( $paraArray ); $i ++) {
		$array [$i] = strval ( $paraArray [$i] );
	}
	return md5 ( $row->name . $row->sql . $row->parameters . serialize ( $paraArray ) );
}