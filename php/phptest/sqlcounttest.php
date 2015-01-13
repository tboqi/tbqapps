<?php
$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('test');
$a = intval($_GET['a']);

for ($i = 0 + $a; $i < 100 + $a; $i++) {
	$sql = "insert into counttest (subject) values ('dfgfdg')";
	mysql_query($sql);
}
$a = $a + 100;
if ($a < 1000000) {
	echo "{$a}<script>setTimeout(\"location.href='sqlcounttest.php?a={$a}'\", 1000);</script>";
}
