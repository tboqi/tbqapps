<?php
$url = 'http://www.xikang365.net/rest/searchArticleService?json="{\'channelName\':\'你好\',\'channelID\':\'59\',\'size\':\'6\'}"';
//$content = http_get();
$response = file_get_contents($url);
print_r($response);