<?php
header("Content-type: text/html; charset=utf-8"); 

$client = new SoapClient(
	null, 
	array(
		'location' => "http://xklocal.com/foodstore/foodservice",
		'uri'      => "http://localhost/phptest/"
	)
);

echo "<p>---------search_raw_food-------</p>";
try {
	$result = $client->search_raw_food ( '猪肉' ); // will cause a Soap Fault if divide by zero  
	print_r($result);
} catch ( SoapFault $e ) {
	print "Sorry an error was caught executing your request: {$e->getMessage()}";
}  
echo "<p>---------search_dish_food-------</p>";
try {
	$result = $client->search_dish_food ( 'www' ); // will cause a Soap Fault if divide by zero  
	print_r($result);
} catch ( SoapFault $e ) {
	print "Sorry an error was caught executing your request: {$e->getMessage()}";
}
echo "<p>---------get_raw_food-------</p>";
try {
	$result = $client->get_raw_food ( 842 ); // will cause a Soap Fault if divide by zero  
	print_r($result);
} catch ( SoapFault $e ) {
	print "Sorry an error was caught executing your request: {$e->getMessage()}";
}
echo "<p>---------get_dish_food-------</p>";
try {
	$result = $client->get_dish_food ( 240  ); // will cause a Soap Fault if divide by zero  
	print_r($result);
} catch ( SoapFault $e ) {
	print "Sorry an error was caught executing your request: {$e->getMessage()}";
}