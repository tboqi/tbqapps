<?php
$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('test1');

$arr1 = $arr2 = array();

$sql = "select a_id from a_c where c_id=10";
$query = mysql_query($sql);
while ($row = mysql_fetch_object($query)) {
	$arr1[] = $row->a_id;
}

$sql = "select id from a where b_id=9";
$query = mysql_query($sql);
while ($row = mysql_fetch_object($query)) {
	$arr2[] = $row->id;
}

$arr = array_intersect($arr1, $arr2);

$sql = "select id, `name` from a where id in (" . implode(',', $arr) . ") limit 10";
$query = mysql_query($sql);
while ($row = mysql_fetch_object($query)) {
	echo "id={$row->id}, name={$row->name}<br>";
}