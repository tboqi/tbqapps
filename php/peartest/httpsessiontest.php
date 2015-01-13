<?php
require_once 'HTTP/Session2.php';

/**
 * set cookie params
 
session_set_cookie_params(60*60*24, // expire in 24 hours
    '/',                            // path
    'localhost',                 // domain
    false,                          // "secure only"
    true);                          // only over http
*/
HTTP_Session2::useCookies(true);

HTTP_Session2::start('s');
HTTP_Session2::setExpire(60*60*24); // set expire in 24 hours
HTTP_Session2::setIdle(60*60);      // set idle to 1 hour

if (HTTP_Session2::isExpired()) {
    HTTP_Session2::destroy();
}

if (HTTP_Session2::isIdle()) {
    HTTP_Session2::destroy();
}

HTTP_Session2::updateIdle();
?> 