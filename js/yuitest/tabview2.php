<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> tabview </TITLE>
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
	    var myTabs = new YAHOO.widget.TabView("demo"); 
	     
	    myTabs.addTab( new YAHOO.widget.Tab({ 
	        label: 'Tab One Label', 
	        content: '<p>Tab One Content</p>', 
	        active: true 
	    })); 
	     
	    myTabs.addTab( new YAHOO.widget.Tab({ 
	        label: 'Tab Two Label', 
	        content: '<p>Tab Two Content</p>' 
	    })); 
	     
	    myTabs.addTab( new YAHOO.widget.Tab({ 
	        label: 'Tab Three Label', 
	        content: '<p>Tab Three Content</p>' 
	    })); 
	     
	    myTabs.appendTo(document.body); 
	</script>
	<div id="demo" class="yui-navset"> 
	</div> 
 </BODY>
</HTML>
