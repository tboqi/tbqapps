<?php
$c = mysql_connect('localhost:9306');
$sql = "select * from test1 where match('my document')";
$query = mysql_query($sql);
while ($row = mysql_fetch_array($query)) {
	var_dump($row);
}

mysql_query("replace INTO rt VALUES (5, '第三方傻傻的发呆时发生', '空军航空局了解哦 iujiju', 5)");

$sql = "select * from rt where match('\"my document iujiju\"/1')";
$query = mysql_query($sql);
while ($row = mysql_fetch_array($query)) {
	var_dump($row);
}
