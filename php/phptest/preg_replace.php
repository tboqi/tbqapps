<?php 
//$str = '[color=red]color[/color][font=red]font[/font][size=red]size[/size]';
//print preg_replace('/\[[^\]]+\]/', '', $str);
//print preg_replace('/\[color=(.*)\]/', '', $str);

//print preg_replace('/[^a-zA-Z0-9]/', '%', 'abcd!123$efg&lkj000'); 

//print preg_replace("/(克|两)$/", '', '13两');

print preg_replace("/[0-9.]*/", '', '13两');