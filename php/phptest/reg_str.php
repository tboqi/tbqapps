<?php
$date = '20040807a';
if (preg_match ("/^[a-zA-Z0-9]*$/", $date)) {
    echo 'right';
} else {
    echo "Invalid date format: $date";
}
