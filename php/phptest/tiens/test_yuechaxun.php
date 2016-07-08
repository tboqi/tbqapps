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
//余额查询接口
$body_data = [
];
    $body_data['walletid'] = $_GET['walletid']?:"038a0fc14d994e6696a652902c26216b";//uuid
    // $body_data['merchno'] = "0000000001";
    // $body_data['organno'] = "000000000000001";
    $body_data['merchno'] = "000000000000001";
    $body_data['organno'] = "0000000001";
$body_data['sign']=parse_sign($body_data);

$data = [
    "header"=>[
        "version"=>"100",
        "transtype"=>"4008",
        "security"=>"MD5",
        "dtclient"=>"20160623132311",
        "channeltype"=>"2"

    ],
    "body"=>$body_data,
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

//  用户名： yucaifu 密码： 123456
//  
/*
fec0c3d270864c0f8b9d6737bba99721    0000    
f5038e3084be41a7965618ef6ac66110    0000    000000000000019
f346f446f9994afcafbef7bf4612dc98                0000    000000000000014
f1f9be6826964ba8a9ab5cffaeeb9b08                0000    
eda9a6bdec964ca4b5c0854b5b7ddf70        
ece0412995e5476dae588d166558456a    0000    
ec2aba5ef7834862bf0eefcf555fdb95                0000    
eb56e5deef1247fb8a5cfd3dbcda5495    0000    
e6a3fe8bc09447df8b2381d6b17ab108    0000    
e41f06c9438948bd8a828d924d98855c    0000    104401734200004
0000是机构号，后面那个10几位的是商户号
*/

/*
机构号:0000000001 商户号:000000000000001 机构秘钥:4d2e92068ffb8f6aacfa5ed7fbc939d6
测试uuid用这个  038a0fc14d994e6696a652902c26216b

 */