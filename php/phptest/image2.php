<?php
$im = imagecreatefromgif("situation-diagram.gif"); 
header("Content-type: image/gif");
$red = ImageColorAllocate($im, 255,0,0);
$blue = ImageColorAllocate($im, 0,0,255);
$zbx = 205;
$zby = 195;
imagefilledrectangle($im, $zbx-2, $zby-9, $zbx+8, $zby+1, $blue);
$zbx1 = $zbx-2;
$zby1 = $zby-9;
$zbx1 += 3.3*21;
$zby1 += -3.1*11;
$zbx2 = $zbx1+10;
$zby2 = $zby1+10;
imagefilledrectangle($im, $zbx1, $zby1, $zbx2, $zby2, $red);
imagegif($im);
?>