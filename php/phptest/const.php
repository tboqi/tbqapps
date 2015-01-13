<?php
class MyClass
{   const constant = 'constant value';
    //function showConstant() {   self::constant .= 'this new';   }
}
echo '1. ' . MyClass::constant."\n";
$class = new MyClass();
$class->showConstant();// echo $class::constant; is not allowed
?> 