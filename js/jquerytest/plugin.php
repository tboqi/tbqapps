<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<title>插件</title>
<script type="text/javascript">
(function($){
	$.extend({
		hw:function(op){
			$('#' + op.c).html('hw');
			op.callback("qwewqe");
			return 2222;
		}
	});
})(jQuery)

$(document).ready(function(){
	alert($.hw({c:'container', callback:function(v1){alert(v1);}}));
});
</script>
</head>
    <body>
    <p>!===</p><span id="container"></span>
    </body>
</html>