<?php
//PHP POST数据的三种方法
//php有三种方法可以post数据,分别为Curl、socket、file_get_contents:

/**
 * Socket版本
 * 使用方法：
 * $post_string = "app=socket&version=beta";
 * request_by_socket('facebook.cn','/restServer.php',$post_string);
 */
function request_by_socket($remote_server,$remote_path,$post_string,$port = 80,$timeout = 30){
	$socket = fsockopen($remote_server,$port,$errno,$errstr,$timeout);
	if (!$socket) die("$errstr($errno)");

	fwrite($socket,"POST $remote_path HTTP/1.0\r\n");
	fwrite($socket,"User-Agent: Socket Example\r\n");
	fwrite($socket,"HOST: $remote_server\r\n");
	fwrite($socket,"Content-type: application/x-www-form-urlencoded\r\n");
	fwrite($socket,"Content-length: ".strlen($post_string)+8 . "\r\n");
	fwrite($socket,"Accept:*/*\r\n");
	fwrite($socket,"\r\n");
	fwrite($socket,"mypost=$post_string\r\n");
	fwrite($socket,"\r\n");

	$header = "";
	while ($str = trim(fgets($socket,4096))) {
		$header.=$str;
	}

	$data = "";
	while (!feof($socket)) {
		$data .= fgets($socket,4096);
	}

	return $data;
}

/**
 * Curl版本
 * 使用方法：
 * $post_string = "app=request&version=beta";
 * request_by_curl('http://facebook.cn/restServer.php',$post_string);
 */
function request_by_curl($remote_server,$post_string){
	$ch = curl_init();
	curl_setopt($ch,CURLOPT_URL,$remote_server);
	curl_setopt($ch,CURLOPT_POSTFIELDS,'mypost='.$post_string);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
	curl_setopt($ch,CURLOPT_USERAGENT,"Jimmy's CURL Example beta");
	$data = curl_exec($ch);
	curl_close($ch);
	return $data;
}
/**
 * 其它版本
 * 使用方法：
 * $post_string = "app=request&version=beta";
 * request_by_other('http://facebook.cn/restServer.php',$post_string);
 */
function request_by_other($remote_server,$post_string){
	$context = array(
		'http'=>array(
		'method'=>'POST',
		'header'=>'Content-type: application/x-www-form-urlencoded'."\r\n".
		'User-Agent : Jimmy\'s POST Example beta'."\r\n".
		'Content-length: '.strlen($post_string)+8,
		'content'=>'mypost='.$post_string)
	);
	$stream_context = stream_context_create($context);
	$data = file_get_contents($remote_server,FALSE,$stream_context);
	return $data;
}
$url = 'http://ti.xikang.com/online/rest/appapi/festival/openChest';
//$params = 'userId=M1100002010092600004&username=海底小精灵&chestID=ff80808133254b4101338c60931d3ca7&location=http://www.xikang.com/shicai/detail/769';
$params = 'userId=M1100002010092600004&username=海底小精灵&chestID=ff80808133254b4101338c60931d3ca7&location=http://www.xikang.com/shicai/detail/769';
$data = request_by_curl($url, $params);
$data = urldecode($data);
$data = json_decode($data);

//echo $data;exit;
print_r($data);exit;