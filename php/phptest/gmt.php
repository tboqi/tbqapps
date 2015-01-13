<?php
echo date("M d Y H:i:s", mktime (0,0,0,1,1,2000));
echo "<br />";
echo gmdate("M d Y H:i:s", mktime (0,0,0,1,1,2000));
?> 