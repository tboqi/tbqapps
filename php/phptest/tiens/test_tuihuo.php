<?php
//测试退货
$data = [
    "header"=>[
        "version"=>"100",
        "transtype"=>"4006",
        "security"=>"MD5",
        "dtclient"=>"20160623132311",
        "channeltype"=>"2"

    ],
    "body"=>["sign"=> "2e9b1cb0be311f8764bd18ec5fd2aa75",
"transid"=> "20160623132311001",
"systraceno"=> "20160623132311001001",
"transtype"=> "4006",
"walletid"=> "P0000000041",
"amount"=> "1",
"merchno"=> "000000000000001",
"organno"=> "0000000001"]
];

$data_string = json_encode($data);
var_dump($data_string);
$http = "http://183.63.103.90:9999/vipcard" ; //这个是http地址
$https="https://183.63.103.90:9998/vipcard";
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