<?php
  function uuid($prefix = '') 

  {

    $chars = md5( uniqid( rand() ) );

    $uuid  = substr($chars,0,8);

    $uuid .= substr($chars,8,4);

    $uuid .= substr($chars,12,4);

    $uuid .= substr($chars,16,4);

    $uuid .= substr($chars,20,12);

    

    return $prefix . $uuid;

  }
//echo md5(uniqid(rand()));exit;
//echo uniqid(md5(rand()));exit;

echo uuid('2009_');
echo "<br>";
echo uuid('urn:uuid:');
?>