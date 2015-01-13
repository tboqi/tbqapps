<?php
$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('test1');

//写入b和c, 200行记录
for ($i = 1; $i <= 100; $i++) {
	mysql_query("insert into `b` values ({$i}, 'b{$i}')");
	mysql_query("insert into `c` values ({$i}, 'c{$i}')");
}

//写入a， 200万行记录
for ($i = 1; $i <= 2000000; $i++) {
	$b_id = rand(1, 100);
	mysql_query("insert into a values ({$i}, 'a{$i}', {$b_id})");
	
	$c_num = rand(5, 20);
	for ($j= 0; $j < $c_num; $j++) {
		$c_id = rand(1, 100);
		mysql_query("insert into a_c values ({$i}, {$c_id})");
	}
}