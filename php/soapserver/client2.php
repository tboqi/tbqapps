<?php
//$client = new SoapClient ( "http://localhost/soapserver/soap.php?WSDL" );
$client = new SoapClient(null, array('location' => "http://localhost/soapserver/soap.php",
                                     'uri'      => "http://localhost/soapserver/"));
var_dump($client->__getFunctions());

try {
	$result = $client->div ( 18, 2 ); // will cause a Soap Fault if divide by zero  
	print "The answer is: $result";
} catch ( SoapFault $e ) {
	print "Sorry an error was caught executing your request: {$e->getMessage()}";
}  