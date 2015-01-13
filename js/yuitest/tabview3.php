<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> TabView Control: Getting Content from an External Source </TITLE>
  <!-- Dependencies --> 
	<!-- Sam Skin CSS for TabView --> 
	<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.5.1/build/tabview/assets/skins/sam/tabview.css"> 
	 
	<!-- JavaScript Dependencies for Tabview: --> 
	<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/yahoo-dom-event/yahoo-dom-event.js"></script> 
	<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/element/element-beta-min.js"></script> 
	 
	<!-- OPTIONAL: Connection (required for dynamic loading of data) --> 
	<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/connection/connection-min.js"></script> 
	 
	<!-- Source file for TabView --> 
	<script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/tabview/tabview-min.js"></script> 
 </HEAD>

 <body class="yui-skin-sam">
	<script type="text/javascript"> 
	   var tabView = new YAHOO.widget.TabView("container"); 
	   tabView.addTab( new YAHOO.widget.Tab({ 
	    label: 'Opera', 
    dataSrc: 'tab/1.html', 
    cacheData: true
	})); 
	 
	tabView.addTab( new YAHOO.widget.Tab({ 
	    label: 'Firefox', 
	    dataSrc: 'tab/2.html', 
	    cacheData: true 
	})); 
	 
	tabView.addTab( new YAHOO.widget.Tab({ 
	    label: 'Explorer', 
	    dataSrc: 'tab/3.html', 
    cacheData: true
	})); 
	 
	tabView.addTab( new YAHOO.widget.Tab({ 
	    label: 'Safari', 
	    dataSrc: 'tab/1.html', 
	    cacheData: true 
	})); 
		tabView.appendTo('container'); 
	</script>
	<div id="container"><h2>Browser News</h2></div> 
 </BODY>
</HTML>
