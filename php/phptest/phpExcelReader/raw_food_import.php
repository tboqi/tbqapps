<?php
header('Content-type:text/html; charset=UTF-8');
set_time_limit (600);
require_once 'Excel/reader.php';

$data = new Spreadsheet_Excel_Reader();

$data->read('D:/workspace/neusoft/raw_food_ext1.xls');
exit;

error_reporting ( E_ERROR | E_WARNING | E_PARSE );

$link200 = mysql_connect ( '192.168.1.200', 'root', 'root' );
mysql_select_db ( 'xikang365' );
mysql_query('SET NAMES utf8');

for ($i = 3; $i <= $data->sheets[0]['numRows']; $i++) {
	$row = $data->sheets[0]['cells'][$i];
	$food_code = $row[1];
	$sql = "select * from newfoodstore_raw_food where food_code='{$food_code}'";
//	echo $sql;exit;
	$query = mysql_query($sql);
	$food = mysql_fetch_array($query);
	$cruciferae = intval($row[2]) > 0 ? 1 : 0;
	$coarse_grain = intval($row[3]) > 0 ? 1 : 0;
	$darkcolored_vegetable = intval($row[4]) > 0 ? 1 : 0;
	$popular = intval($row[5]) > 0 ? 1 : 0;
	
	if (empty($row[6]) || $row[6] == 'Tr' || $row[6] == '-' || intval($row[6]) <= 0) {
		$i_weight = 0;
	} else {
		$i_weight = floatval($row[6]);
	}
	if (empty($row[7])) {
		$purine_weight = 0;
	} else {
		$purine_weight = floatval($row[7]);
	}
	if (empty($row[8])) {
		$gi_weight = 0;
	} else {
		$gi_weight = floatval($row[8]);
	}
	$sql = "replace into newfoodstore_raw_food_nutrient_link values 
		('{$food['food_id']}', 26, 0, {$i_weight}, 0),
		('{$food['food_id']}', 31, 0, {$purine_weight}, 0),
		('{$food['food_id']}', 32, 0, {$gi_weight}, 0)";
	mysql_query($sql);
	
	$sql = "update newfoodstore_raw_food set cruciferae={$cruciferae}, 
		coarse_grain={$coarse_grain}, darkcolored_vegetable={$darkcolored_vegetable}, 
		popular={$popular} where food_id={$food['food_id']}";
	mysql_query($sql);
}