<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title><?php
echo html::specialchars ( $title );
?></title>
<?php
echo new View ( 'admin/authenticate' );
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php /* for jquery start */?>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/jquery-1.2.3.pack.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/jquery.form.js"></script>
<?php /* for jquery end */?>
<?php /* for yui start */
?>
<link rel="stylesheet" type="text/css"
	href="<?php
	echo url::base ();
	?>css/fonts-min.css" />
<link rel="stylesheet" type="text/css"
	href="<?php
	echo url::base ();
	?>css/sam/datatable.css" />
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/yahoo-dom-event.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/datasource-beta-min.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/connection-min.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/json/json-min.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/history-min.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/element-beta-min.js"></script>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/yui/datatable-beta-min.js"></script>
<?php /* for yui end */?>
<script type="text/javascript"
	src="<?php
	echo url::base ();
	?>js/#__utils.js"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
</style>
</head>

<body>
<?php
echo $content;
?>
</body>
</html>