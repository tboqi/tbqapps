<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="jquery-latest.js"></script>
  <link rel="stylesheet" href="flora.all.css" type="text/css" media="screen" title="Flora (Default)">
<script type="text/javascript" src="ui.core.js"></script>
<script type="text/javascript" src="ui.tabs.js"></script>
<script type="text/javascript" src="jquery.history.js"></script>

  <script>
  $(document).ready(function(){
    var tab = $("#example > ul").tabs();
    tab.tabs('select', 2);
  });

  function pageload(hash) {
		// hash doesn't contain the first # character.
		if(hash) {
			// restore ajax loaded state
			$("#load").load(hash + ".html");
		} else {
			// start page
			$("#load").empty();
		}
	}
	
	$(document).ready(function(){
		// Initialize history plugin.
		// The callback is called at once by present location.hash. 
		$.historyInit(pageload);
		
		// set onlick event for buttons
		$("a[rel='history']").click(function(){
			// 
			var hash = this.href;
			hash = hash.replace(/^.*#/, '');
			// moves to a new page. 
			// pageload is called at once. 
			// hash don't contain "#", "?"
			$.historyLoad(hash);
			return false;
		});
	});

  </script>


  
</head>
<body>
  
        <div id="example" class="flora">
            <ul>
                <li><a href="ahah_1.html"><span>One</span></a></li>
                <li><a href="ahah_2.html"><span>Two</span></a></li>
                <li><a href="ahah_3.html"><span>Three</span></a></li>
            </ul>
        </div>
        
</body>
</html>
