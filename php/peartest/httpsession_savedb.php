<?php
/* create the following table in your database
CREATE TABLE sessiondata (
    id     varchar(32) NOT NULL,
    expiry int(10),
    data   text,
    PRIMARY KEY (id)
);
*/

require_once 'HTTP/Session2.php';

HTTP_Session2::useTransSID(false);
HTTP_Session2::useCookies(false);

// enter your DSN
HTTP_Session2::setContainer('MDB2',
    array('dsn' => 'mysql://devuser:111111@localhost/test',
        'table' => 'sessiondata'));

/*
// using an existing MDB2 connection
HTTP_Session2::setContainer('MDB2',
    array('dsn'   => &$db, 'table' => 'sessiondata'));
*/

HTTP_Session2::start('s');
HTTP_Session2::set('aaaaa', 33333333);
HTTP_Session2::setExpire(time() + 60); // set expire to 60 seconds
HTTP_Session2::setIdle(time() + 5);    // set idle to 5 seconds

if (HTTP_Session2::isExpired()) {
    HTTP_Session2::destroy();
}

if (HTTP_Session2::isIdle()) {
    HTTP_Session2::destroy();
}

HTTP_Session2::updateIdle();
?> 