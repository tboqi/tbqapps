<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="jquery-1.3.1.js"></script>
  <link rel="stylesheet" href="flora.all.css" type="text/css" media="screen" title="Flora (Default)">
  <script>
  $(document).ready(function(){
    $.ajax({
	  url:"ajax1.php",
	  cache:false,
	  success:function(html){
	  alert(html);
	  //$("#msg").append(html);
	  }
	  }); 
  });
  </script>
  
</head>
<body>
  
        <div id="msg" class="flora">
        </div>
        
</body>
</html>