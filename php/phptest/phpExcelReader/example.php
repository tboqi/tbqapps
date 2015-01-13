<?php
// Test CVS
header('Content-type:text/html; charset=UTF-8');
set_time_limit (600);
require_once 'Excel/reader.php';


// ExcelFile($filename, $encoding);
$data = new Spreadsheet_Excel_Reader();


// Set output Encoding.
$data->setOutputEncoding('UTF-8');

/***
* if you want you can change 'iconv' to mb_convert_encoding:
* $data->setUTFEncoder('mb');
*
**/

/***
* By default rows & cols indeces start with 1
* For change initial index use:
* $data->setRowColOffset(0);
*
**/



/***
*  Some function for formatting output.
* $data->setDefaultFormat('%.2f');
* setDefaultFormat - set format for columns with unknown formatting
*
* $data->setColumnFormat(4, '%.3f');
* setColumnFormat - set format for column (apply only to number fields)
*
**/

$data->read('f:/1.xls');

/*


 $data->sheets[0]['numRows'] - count rows
 $data->sheets[0]['numCols'] - count columns
 $data->sheets[0]['cells'][$i][$j] - data from $i-row $j-column

 $data->sheets[0]['cellsInfo'][$i][$j] - extended info about cell
    
    $data->sheets[0]['cellsInfo'][$i][$j]['type'] = "date" | "number" | "unknown"
        if 'type' == "unknown" - use 'raw' value, because  cell contain value with format '0.00';
    $data->sheets[0]['cellsInfo'][$i][$j]['raw'] = value if cell without format 
    $data->sheets[0]['cellsInfo'][$i][$j]['colspan'] 
    $data->sheets[0]['cellsInfo'][$i][$j]['rowspan'] 
*/

error_reporting(E_ALL ^ E_NOTICE);

$conn = mysql_connect('localhost', 'root', 'root');
mysql_select_db('xikang365');
mysql_query('SET NAMES utf8');

for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++) {
	if($data->sheets[0]['cells'][$i][3] == 'FOOD_NAME') continue;
	$sql = "insert into foodstore_food (food_name) values ('{$data->sheets[0]['cells'][$i][3]}');";
	echo '#' . $i . ': #'. $sql . '<br/>';
	mysql_query($sql);
	$food_id = mysql_insert_id ();
	$sql = "insert into foodstore_raw_food (food_id, `food_name`, `ediable`, `water`, `energy`, `protein`, `fat`, `cho`, `diet_fiber`, `vit_a`, `carotene`, `vit_b1`, `vit_b2`, `vit_b3`, `vit_b6`, `vit_b12`, `vit_c`, `vit_e`, `cholesterol`, `ca`, `p`, `k`, `na`, `mg`, `fe`, `zn`, `se`, `cu`, `mn`, `i`, `test_year`, `food_code`, `energy_kj`, `ash`, `retionl`, `folate`, `naicin`, `a_vit_e`, `remark`)
		values ('{$food_id}', '{$data->sheets[0]['cells'][$i][3]}', '{$data->sheets[0]['cells'][$i][6]}', '{$data->sheets[0]['cells'][$i][7]}', '{$data->sheets[0]['cells'][$i][8]}', '{$data->sheets[0]['cells'][$i][10]}', '{$data->sheets[0]['cells'][$i][11]}', '{$data->sheets[0]['cells'][$i][12]}', '{$data->sheets[0]['cells'][$i][13]}', '{$data->sheets[0]['cells'][$i][16]}', '{$data->sheets[0]['cells'][$i][17]}', '{$data->sheets[0]['cells'][$i][19]}', '{$data->sheets[0]['cells'][$i][20]}', '', '{$data->sheets[0]['cells'][$i][21]}', '{$data->sheets[0]['cells'][$i][22]}', '{$data->sheets[0]['cells'][$i][25]}', '{$data->sheets[0]['cells'][$i][26]}', '{$data->sheets[0]['cells'][$i][14]}', '{$data->sheets[0]['cells'][$i][28]}', '{$data->sheets[0]['cells'][$i][29]}', '{$data->sheets[0]['cells'][$i][30]}', '{$data->sheets[0]['cells'][$i][31]}', '{$data->sheets[0]['cells'][$i][32]}', '{$data->sheets[0]['cells'][$i][33]}', '{$data->sheets[0]['cells'][$i][34]}', '{$data->sheets[0]['cells'][$i][35]}', '{$data->sheets[0]['cells'][$i][36]}', '{$data->sheets[0]['cells'][$i][37]}', '{$data->sheets[0]['cells'][$i][38]}', '{$data->sheets[0]['cells'][$i][1]}', '{$data->sheets[0]['cells'][$i][2]}', '{$data->sheets[0]['cells'][$i][9]}', '{$data->sheets[0]['cells'][$i][15]}', '{$data->sheets[0]['cells'][$i][18]}', '{$data->sheets[0]['cells'][$i][23]}', '{$data->sheets[0]['cells'][$i][24]}', '{$data->sheets[0]['cells'][$i][27]}', '{$data->sheets[0]['cells'][$i][39]}');";
	echo $sql . '<br/><br/>';
	mysql_query($sql);
}


//print_r($data);
//print_r($data->formatRecords);
?>
