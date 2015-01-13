<?php
header('Content-type:text/html; charset=UTF-8');
require_once 'D:/workspace/neusoft/xikang_foodstore_v2/system/application/config/difference.php';

$link = mysql_connect ( DB_HOSTNAME, DB_USERNAME, DB_PASSWORD );
mysql_select_db ( XIKANG_DB, $link );
mysql_query('SET NAMES utf8', $link);

$link200 = mysql_connect ( '192.168.1.200', 'root', 'root' );
mysql_select_db ( XIKANG_DB, $link200 );
mysql_query('SET NAMES utf8', $link200);

mysql_query ( 'delete from newfoodstore_raw_food_nutrient_link', $link );
mysql_query ( 'delete from newfoodstore_raw_food', $link );

$values = array ();

$nutrients_sql = "select * from newfoodstore_nutrients";
$nutrients_res = mysql_query ( $nutrients_sql, $link );
$nutrients = array ();
while ( $nutrient = mysql_fetch_assoc ( $nutrients_res ) ) {
	$nutrients [] = $nutrient;
}
//print_r($nutrients);exit;

$raw_food_values = array ();
$raw_food_nutrient_values = array ();
$sql = "select * from foodstore_raw_food";
$query = mysql_query ( $sql, $link200 );
$insert_link_sql = "insert into newfoodstore_raw_food_nutrient_link values ";
$insert_raw_food_sql = "insert into newfoodstore_raw_food (food_id, food_name, food_alias, test_year, 
	food_code, remark, admin_user_id, edited_time, nutrients, class_id, class_name, introduce, 
	images) values ";
$i = 0;
while ( $row = mysql_fetch_array ( $query ) ) {
	$i++;
	foreach ( $nutrients as $nutrient ) {
		$nutrient ['flag'] = 0;
		$nutrient ['weight'] = $row [$nutrient ['nutrient_name_en']];
		$nutrient ['weight'] = $nutrient ['weight'] > 0 ? $nutrient ['weight'] : 0;
		$raw_food_nutrient_values = "('{$row['food_id']}', '{$nutrient['nutrient_id']}', 
			'{$nutrient['flag']}', '{$nutrient['weight']}')";
		echo $insert_link_sql . $raw_food_nutrient_values . ';\n';
		mysql_query($insert_link_sql . $raw_food_nutrient_values, $link);
	}
	$raw_food_values = "('{$row['food_id']}', '{$row['food_name']}', '{$row['food_alias']}', 
		'{$row['test_year']}', '{$row['food_code']}', '{$row['remark']}', 1, " . time() . ",
		'" . addslashes ( json_encode ( $nutrient ) ) . "', 9999, '', '', '')";
	echo $insert_raw_food_sql . $raw_food_values . ';\n';
	mysql_query($insert_raw_food_sql . $raw_food_values, $link);
	exit;
}
//$insert_link_sql = "insert into newfoodstore_raw_food_nutrient_link values " 
//	. implode ( ',', $raw_food_nutrient_values );
//mysql_query ( $insert_link_sql, $link );

//$insert_raw_food_sql = "insert into newfoodstore_raw_food (food_id, food_name, food_alias, test_year, 
//	food_code, remark, admin_user_id, edited_time, nutrients) values "
//	. implode ( ',', $raw_food_values );
//mysql_query ( $insert_raw_food_sql, $link );