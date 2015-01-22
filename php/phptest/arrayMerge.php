<?php
$arr1 = array(3 => 5, 1 => 4, 8 => 2);
$arr2 = array(2 => 5, 4 => 1, 8 => 6);

$a = $arr1 + $arr2;//相同键不覆盖，
var_dump($a);
$a = $arr2 + $arr1;
var_dump($a);
$a = array_merge($arr1, $arr2);
var_dump($a);

$a = array_merge($arr2, $arr1);
var_dump($a);

/*
 * array(5) {
  [3]=>
  int(5)
  [1]=>
  int(4)
  [8]=>
  int(2)
  [2]=>
  int(5)
  [4]=>
  int(1)
}
array(5) {
  [2]=>
  int(5)
  [4]=>
  int(1)
  [8]=>
  int(6)
  [3]=>
  int(5)
  [1]=>
  int(4)
}
array(6) {
  [0]=>
  int(5)
  [1]=>
  int(4)
  [2]=>
  int(2)
  [3]=>
  int(5)
  [4]=>
  int(1)
  [5]=>
  int(6)
}
array(6) {
  [0]=>
  int(5)
  [1]=>
  int(1)
  [2]=>
  int(6)
  [3]=>
  int(5)
  [4]=>
  int(4)
  [5]=>
  int(2)
}
 */