<?php
require_once('getid3/getid3.php');
$getID3 = new getID3;
$filename = "e:\\now\ folder\\rockstar\\Ohskar song.mp3";
$ThisFileInfo = $getID3->analyze($filename);
echo @$ThisFileInfo['playtime_string']; 
?>