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
	/*
	 * AjaxObject is a hypothetical object that encapsulates the transaction
	 *     request and callback logic.
	 *
	 * handleSuccess( ) provides success case logic
	 * handleFailure( ) provides failure case logic
	 * processResult( ) displays the results of the response from both the
	 * success and failure handlers
	 * call( ) calling this member starts the transaction request.
	 */ 
	 
	var AjaxObject = { 
	 
	    handleSuccess:function(o){ 
        alert(11111111);
	        // This member handles the success response 
	        // and passes the response object o to AjaxObject's 
	        // processResult member. 
	        this.processResult(o); 
	    }, 
	 
	    handleFailure:function(o){ 
        alert(22222222);
	        // Failure handler 
	    }, 
	 
	    processResult:function(o){ 
        alert(33333333333);
	        // This member is called by handleSuccess 
	    }, 
	 
	    startRequest:function() { 
	      new YAHOO.util.Connect.asyncRequest('POST', 'requestres.php', callback, "new=1&old=2"); 
	    } 
	 
	}; 
	 
	/*
	 * Define the callback object for success and failure
	 * handlers as well as object scope.
	 */ 
var callback = 
	{ 
    alert(5555555555555);
	    success:AjaxObject.handleSuccess, 
	    failure:AjaxObject.handleFailure, 
	    scope: AjaxObject 
	}; 
	 
	// Start the transaction. 
	
function makeRequest(){
    AjaxObject.startRequest(); 
}
	</script>
 </HEAD>

 <body class="yui-skin-sam">
 <form><input type="button" value="Send a GET Request" onClick="makeRequest();"></form>
 </BODY>
</HTML>
