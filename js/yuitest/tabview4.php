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
myTabs.on('beforeActiveTabChange', function(ev) { 
  alert(document.getElementById("pppppp").innerHTML);
  //alert(myTabs.getTabIndex(ev.newValue));
}); 
</script>  

<div id="demo" class="yui-navset"> 
	<ul class="yui-nav"> 
    <li class="selected"><a href="#tab1"><em>Tab One Label</em></a></li> 
    <li><a href="#tab2"><em>Tab Two Label</em></a></li> 
    <li><a href="#tab3"><em>Tab Three Label</em></a></li> 
	</ul>             
  <div class="yui-content"> 
    <div><p id="pppppp">Tab One Content</p></div> 
    <div><p>Tab Two Content</p></div> 
    <div><p>Tab Three Content</p></div> 
  </div> 
</div> 
</BODY>
</HTML>
