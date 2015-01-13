<?php
$phrase  = "You should eat fruits ?, vegetables ?, and fiber every day. ?";
//$healthy = array("fruits", "vegetables", "fiber");
$yummy   = array("pizza", "beer", "ice cream");

$newphrase = str_replace('?', $yummy, $phrase);
echo $newphrase;