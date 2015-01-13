<?php
function randomkeys($length)
{
$pattern = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLOMNOPQRSTUVWXYZ'; //字符池
for($i=0;$i<$length;$i++)
{
$key .= $pattern{mt_rand(0,35+26)}; //生成php随机数
}
return $key;
}
echo randomkeys(8);