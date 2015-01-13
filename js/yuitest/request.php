<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> Connection Manager Post Transaction </TITLE>
  <!-- Dependency --> 
	<script src="http://yui.yahooapis.com/2.5.1/build/yahoo/yahoo-min.js"></script> 
	 
	<!-- Used for Custom Events and event listener bindings --> 
	<script src="http://yui.yahooapis.com/2.5.1/build/event/event-min.js"></script> 
	 
	<!-- Source file --> 
	<script src="http://yui.yahooapis.com/2.5.1/build/connection/connection-min.js"></script>
  
  <script> 
  
var div = document.getElementById('container');

var handleSuccess = function(o){
  alert(1);
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	
	if(o.responseText !== undefined){
		div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
		div.innerHTML += "<li>HTTP headers: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		div.innerHTML += "<li>Server response: " + o.responseText + "</li>";
		div.innerHTML += "<li>Argument object: Object ( [foo] => " + o.argument.foo +
						 " [bar] => " + o.argument.bar +" )</li>";
	}
}

var handleFailure = function(o){
alert(2);
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		div.innerHTML = "<ul><li>Transaction id: " + o.tId + "</li>";
		div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		div.innerHTML += "<li>Status code message: " + o.statusText + "</li></ul>";
	}
}

var callback =
{
  success:handleSuccess,
  failure:handleFailure,
  argument: { foo:"foo", bar:"bar" }
};
 
	
  request.startRequest(); 

  function makeRequest(){
    var postData = "username=anonymous&userid=0"; 
    alert(postData);
     var sUrl = "";
	var request = YAHOO.util.Connect.asyncRequest('POST', sUrl, callback, postData); 
}
	</script>
 </HEAD>

 <body class="yui-skin-sam">
 <form><input type="button" value="Send a GET Request" onClick="makeRequest();"></form>
 </BODY>
</HTML>
