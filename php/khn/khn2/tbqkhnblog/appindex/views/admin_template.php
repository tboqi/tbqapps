<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title><?php echo $page_title; ?>:<?php echo $website_title; ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php /* for jquery start */?>
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/jquery.js"></script>
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/jquery.form.js"></script>
<?php /* for jquery end */?>
<script type="text/javascript" src="<?php echo Kohana::config('core.static_website'); ?>js/yuqi_utils.js"></script>
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