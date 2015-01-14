<?php
 // 赋值: <body text='black'>
 $bodytag  =  str_replace ( "%body%" ,  "black" ,  "<body text='%body%'>" );
 
// 赋值: Hll Wrld f PHP
 $vowels  = array( "a" ,  "e" ,  "i" ,  "o" ,  "u" ,  "A" ,  "E" ,  "I" ,  "O" ,  "U" );
 $onlyconsonants  =  str_replace ( $vowels ,  "" ,  "Hello World of PHP" );
 
// 赋值: You should eat pizza, beer, and ice cream every day
 $phrase   =  "You should eat fruits, vegetables, and fiber every day." ;
 $healthy  = array( "fruits" ,  "vegetables" ,  "fiber" );
 $yummy    = array( "pizza" ,  "beer" ,  "ice cream" );
 
$newphrase  =  str_replace ( $healthy ,  $yummy ,  $phrase );
 
// 赋值: 2
//  $str  =  str_replace ( "ll" ,  "" ,  "good golly miss molly!" ,  $count );
// echo  $count ;

// 赋值: You should eat pizza, beer, and ice cream every day
$phrase   =  "You should eat fruits, vegetables, and fiber every day." ;
$healthy  = array( "fruits" ,  "vegetables" ,  "fiber" );
$yummy    = array( "pizza" ,  "beer");
$newphrase  =  str_replace ( $healthy ,  $yummy ,  $phrase );
var_dump($newphrase);

$a = str_replace(array('ab', 'abc'), '1', 'abcd');
var_dump($a);
$a = str_replace(array('abc', 'ab'), '1', 'abcd');
var_dump($a);