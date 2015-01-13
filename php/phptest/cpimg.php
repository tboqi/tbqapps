<?php
$conn1 = mysql_connect('192.168.1.200', 'root', 'root');
//$conn2 = mysql_connect('localhost', 'root', 'root');
mysql_select_db('xikang365');
/*
$sql = "SELECT fr.* FROM foodstore_food_resource fr, foodstore_raw_food rf WHERE rf.food_id=fr.food_id ";
$query = mysql_query($sql);
while($row = mysql_fetch_array($query)) {
	$sql1 = "update foodstore_raw_food set resource_file='{$row['resource_file']}' where food_id={$row['food_id']}";
	//echo $sql1 . '\n\t';
	mysql_query($sql1);
}*/
/*Ê³Îï
*/
$sql = "SELECT fr.* FROM foodstore_food_resource fr, foodstore_dish_food rf WHERE rf.food_id=fr.food_id ";
$query = mysql_query($sql);
while($row = mysql_fetch_array($query)) {
	$sql1 = "update foodstore_dish_food set resource_file='{$row['resource_file']}' where food_id={$row['food_id']}";
	//echo $sql1 . '\n\t';
	mysql_query($sql1);
}