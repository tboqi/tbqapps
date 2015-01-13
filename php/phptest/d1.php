<?php
$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('test1');

$sql = "select a.id, a.`name` from a, a_c where a_c.a_id=a.id and a_c.c_id=10 and a.b_id=9 limit 10";
$query = mysql_query($sql);
while ($row = mysql_fetch_object($query)) {
	echo "id={$row->id}, name={$row->name}<br>";
}