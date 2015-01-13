<?php
class Test {
  function __construct() {
    
  }

  function aaa() {
    echo  333;
  }
}

$cn= "Test";
$t = new $cn() ;

$fn = "aaa";

$t->$fn();
?>