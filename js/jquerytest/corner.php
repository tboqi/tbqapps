<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>jquery corner</title>
<style type="text/css">
body {
    font: Verdana,Arial,sans-serif;
	 /* An explicit background color is required for Safari. */
	 /* Otherwise your corner chunks will come out black!    */
	background: #f8f0e0;
}
div.section { clear: left; }
h1 { font-size: 150%; padding: 0 }
h2 { background: #ccc; padding: 1px 20px;  }
div.demo { 
	float: left; width: 18em; padding: 20px; margin: 1em;
    background: #c92; color:#000; text-align: center; font: verdana, arial, sans-serif;
}
div.inner { margin: 0; background: #ffffff; padding: 10px; border:0; zoom:1;}
div.outer { float: left; margin: 15px; background: #c82; padding: 28px; width: 22em }
div.fun  { margin: 2px; }
</style>
<script type="text/javascript" src="jquery-1.2.3.js"></script>
<script type="text/javascript" src="jquery.corner.js"></script>
<script type="text/javascript">
	$(function(){	// shorthand for $(document).ready() BTW
    $('div.inner').wrap('<div class="outer"></div>');
    //$('#demo').text();
    //$('p').wrap("<code></code>");
    //$('div.demo, div.inner').each(function() {
    //  $(this).corner();
    //  $(this).corner("round 8px").parent().css('padding', '24px').corner("round 20px")
    //});
    $('#demo').corner();
    $('#inner').corner("round 7px").parent().css('padding', '2px').corner("round 8px");
	});
</script>
</head>

<BODY>
<div id="main">
<div id="demo" class="demo"><h1>Round1</h1> <p>大范甘迪辅导费 </p></div>
<div id="inner" class="inner"><h1>Round2</h1><p>送达方式的发送达方式的发收到送达方式的发</p></div>
</div>
</BODY>
</HTML>