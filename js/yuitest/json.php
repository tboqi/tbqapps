<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>JSON with Connection Manager</title>

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
<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/json/json-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/connection/connection-min.js"></script>


<!--begin custom header content for this example-->

<!--end custom header content for this example-->

</head>

<body class=" yui-skin-sam">

<h1>JSON with Connection Manager</h1>

<div class="exampleIntro">
	<p>A natural fit for the JSON Utility is working with the <a href="http://developer.yahoo.com/yui/connection/">Connection Manager</a>.  In this example, we'll request JSON data from the server using Connection Manager's <code>asyncRequest</code> and parse the resulting JSON string data for processing.</p>

<p>Click the Get Messages button to send the request to the server.</p>
			
</div>

<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->

<div id="demo">
    <input type="button" id="demo_btn" value="Get Messages">

    <div id="demo_msg"></div>
</div>
<script type="text/javascript">
YAHOO.util.Event.on('demo_btn','click',function (e) {
    // Get the div element in which to report messages from the server
    var msg_section = YAHOO.util.Dom.get('demo_msg');
    msg_section.innerHTML = '';

    // Define the callbacks for the asyncRequest
    var callbacks = {

        success : function (o) {
            YAHOO.log("RAW JSON DATA: " + o.responseText);
  
            // Process the JSON data returned from the server
            var messages = [];
            try {
                messages = YAHOO.lang.JSON.parse(o.responseText);
            }
            catch (x) {
                alert("JSON Parse failed!");
                return;
            }

            YAHOO.log("PARSED DATA: " + YAHOO.lang.dump(messages));

            // The returned data was parsed into an array of objects.
            // Add a P element for each received message
            for (var i = 0, len = messages.length; i < len; ++i) {
                var m = messages[i];
                var p = document.createElement('p');
                var message_text = document.createTextNode(
                        m.animal + ' says "' + m.message + '"');
                p.appendChild(message_text);
                msg_section.appendChild(p);
            }
        },

        failure : function (o) {
            if (!YAHOO.util.Connect.isCallInProgress(o)) {
                alert("Async call failed!");
            }
        },

        timeout : 3000
    }

    // Make the call to the server for JSON data
    YAHOO.util.Connect.asyncRequest('GET',"jsonConnect.php", callbacks);
});
</script>

<!--END SOURCE CODE FOR EXAMPLE =============================== -->


<!--MyBlogLog instrumentation-->
<script type="text/javascript" src="http://track2.mybloglog.com/js/jsserv.php?mblID=2007020704011645"></script>

</body>
</html>
<!-- spaceId: 2012400111 -->
<!-- VER-431 -->
<script language=javascript>
if(window.yzq_p==null)document.write("<scr"+"ipt language=javascript src=http://l.yimg.com/us.js.yimg.com/lib/bc/bc_2.0.4.js></scr"+"ipt>");
</script><script language=javascript>
if(window.yzq_p)yzq_p('P=wfKp2EJe5GL5tRYBR_CO8z9SfM.A60gQL1QADmio&T=13tc6brqg%2fX%3d1209020244%2fE%3d2012400111%2fR%3ddev_net%2fK%3d5%2fV%3d1.1%2fW%3dJ%2fY%3dYAHOO%2fF%3d439355957%2fS%3d1%2fJ%3d3BAB49D1');
if(window.yzq_s)yzq_s();
</script><noscript><img width=1 height=1 alt="" src="http://us.bc.yahoo.com/b?P=wfKp2EJe5GL5tRYBR_CO8z9SfM.A60gQL1QADmio&T=143levol4%2fX%3d1209020244%2fE%3d2012400111%2fR%3ddev_net%2fK%3d5%2fV%3d3.1%2fW%3dJ%2fY%3dYAHOO%2fF%3d1276418296%2fQ%3d-1%2fS%3d1%2fJ%3d3BAB49D1"></noscript>
<!-- com2.devnet.scd.yahoo.com compressed/chunked Wed Apr 23 23:57:24 PDT 2008 -->
