<?php
$date = '2004-08-07a';
if (preg_match ("/^(\d{4})\-(\d{2})\-(\d{2})$/", $date, $regs)) {
    echo print_r($regs);
} else {
    echo "Invalid date format: $date";
}
