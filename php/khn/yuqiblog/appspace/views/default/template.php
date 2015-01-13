<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
<link rel="stylesheet" type="text/css" href="<?php echo url::space_source($theme, 'css/stylenew.css'); ?>" media="screen" />
<link href="<?php echo url::site_index('rss/blog/' . $space_owner->id); ?>" title="RSS" type="application/rss+xml" rel="alternate" />
</head>
<body>
<div id="header">
<h1><?php echo $space->name; ?> :: <span><?php echo $slogan; ?></span></h1>
<?php echo new View('blog/blocks/appspace_mainmenu'); ?>
</div><!--//end #header//-->

<div id="leftColumn"> 
	<div>
		<div align="center"><?php echo user::avatar($space_owner, 150, 200); ?></div>
		<div><?php echo $space_owner->nickname; ?></div>
		<div>注册日期：<?php echo date('Y-m-d', $space_owner->regist_time); ?></div>
		<div>上次登录：<?php echo date('Y-m-d', $space_owner->last_login); ?></div>
		<?php if (Auth::instance()->logged_in() && $space_owner->id != $this->logged_user->id) {  ?>
		<div>
			<a href="<?php echo url::site('message/send/' . $space_owner->id); ?>">发送消息</a>&nbsp;&nbsp;
			<?php if (! friend::is_friend($this->logged_user, $space_owner) ) { ?>
			<a href="<?php echo url::site('friend/request/' . $space_owner->id); ?>">加为好友</a>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
  <h2>空间说明</h2>
  <p><?php echo $space->description; ?></p>
  <?php if (Auth::instance()->logged_in() && $space_owner->id == $this->logged_user->id) { echo new View('blog/blocks/appspace_usermenus'); } ?>
	<?php echo blog_article_block::categories_list($space_owner->id); ?>
	<?php echo blog_link_block::blog_links($space_owner->id); ?>
</div><!--//end #leftColumn//-->

<div id="centerColumn"><?php echo $content; ?></div>
<!--//end #centerColumn//-->


</body>
</html>