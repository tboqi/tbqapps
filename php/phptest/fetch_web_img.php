<?php

// 变量说明:
// $url 是远程图片的完整URL地址，不能为空。
// $filename 是可选变量: 如果为空，本地文件名将基于时间和日期自动生成.

function GrabImage($url,$filename="") {
if($url==""):return false;endif;

if($filename=="") {
$ext=strrchr($url,".");
if($ext!=".gif" && $ext!=".jpg"):return false;endif;
$filename=date("dMYHis").$ext;
}

ob_start();
readfile($url);
$img = ob_get_contents();
ob_end_clean();
$size = strlen($img);

$fp2=@fopen($filename, "a");
fwrite($fp2,$img);
fclose($fp2);

return $filename;
}

$img=GrabImage("http://images.meishij.net/p/20100908/9dd4682a972021758980c9725520e4b9.jpg","d:/1.jpg");
?>