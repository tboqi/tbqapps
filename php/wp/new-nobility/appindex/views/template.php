<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $page_title; ?> - <?php echo $website_title; ?></title>
<link rel="alternate" type="application/rss+xml" title="新贵族" href="<?php echo url::site('rss'); ?>" />
<meta name="keywords" content="<?php echo $keywords; ?>" />
<meta name="description" content="<?php echo $description; ?>" />
<link href="<?php echo Kohana::config('core.static_website');?>css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
<div id="logo">
<h1><a href="<?php echo url::base(); ?>">新贵族 </a></h1>
<p>名车，名酒，时尚，总有你要的</p>
</div>
<hr />
<!-- end #logo -->
<div id="header">
<div id="menu">
<ul>
	<li <?php if (Router::$controller == 'article') { ?> class="current_page_item" <?php } ?>><a href="<?php echo url::base(); ?>" class="first">首页</a></li>
	<li <?php if (Router::$controller == 'tab') { ?> class="current_page_item" <?php } ?>><a href="<?php echo url::site('tab'); ?>">标签</a></li>
	<li><a href="<?php echo url::site('sitemap'); ?>" target="_blank">网站地图</a></li>
</ul>
</div>
<!-- end #menu -->
<div id="search">
<form method="get" action="<?php echo url::site('article/search'); ?>" target="_blank">
<fieldset>
<input type="text" name="key" id="search-text" size="15" /> 
<input type="submit" id="search-submit" value="GO" /></fieldset>
</form>
</div>
<!-- end #search --></div>
<!-- end #header -->
<!-- end #header-wrapper -->
<div id="page">
<div id="content">
		<?php echo $content; ?>
		</div>
<!-- end #content -->
<div id="sidebar">
<ul>
	<li>
		<p>这里是新贵族们的世界</p>
		<?php if (Auth::instance ()->logged_in ( 'ADMIN' )) {?>
		<p><a href="<?php echo url::site('admin/welcome'); ?>">管理</a></p>
		<p><a href="<?php echo url::site('user/logout'); ?>">退出</a></p>
		<?php } else { ?>
		<p><a href="<?php echo url::site('user/login'); ?>">登录</a></p>
		<?php } ?>
	</li>
	<?php if(Router::$controller == 'article' && Router::$method == 'view' && count(Router::$arguments) > 0) { ?>
	<li><?php echo article_block::relative_articles(Router::$arguments[0]); //相关文章?></li>
	<?php } ?>
	<li><?php echo article_block::new_articles(); ?></li>
	<li><?php echo article_block::rand_articles(); ?></li>
	<li><?php echo category_block::category_list(); ?></li>
</ul>
</div>
<!-- end #sidebar -->
<div style="clear: both;">&nbsp;</div>
</div>
<!-- end #page -->
<div id="footer">
<p>Copyright (c) 2008 chentu.info. All rights reserved.</p>
</div>
<!-- end #footer -->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-16790085-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</body>
</html>
