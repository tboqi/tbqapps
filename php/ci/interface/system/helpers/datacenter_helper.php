<?php
function displayData($interfaceName, $array) {
	for($i = 0; $i < count ( $array ); $i ++) {
		$array [$i] = strval ( $array [$i] );
	}
	$CI = & get_instance ();
	$num = count ( $array );
	if (empty ( $interfaceName ) || ! is_string ( $interfaceName ))
		return array ('msg' => '参数错误, 没有接口名称', 'error' => 1 );
	$query = $CI->db->get_where ( 'interfaces', array ('name' => $interfaceName ) );
	$num = count ( $array );
	$row = $query->row ();
	$parameters = $row->parameters == '' ? '' : unserialize ( $row->parameters );
	$pnum = $parameters == '' ? 0 : count ( $parameters );
	if ($num == $pnum) {
		$key = parseKey ( $row, $array );
		$data = fetchData ( $key, $row->cachetime, $row->sql, $array, $pnum );
		if ($data === false) {
			return array ('msg' => '没有数据', 'error' => 1 );
		}
	} else {
		return array ('msg' => '参数错误，参数列表不匹配', 'error' => 1 );
	}
	return $data;
}

function updateData($interface, $paraArray) {
	$CI = & get_instance ();
	//print_r($interface);
	$key = parseKey ( $interface, $paraArray );
	$memcache_obj = new Memcache ();
	$memcache_obj->connect ( '192.168.1.210', 11200 );
	
	$pnum = pnum ( $interface );
	if ($pnum > 0) {
		$query = $CI->db->query ( $interface->sql, $paraArray );
	} else {
		$query = $CI->db->query ( $interface->sql );
	}
	if ($query->num_rows () > 0) {
		$data = array ();
		foreach ( $query->result () as $row ) {
			$data [] = $row;
		}
		$memcache_obj->set ( $key, $data, MEMCACHE_COMPRESSED, $interface->cachetime );
	} else {
		return false;
	}
}

function pnum($interface) {
	$parameters = $interface->parameters == '' ? '' : unserialize ( $interface->parameters );
	return $parameters == '' ? 0 : count ( $parameters );
}

function parseKey($row, $paraArray) {
	for($i = 0; $i < count ( $paraArray ); $i ++) {
		$array [$i] = strval ( $paraArray [$i] );
	}
	return md5 ( $row->name . $row->sql . $row->parameters . serialize ( $paraArray ) );
}

function fetchData($key, $cachetime, $sql, $array, $pnum) {
	$CI = & get_instance ();
	$memcache_obj = new Memcache ();
	$memcache_obj->connect ( '192.168.1.210', 11200 );
	$data = $memcache_obj->get ( $key );
	if ($data === false) {
		if ($pnum > 0) {
			$query = $CI->db->query ( $sql, $array );
		} else {
			$query = $CI->db->query ( $sql );
		}
		if ($query->num_rows () > 0) {
			$data = array ();
			foreach ( $query->result () as $row ) {
				$data [] = $row;
			}
			$memcache_obj->set ( $key, $data, MEMCACHE_COMPRESSED, $cachetime );
		} else {
			return false;
		}
	}
	
	return $data;
}

function getInterface($id) {
	$CI = & get_instance ();
	$query = $CI->db->get_where ( 'interfaces', array ('id' => $id ) );
	return $query->row ();
}