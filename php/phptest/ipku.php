<?php
$filename = '/media/data/bak/qqwry.dat';
$handle = @fopen($filename, 'rb');

$firstip = getlong();
$lastip = getlong();
$totalip = ($lastip - $firstip) / 7;
//$firstip = long2ip($firstip);
//$lastip = long2ip($lastip);
//echo "firstip: {$firstip}, lastip: {$lastip}, totalip: {$totalip} \n";exit;

fseek($handle, $firstip);
$a = strrev(fread($handle, 4));
var_dump($a);
echo "\n";exit;

$location = array();

$i= 0;
while($row = fgets($handle)) {
	//print_r($row);
	$beginip = strrev(fread($handle, 4));
	echo $beginip . "\n";
	if (++$i > 10) break;
}

//$row = ord($row);
//$row = unpack('Vlong', $row);
fclose($handle);

function getlong3() {
	global $handle;
	//将读取的little-endian编码的3个字节转化为长整型数
	$result = unpack('Vlong', fread($handle, 3).chr(0));
	return $result['long'];
}

function getlong() {
	global $handle;
	//将读取的little-endian编码的4个字节转化为长整型数
	$result = unpack('Vlong', fread($handle, 4));
	return $result['long'];
}

function getstring($data = "") {
	       while (ord($char = fread($this->fp, 1)) > 0) {        // 字符串按照C格式保存，以\0结束
	         $data .= $char;          // 将读取的字符连接到给定字符串之后
	       }
	       return $data;
	}
	