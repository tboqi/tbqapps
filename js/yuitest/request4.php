<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Connection Manager POST Transaction</title>

<style type="text/css">
/*margin and padding on body element
  can introduce errors in determining
  element position and are not recommended;
  we turn them off as a foundation for YUI
  CSS treatments. */
body {
	margin:0;
	padding:0;
}
</style>

<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.5.1/build/fonts/fonts-min.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/event/event-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/connection/connection-min.js"></script>


<!--begin custom header content for this example-->
<style>
#container li {margin-left:2em;}
</style>


<!--end custom header content for this example-->

</head>

<body class=" yui-skin-sam">

<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->


<script>

var handleSuccess = function(o){
  alert(o.responseText);
};

var handleFailure = function(o){
  alert(222222222222222);
};

var callback =
{
  success:handleSuccess,
  failure:handleFailure,
  argument:['foo','bar']
};




function makeRequest(){
var sUrl = "requestres.php";
var postData = "username=anonymous&userid=0";
	var request = YAHOO.util.Connect.asyncRequest('POST', sUrl, callback, postData);
}

</script>
<form><input type="button" value="Send a POST Request" onClick="makeRequest();"></form>

</body>
</html>
