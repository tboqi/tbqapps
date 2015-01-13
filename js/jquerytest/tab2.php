<?php
$tab = intval($_GET['tab']);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="jquery-latest.js"></script>
  <link rel="stylesheet" href="flora.all.css" type="text/css" media="screen" title="Flora (Default)">
<script type="text/javascript" src="ui.core.js"></script>
<script type="text/javascript" src="ui.tabs.js"></script>
  <script>
  $(document).ready(function(){
    var tab = $("#example > ul").tabs();
    tab.tabs('select', <?php echo $tab; ?>);
  });
  </script>
  
</head>
<body>
  
        <div id="example" class="flora">
            <ul>
                <li><a href="ahah_1.html" onclick="location.href='?tab=0';"><span>One</span></a></li>
                <li><a href="ahah_2.html" onclick="location.href='?tab=1';"><span>Two</span></a></li>
                <li><a href="ahah_3.html" onclick="location.href='?tab=2';"><span>Three</span></a></li>
            </ul>
        </div>
        
</body>
</html>
