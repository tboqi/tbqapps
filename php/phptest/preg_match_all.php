<?php
$arr = array();
$array = preg_match_all('/\[em:(\d+):]/is', 'v[em:3:]ffdgfdgdg[em:13:]sdfdsfsfsdfsdfsddsf[em:28:]sdfsdfsdfsd[em:20:]', $arr, PREG_OFFSET_CAPTURE
);
print_r($arr);
?>