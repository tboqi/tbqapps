<?php
$m = new Mongo();
$db = $m->test;
$collection = $db->aa1;
$collection->insert(array('a' => 'sdff'));