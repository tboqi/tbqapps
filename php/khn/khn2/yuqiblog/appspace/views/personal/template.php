<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $page_title; ?> :: <?php echo $slogan; ?></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="<?php echo $description; ?>" />
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php /* for jquery start */ ?>
<script type="text/javascript" src="<?php echo url::base(); ?>js/jquery.js"></script>
<script type="text/javascript" src="<?php echo url::base(); ?>js/jquery.form.js"></script>
<?php /* for jquery end */ ?>
<script type="text/javascript" src="<?php echo url::base(); ?>js/yuqi_utils.js"></script>
<link href="<?php echo url::space_source($theme, 'style.css'); ?>" rel="stylesheet" type="text/css" />
</head>

<body>
<div align="center" class="wrapper">
	<div class="header">
		<div class="header_spacer">
			<h3 style="margin-top:60px ; float:left ; padding-left:20px;"><?php echo $page_title; ?></h3>
			<img src="<?php echo url::space_source($theme, 'image/bg_header.jpg'); ?>" width="343" height="100" style="float:right" alt="." />
		</div>
		<?php echo new View('blog/blocks/appspace_mainmenu'); ?>
	</div>
	<div class="main_content">
		<div class="left_menu">
			<div>
				<div align="center"><?php echo user::avatar($space_owner, 150, 200); ?></div>
				<div><?php echo $space_owner->nickname; ?></div>
				<div>注册日期：<?php echo date('Y-m-d', $space_owner->regist_time); ?></div>
				<div>上次登录：<?php echo date('Y-m-d', $space_owner->last_login); ?></div>
			</div>
			<div class="left_menu_title">空间说明</div>
			<?php echo $description; ?>
			<?php if (Auth::instance()->logged_in()) { echo new View('blog/blocks/appspace_usermenus'); } ?>
			<?php echo blog_article_block::categories_list($space_owner->id); ?>
			<?php echo blog_link_block::blog_links($space_owner->id); ?>
		</div>
		<div class="text_content"><?php echo $content; ?></div>
	</div>
	<div class="footer">(c) CopyLEFT <?php echo $page_title; ?></div>
	<div class="footer_gran"></div>
</div>
</body>
</html>