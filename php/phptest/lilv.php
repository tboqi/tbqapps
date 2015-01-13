<?php
$num = 10000;
for($i = 1; $i <= 20; $i++) {
	$num *= (1+0.0285/4);
}
echo $num . "\n";
