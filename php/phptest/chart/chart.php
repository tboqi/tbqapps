<?php
require_once 'ofc-library/open-flash-chart-object.php';
open_flash_chart_object( 500, 250, 'http://'. $_SERVER['SERVER_NAME'] .'/phptest/chart/data-2.php', false );
?>