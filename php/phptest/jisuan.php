<?PHP
$nian = 0.05; //年收益
$jine = 5000; //投资金额
$shijian = 12; //投资时间，月

$i = (1+$nian/12);
$res = $i;
for($j=0; $j<$shijian; $j++) {
  $res = $res * $i;
}
echo "<br />投资收益: "  . ($jine * ($res-1) - $jine * 0.006 - $jine * 0.003);
echo "<br />投资收益率: "  . ($res-1 - 0.006 - 0.003);
echo "<br />银行存款：" . $jine * 0.0333;
?>