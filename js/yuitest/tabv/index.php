<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>TabView Example - Dynamically Loading Content</title>
<meta name='author' content='Caridy Patino (caridy at gmail.com)' />
<!-- Reset and Fonts -->
<link rel="stylesheet" type="text/css" href="../assets/example.css">
<!-- YUI Basement Style -->
<link rel="stylesheet" type="text/css" href="tabview.css">
<!-- YUI Library -->
<script type="text/javascript" src="utilities.js"></script>
<script type="text/javascript" src="tabview.js"></script>
<!-- YUI-CMS Extension: Bubbling Library -->

<script type="text/javascript" src="dispatcher.js"></script>
<style type="text/css">
#demo {
    width:40em; /* arbitrary width */
}

#demo .yui-content {
    padding:1em;
}

#demo .loading {
    background-image:url(../images/loading.gif);
    background-position:center center;
    background-repeat:no-repeat;
}

#demo .loading * {
    display:none;
}
</style>
<script type="text/javascript">
YAHOO.example.init = function() {
    var tabView = new YAHOO.widget.TabView({id: 'demo'});

    YAHOO.plugin.Dispatcher.delegate (new YAHOO.widget.Tab({
        label: 'Inline Scripts',
        dataSrc: 'xhtml.with.inline.scripts.html',
        active: true
    }), tabView);

    YAHOO.plugin.Dispatcher.delegate (new YAHOO.widget.Tab({
    	label: 'Remote Scripts',
        dataSrc: 'xhtml.with.remote.scripts.html',
        cacheData: true
      }),
      tabView,
      { // content configuration...
        relative:true  // the resources in the content (css/js) are relatives, and need path correction...
      }
    );

    YAHOO.plugin.Dispatcher.delegate (new YAHOO.widget.Tab({
    	label: 'DataTable Control',
        dataSrc: 'xhtml.with.datatable.html',
        cacheData: true
    }), tabView);

    YAHOO.util.Event.onContentReady('doc', function() {
        tabView.appendTo('doc');
    });

};
YAHOO.example.init();
</script>
</head>
<body id="cms-body" class="yui-skin-sam">
<div id="doc">

	<div class="path">
	  <a href="http://www.bubbling-library.com/" target="_top">Bubbling Library</a> &gt; <a href="http://www.bubbling-library.com/eng/examples" target="_top">Examples</a>

	</div>

    <h1>TabView and Dispatcher Example - Dynamically loading content with script inside</h1>
    <p>This is an example of the DISPATCHER feature over the YUI tabview component, you can use the dispatcher to managing the content inside the tab. This feature will warranty the execution of the scripts (remote and inline "script" tags) during the dataSrc request.</p>
</div>
<script type="text/javascript" src="http://www.google-analytics.com/urchin.js"></script><script type="text/javascript">_uacct="UA-2337646-1";if(typeof urchinTracker=="function")urchinTracker();</script></body>
</html>
