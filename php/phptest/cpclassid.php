<?php
$conn1 = mysql_connect('192.168.1.200', 'root', 'root');
$conn2 = mysql_connect('localhost', 'root', 'root');
mysql_select_db('xikang365', $conn1);
mysql_select_db('xikang365', $conn2);

/**
$sql = "SELECT * FROM foodstore_raw_food_class";
$query = mysql_query($sql, $conn2);
while($row = mysql_fetch_array($query)) {
	$value = array($row);
	$value = serialize ($value);

	$sql1 = "SELECT food_id FROM foodstore_raw_food WHERE class_id={$row['class_id']}";
	$query1 = mysql_query($sql1, $conn1);
	while($row1 = mysql_fetch_row($query1)) {
		$sql2 = "update foodstore_raw_food set classes='{$value}' where food_id={$row1[0]}";
		echo $sql2 . ',';
		mysql_query($sql2, $conn2);
		$sql2 = "REPLACE INTO foodstore_food_class_link (food_id, class_id) VALUES ({$row1[0]}, {$row['class_id']})";
		mysql_query($sql2, $conn2);
		echo $sql2 . ';';
	}
}
*/
//从本地cp到服务器
$sql = "select * from foodstore_food_class_link";
$query = mysql_query($sql, $conn2);
while($row = mysql_fetch_array($query)) {
	mysql_query("REPLACE INTO foodstore_food_class_link (food_id, class_id) VALUES ({$row['food_id']}, {$row['class_id']})", $conn1);
}
$sql = "select resource_file, classes, food_id from foodstore_raw_food";
$query = mysql_query($sql, $conn2);
while($row = mysql_fetch_array($query)) {
	mysql_query("update foodstore_raw_food set resource_file='{$row['resource_file']}', classes='{$row['classes']}' where food_id={$row['food_id']}", $conn1);
}