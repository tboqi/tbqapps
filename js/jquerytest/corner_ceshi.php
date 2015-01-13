<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>jquery corner</title>
<style type="text/css">
h1 { font-size: 150%; padding: 0 }
div.inner { background: #ffffff; padding: 10px; border:0;  width:352px;}
div.outer { background: #c82; padding: 28px; width: 22em;  width:352px;}
div.back { background-color: #98AB6F; width:352px;}
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
    $('#inner').corner("round 5px").parent().css('padding', '1px').corner("round 6px");
	});
</script>
</head>

<BODY>
<div id="inner" class="inner"><div class="back">Round2</div><div>送达方式的发送达方式的发收到送达方式的发</div>
</BODY>
</HTML>