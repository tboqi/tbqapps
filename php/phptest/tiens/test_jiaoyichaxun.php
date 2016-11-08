<?php
function parse_sign($params){
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
    return $signature;
}
//交易查询接口
$transid = $_GET['transid'] ?: '201607050436125373';
$body_data = [
    'transid'=>$transid,
];
$walletid = $_GET['walletid'] ?: '038a0fc14d994e6696a652902c26216b';
    $body_data['walletid'] = $walletid;//
    $body_data['merchno'] = "000000000000001";
    $body_data['organno'] = "0000000001";
$body_data['sign']=parse_sign($body_data);

$data = [
    "header"=>[
        "version"=>"100",
        "transtype"=>"4010",
        "security"=>"MD5",
        "dtclient"=>"20160623132311",
        "channeltype"=>"2"

    ],
    "body"=>$body_data,
];

$data_string = json_encode($data);
var_dump($data_string);
$http = "http://183.63.103.90:9999/vipcard" ; //这个是http地址
$https="https://10.1.21.213:8888/vipcard";
$ch = curl_init($https.'/api/wallet.do');
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_POSTFIELDS,$data_string);
curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
curl_setopt($ch, CURLOPT_FAILONERROR,true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Content-Length: ' . strlen($data_string))
);
$cacert = getcwd() . '/truststore.jks'; //CA根证书  
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);   // 只信任CA颁布的证书 
//curl_setopt($ch, CURLOPT_CAINFO, $cacert); // CA根证书（用来验证的网站证书是否是CA颁布） 
//curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); // 检查证书中是否设置域名，并且是否与提供的主机名匹配  
 
$result = curl_exec($ch);

var_dump($result);

//  用户名： yucaifu 密码： 123456
/*
机构号:0000000001 商户号:000000000000001 机构秘钥:4d2e92068ffb8f6aacfa5ed7fbc939d6
测试uuid用这个  038a0fc14d994e6696a652902c26216b

 */
//http://localhost/tiens/test_jiaoyichaxun.php?transid=201607110708131839&walletid=795d204b5e22484ea7d398501ae633eb