<?php
$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('test');

mysql_query("insert into aa (`aa`) values ('abcd')");