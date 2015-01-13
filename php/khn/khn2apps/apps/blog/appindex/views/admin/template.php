<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<title><?php echo $page_title; ?> - 后台管理菜单</title>
<script type="text/javascript">
      /* declare the URL to navbar */
      _NavBar_url = "<?php echo Kohana::config('core.static_website'); ?>navbar/";
      _NavBar_icons_url = "<?php echo Kohana::config('core.static_website'); ?>navbar/themes/winxp/";
    </script>
<!-- include the main script -->
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>navbar/navbar.js"></script>

<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/jquery.js"></script>
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/jquery.form.js"></script>
<?php /* for jquery end */?>
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/yuqi_utils.js"></script>
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
	color: #000;
	padding: 10px 20px;
	margin-left: 210px;
}
/* add for form */
form{margin:0;padding:0;}
fieldset{margin:1em 0;border:none;border-top:1px solid #ccc;}
legend{margin:1em 0;padding:0 .5em;color:#036;background:transparent;font-size:1.3em;font-weight:bold;}
label{float:left;width:100px;padding:0 1em;text-align:right;}
fieldset div{margin-bottom:.5em;padding:0;display:block;}
fieldset div input,fieldset div textarea{width:150px;border-top:1px solid #555;border-left:1px solid #555;border-bottom:1px solid #ccc;border-right:1px solid #ccc;padding:1px;color:#333;}
fieldset div select{padding:1px;}
div.fm-multi div{margin:5px 0;}
div.fm-multi input{width:1em;}
div.fm-multi label{display:block;width:200px;padding-left:5em;text-align:left;}
#fm-submit{clear:both;padding-top:1em;text-align:center;}
#fm-submit input{border:1px solid #333;padding:2px 1em;background:#555;color:#fff;font-size:100%;}
input:focus,textarea:focus{background:#efefef;color:#000;}
fieldset div.fm-req{font-weight:bold;}
fieldset div.fm-req label:before{content:"* ";}
#container{margin:0 auto;padding:1em;text-align:left;}
p#fm-intro{margin:0;}
</style>

</head>

<body onload="initDocument()">
<div id="menu"></div>
<div id="content"><?php echo $content; ?></div>
</body>
</html>