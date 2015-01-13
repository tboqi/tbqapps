<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<title>后台管理菜单</title>
<script type="text/javascript">
      /* declare the URL to navbar */
      _NavBar_url = "<?php echo Kohana::config('core.static_website'); ?>navbar/";
      _NavBar_icons_url = "<?php echo Kohana::config('core.static_website'); ?>navbar/themes/winxp/";
    </script>
<!-- include the main script -->
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>navbar/navbar.js"></script>

<script type="text/javascript">//<![CDATA[
      function ourHandler(param, item, section) {
        var navbar = section.parent;
        switch (param) {
          case "date":
            alert(new Date());
            break;
          case "auto-hide":
            navbar.setPref("auto-hide", !navbar.prefs["auto-hide"]);
            break;
          case "sec-3-tog":
            var sec = navbar.sections[2]; // starts at zero
            sec.toggle();
            break;
        }
      }
      function initDocument() {
        var menu = new NavBar(document.getElementById("menu"));
        menu.prefs["no-controls"] = true;
        menu.prefs["icon-width"] = 18;
        menu.prefs["icon-height"] = 18;
        menu.openMenu();
        
        var section;
        <?php foreach($menus as $key => $menu) { ?>
        section = new NavSection(menu, "<?php echo $menu->name; ?>",
                       [<?PHP if(isset($menu->submenus) && count($menu->submenus) > 0 ) { 
                       foreach($menu->submenus as $key2 => $submenu) { ?>
                       [ "<?php echo $submenu->name; ?>", 
                         "<?php 
                         if ($submenu->app == 'index') {
                         echo url::site($submenu->uri); 
                         } else {
                         	echo url::site($submenu->uri);
                         }?>", 
                         null, null, "<?php if($submenu->target == 1) {echo '_parent';} else {echo 'mainFrame';}?>" 
                       ]<?php if($key2 < count($menu->submenus) - 1 ) {echo ',';}?>
                       <?php } } ?>]);
	        <?php if($key == 0) { ?>
	        section.setClass("active-section");
	        menu.currentSection = section;
	        <?php } ?>
        <?php } ?>

        menu.generate();
        menu.prefs["mono-section"] = false;
        menu.sync();
      }
    //]]></script>

<style type="text/css">
@import url("<?php echo Kohana::config('core.static_website'); ?>navbar/themes/winxp/skin.css");

html,body {
	margin: 0;
	height: 100%;
}

body {
	font: 12px "trebuchet ms", tahoma, verdana, sans-serif;
}

#content {
	background-color: #eee;
	color: #000;
	padding: 10px 20px;
	margin-left: 210px;
}
</style>

</head>

<body onload="initDocument()">
<div id="menu"></div>
<div id="content">aaaaaaaaa</div>
</body>
</html>