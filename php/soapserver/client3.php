<?php
$client = new SoapClient("stockquote.wsdl");
  print($client->getQuote("ibm")); 