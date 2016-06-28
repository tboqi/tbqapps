<?php

//支付接口
$orderNumber=date('YmdHis') . rand(1000,9999) . '';
$params = [
    "orgNumber"=>"0000000001",
    "merchNumber"=>"000000000000001",
    "transType"=>"01",
    "gateType"=>"02",
    "orderNumber"=>$orderNumber,
    "transid"=>$orderNumber,
    "orderAmount"=>"1.00",
    "transTime"=>date('YmdHis'),
    "frontEndUrl"=>"http://123.151.202.66/kohana/welcome/frontendurl",
    "backEndUrl"=>"http://123.151.202.66/kohana/welcome/backendurl",
    "channel"=>"2",
    "cardNo"=>"928800011",
    "walletid"=>"P0000000041",
    //"origQid"=>"",
    //"signature"=>"4d2e92068ffb8f6aacfa5ed7fbc939d6"
];
$params_tmp = ksort($params);
var_dump($params);
$params_str='';
foreach ($params as $key => $value) {
    if (empty($value)) {
        continue;
    }
    $params_str .= $key . '=' . $value . '&';
}
$params_str .="key=4d2e92068ffb8f6aacfa5ed7fbc939d6";
$signature=md5($params_str);
var_dump($params_str, $signature);
$params['signature']=$signature;
?>0000000001
000000000000001
4d2e92068ffb8f6aacfa5ed7fbc939d6
<form id="pay_form" name="pay_form" action="https://183.63.103.90:9998/vipcard/trade/toTradePage.do" method="post">
<input type="text" name="params" id="params" value="<?=htmlspecialchars(json_encode($params)) ?>"/>
<button type="submit">提交</button>
</form>

<p>所有参数，按照字段名称排序，用“=”连接相应的值，最后把所有数组值以“&”字符连接起来，把私钥加在最后面，在进行MD5加密，所得就是签名。例如：
backEndUrl=http://taobao.com/&cardNo=928800011&channel=2&frontEndUrl=http://baidu.com/&gateType=02&merchNumber=000000000000001&orderAmount=1.00&orderNumber=201606230349099993&orgNumber=0000000001&transTime=20160623034909&transType=01&transid=201606230349099993&walletid=P0000000041&key=4d2e92068ffb8f6aacfa5ed7fbc939d6  
这个就是你们的私钥</p>