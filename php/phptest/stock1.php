<?php 
//计算股票解套价格
/**
 * a:持有股数
b:成本价

x:买入股数
y:买入价
z:预计卖出价

(a + x ) * z = b * a + x * y

y = ((a + x ) * z - a * b) / x
z = (b * a + x * y) / (a + x )
 */

$a = 600;
$b = 13.6;

$xa = array(500,600,700,800,900,1000,1100,1200,1300);
$ya = array(10,9,9.5,8);//10.2, 10.15, 10.1, 10.05, 10, 9.95, 9.9,9.85,9.8,9.75,9.7

echo "<table><tr><th>买入价</th><th>买入股数</th><th>预计卖出价</th><th>涨幅</th></tr>";
foreach ($xa as $x) {
	foreach ($ya as $y) {
		$z = ($b * $a + $x * $y) / ($a + $x );
		$z = round($z, 2);
		$zf = ($z - $y) / $y * 100;
		$zf = round($zf, 2);
		//if ($zf < 15)
		echo "<tr><td>{$y}</td><td>{$x}</td><td>{$z}</td><td>{$zf}</td></tr>";
	}
}
echo "</table>";