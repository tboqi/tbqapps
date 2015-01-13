<?php
require_once("MP3/Id.php"); 
$file = "E:\\rockstar\\ff80808119c97fac0119d0f85ae3003d.mp3";

$id3 = &new MP3_Id(); $id3->read($file); print_r($id3);

echo $id3->getTag('artists');

$id3->comment = "Be gentle with that file."; $id3->write(); $id3->read($file); print_r($id3 );
?>