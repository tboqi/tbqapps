<?php
$string = file_get_contents('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeStockCount?node=hs_a', true, null, 13, 4);
$totalStockNum = intval($string);

$string = file_get_contents('http://vip.stock.finance.sina.com.cn/quotes_service/api/json_v2.php/Market_Center.getHQNodeData?page=1&num=10&sort=symbol&asc=1&node=hs_a&_s_r_a=page');
$string = substr($string, 1, strlen($string) - 2);
$arr = explode('},', $string);
$sql = "INSERT INTO stock.stocks (symbol, `code`, `name`, trade, pricechange, changepercent, buy, sell, settlement, `open`, high, low, volume, amount, fetchtime ) VALUES ";
$s = '';
foreach($arr as $k => $v) {
	if($k < count($arr) - 1) $v .= '}';
	$symbol = substr($v, strpos($v, 'symbol:')+8, 8);
	$code = substr($v, strpos($v, 'code:')+6, 6);
	$name = substr($v, strpos($v, 'name:')+6, strpos($v, 'trade:') - 2 - strpos($v, 'name:') - 6);
	$trade = substr($v, strpos($v, 'trade:')+7, strpos($v, 'pricechange:') - 2 - strpos($v, 'trade:') - 7);
	$pricechange = substr($v, strpos($v, 'pricechange:')+13, strpos($v, 'changepercent:') - 2 - strpos($v, 'pricechange:') - 13);
	$changepercent = substr($v, strpos($v, 'changepercent:')+15, strpos($v, 'buy:') - 2 - strpos($v, 'changepercent:') - 15);
	$buy = substr($v, strpos($v, 'buy:')+5, strpos($v, 'sell:') - 2 - strpos($v, 'buy:') - 5);
	$sell = substr($v, strpos($v, 'sell:')+6, strpos($v, 'settlement:') - 2 - strpos($v, 'sell:') - 6);
	$settlement = substr($v, strpos($v, 'settlement:')+12, strpos($v, 'open:') - 2 - strpos($v, 'settlement:') - 12);
	$open = substr($v, strpos($v, 'open:')+6, strpos($v, 'high:') - 2 - strpos($v, 'open:') - 6);
	$high = substr($v, strpos($v, 'high:')+6, strpos($v, 'low:') - 2 - strpos($v, 'high:') - 6);
	$low = substr($v, strpos($v, 'low:')+5, strpos($v, 'volume:') - 2 - strpos($v, 'low:') - 5);
	$volume = substr($v, strpos($v, 'volume:')+8, strpos($v, 'amount:') - 2 - strpos($v, 'volume:') - 8);
	$amount = substr($v, strpos($v, 'amount:')+8, strpos($v, 'per:') - 2 - strpos($v, 'amount:') - 8);
	$str1 = "('$symbol', '$code', '$name', '$trade', '$pricechange', '$changepercent', '$buy', '$sell', '$settlement', '$open', '$high', '$low', '$volume', '$amount', now())";
	$sql .= $s . $str1;
	$s = ',';
}
echo $sql;
?>