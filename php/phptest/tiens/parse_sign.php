<?php
//退货
$orderNumber=date('YmdHis') . rand(1000,9999) . '';
$params = [
    "transid"=>"20160623132311001",
    "systraceno"=>"20160623132311001001",
    "transtype"=>"4006",
    "walletid"=>"P0000000041",
    "amount"=>"1",
    "merchno"=>"000000000000001",
    "organno"=>"0000000001",
    //"signature"=>"4d2e92068ffb8f6aacfa5ed7fbc939d6"
];
$params_tmp = ksort($params);
$params_str='';
foreach ($params as $key => $value) {
    if (empty($value)) {
        continue;
    }
    $params_str .= $key . '=' . $value . '&';
}
$params_str .="key=4d2e92068ffb8f6aacfa5ed7fbc939d6";
$signature=md5($params_str);

echo "signature={$signature}\n";