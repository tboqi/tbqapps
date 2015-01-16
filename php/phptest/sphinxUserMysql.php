<?php
header("Content-type: text/html; charset=utf-8");
$c = mysql_connect('localhost:9306');
$c1 = mysql_connect('localhost', 'root', '111111');
mysql_query('set names utf8', $c1);
mysql_select_db('c321871_number1g', $c1);//, post_content
$query = mysql_query("select ID, post_name from wp_posts order by rand() limit 1000", $c1);

while ($row = mysql_fetch_array($query)) {
// 	var_dump($row);
	$sql = "replace INTO rtcn1 VALUES ({$row['ID']}, '{$row['post_name']}', '{$row['post_content']}')";
	echo $row['ID'],"<br>\n";
	mysql_query($sql, $c);
}

// mysql_query("replace INTO rtcn1 VALUES (2, '第三方傻傻的发呆时发生', '空军航空字切分、mysql数局了解哦 iujiju腰带减肥')", $c);

// $sql = "select count(*) from rtcn1";// limit 2,1
// echo "{$sql}<br>\n";
// $query = mysql_query($sql, $c);
// while ($row = mysql_fetch_assoc($query)) {
// 	var_dump($row);
// }
// $sql = "select * from rtcn1 where match('Nicky Tambour')";
// echo "{$sql}<br>\n";
// $query = mysql_query($sql, $c);
// while ($row = mysql_fetch_assoc($query)) {
// 	var_dump($row);
// }

// $sql = "select * from rtcn1 where match('\"Nicky Tambour\"/1')";
// echo "{$sql}<br>\n";
// $query = mysql_query($sql, $c);
// while ($row = mysql_fetch_assoc($query)) {
// 	var_dump($row);
// }

$sql = "select * from rtcn1 where match('腰带')";
echo "{$sql}<br>\n";
$query = mysql_query($sql, $c);
while ($row = mysql_fetch_assoc($query)) {
	var_dump($row);
}

$sql = "select * from rtcn1 where match('\"减肥\"/1')";
echo "{$sql}<br>\n";
$query = mysql_query($sql, $c);
while ($row = mysql_fetch_assoc($query)) {
	var_dump($row);
}

$sql = "select * from rtcn1 where match('\"减肥 珠宝\"/1')";
echo "{$sql}<br>\n";
$query = mysql_query($sql, $c);
while ($row = mysql_fetch_assoc($query)) {
	var_dump($row);
}

$sql = "select * from rtcn1 where match('减肥 珠宝')";
echo "{$sql}<br>\n";
$query = mysql_query($sql, $c);
while ($row = mysql_fetch_assoc($query)) {
	var_dump($row);
}

$sql = "select * from rtcn1 where match('减')";// limit 2,1
echo "{$sql}<br>\n";
$query = mysql_query($sql, $c);
while ($row = mysql_fetch_array($query)) {
	var_dump($row);
}
