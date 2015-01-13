<?php
// 创建一个 200X200 的图像
$img = imagecreatetruecolor(125, 125);
//背景
$white = imagecolorallocate($img, 240, 240, 240);
imagefill($img, 0, 0, $white);
// 分配颜色
$color1 = imagecolorallocate($img, 255, 153, 0); //脂肪
$color2 = imagecolorallocate($img, 148, 205, 222); //膳食纤维
$color3 = imagecolorallocate($img, 146, 209, 79); //蛋白质

// 画一个黑色的圆
imagefilledarc ($img, 62, 47, 92, 92, 0, 47 * 3.6, $color1, IMG_ARC_PIE);
imagefilledarc ($img, 62, 47, 92, 92, 47 * 3.6, 34 * 3.6 + 47 * 3.6, $color2, IMG_ARC_PIE);
imagefilledarc ($img, 62, 47, 92, 92, 34 * 3.6 + 47 * 3.6, 360, $color3, IMG_ARC_PIE);
//写字
$font = 'simsun.ttc';
imagettftext($img, 9, 0, 2, 108, $color1, $font, '脂肪 47%');
imagettftext($img, 9, 0, 60, 108, $color3, $font, '蛋白质 19%');
imagettftext($img, 9, 0, 2, 122, $color2, $font, '膳食纤维 34%');
// 将图像输出到浏览器
header("Content-type: image/png");
imagepng($img);
// 释放内存
imagedestroy($img);
