<?php
//$client = new SoapClient ( "http://localhost/soapserver/soap.php?WSDL" );
//var_dump($client->__getFunctions());
$client = new SoapClient(null, array('location' => "http://localhost/interface/admin.php/welcome/soap",
                                     'uri'      => "http://localhost/soapserver/"));

var_dump($client->__getFunctions());
try {
	$result = $client->displayData ( getGoods, array(1) ); // will cause a Soap Fault if divide by zero  
	print_r($result);
} catch ( SoapFault $e ) {
	print "Sorry an error was caught executing your request: {$e->getMessage()}";
}  