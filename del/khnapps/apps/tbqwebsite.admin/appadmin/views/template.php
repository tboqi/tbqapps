<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><?php echo $title ?></title>
<!--											 CSS											 -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="<?php echo Resource::css('reset.css'); ?>" type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="<?php echo Resource::css('style.css'); ?>" type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="<?php echo Resource::css('invalid.css'); ?>" type="text/css" media="screen" />
<!--											 Javascripts											 -->
<!-- jQuery -->
<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript">
$.websiteroot = '<?php echo url::base(); ?>';
</script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="<?php echo Resource::js("facebox.js"); ?>"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="<?php echo Resource::js("jquery.wysiwyg.js"); ?>"></script>
<!-- jQuery Configuration -->
<script type="text/javascript" src="<?php echo Resource::js("simpla.jquery.configuration.js"); ?>"></script>
<!-- jQuery Datepicker Plugin -->
</head>
<body>
<div id="body-wrapper">
	<!-- Wrapper for the radial gradient background -->
	<div id="sidebar">
		<div id="sidebar-wrapper">
			<!-- Sidebar with logo and menu -->
			<h1 id="sidebar-title"><a href="<?php echo URL::base(); ?>">后台管理</a></h1>
			<!-- Logo (221px wide) -->
			<a href="<?php echo URL::base(); ?>"><img id="logo" src="<?php echo Resource::image("logo.png"); ?>" alt="后台管理" /></a>
			<!-- Sidebar Profile links -->
			<?php /*<div id="profile-links"> Hello, <a href="#" title="Edit your profile">865171</a>, you have <a href="#messages" rel="modal" title="3 Messages">3 Messages</a><br />*/?>
			<div id="profile-links"> 你好管理员 admin <br />
				<br />
				<a href="<?php echo URL::base(); ?>" title="查看网站">查看网站</a> | <a href="<?php echo URL::site('user/logout'); ?>" title="退出">退出</a> </div>
			<ul id="main-nav">
				<!-- Accordion Menu -->
				<li> <a href="<?php echo URL::site(); ?>" class="nav-top-item <?php if (Request::current()->controller() == 'index' || Request::current()->controller() == 'website') echo 'current'; ?> no-submenu">控制面板</a> 
					<ul>
						<li><a <?php if (Request::current()->controller() == 'website' && Request::current()->action() == 'baseinfo') echo 'class="current"'; ?> href="<?php echo URL::site('website/baseinfo'); ?>">网站基本信息</a></li>
						<li><a <?php if (Request::current()->controller() == 'website' && Request::current()->action() == 'contact') echo 'class="current"'; ?> href="<?php echo URL::site('website/contact'); ?>">联系方式</a></li>
					</ul>
				</li>
				<li> <a href="<?php echo URL::site('article/index'); ?>" class="nav-top-item <?php if (Request::current()->controller() == 'article' || Request::current()->controller() == 'article_category' || Request::current()->controller() == 'article_comment') echo 'current'; ?>"> 文章管理 </a>
					<ul>
						<li><a <?php if (Request::current()->controller() == 'article' && Request::current()->action() == 'create') echo 'class="current"'; ?> href="<?php echo URL::site('article/create'); ?>">写新文章</a></li>
						<li><a <?php if (Request::current()->controller() == 'article' && Request::current()->action() == 'index') echo 'class="current"'; ?> href="<?php echo URL::site('article/index'); ?>">文章管理</a></li>
						<li><a <?php if (Request::current()->controller() == 'article_category') echo 'class="current"'; ?> href="<?php echo URL::site('article_category'); ?>">分类管理</a></li>
						<li><a <?php if (Request::current()->controller() == 'article_comment') echo 'class="current"'; ?> href="<?php echo URL::site('article_comment'); ?>">评论管理</a></li>
					</ul>
				</li>
				<li> <a href="<?php echo URL::site('link/index'); ?>" class="nav-top-item <?php if (Request::current()->controller() == 'link' || Request::current()->controller() == 'link_category') echo 'current'; ?>"> 链接管理 </a>
					<ul>
						<li><a <?php if (Request::current()->controller() == 'link') echo 'class="current"'; ?> href="<?php echo URL::site('link'); ?>">友情链接</a></li>
						<li><a <?php if (Request::current()->controller() == 'link_category') echo 'class="current"'; ?> href="<?php echo URL::site('link_category'); ?>">链接分类</a></li>
					</ul>
				</li>
				<li> <a href="<?php echo URL::site('product/index'); ?>" class="nav-top-item <?php if (Request::current()->controller() == 'product' || Request::current()->controller() == 'product_category') echo 'current'; ?>"> 产品管理 </a>
					<ul>
						<li><a <?php if (Request::current()->controller() == 'product_category') echo 'class="current"'; ?> href="<?php echo URL::site('product_category/index'); ?>">分类管理</a></li>
						<li><a <?php if (Request::current()->controller() == 'product' && Request::current()->action() == 'index') echo 'class="current"'; ?> href="<?php echo URL::site('product/index'); ?>">产品管理</a></li>
						<li><a <?php if (Request::current()->controller() == 'product' && Request::current()->action() == 'create') echo 'class="current"'; ?> href="<?php echo URL::site('product/create'); ?>">产品添加</a></li>
					</ul>
				</li>
				<?php /*
				<li> <a href="#" class="nav-top-item"> Events Calendar </a>
					<ul>
						<li><a href="#">Calendar Overview</a></li>
						<li><a href="#">Add a new Event</a></li>
						<li><a href="#">Calendar Settings</a></li>
					</ul>
				</li>
				<li> <a href="#" class="nav-top-item"> Settings </a>
					<ul>
						<li><a href="#">General</a></li>
						<li><a href="#">Design</a></li>
						<li><a href="#">Your Profile</a></li>
						<li><a href="#">Users and Permissions</a></li>
					</ul>
				</li>
				*/?>
			</ul>
			<!-- End #main-nav -->
		</div>
	</div>
	<!-- End #sidebar -->
	<div id="main-content">
		<!-- Main Content Section with everything -->
		<noscript>
		<!-- Show a notification if the user has disabled javascript -->
		<div class="notification error png_bg">
			<div> Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
				Download From <a href="http://www.exet.tk">exet.tk</a></div>
		</div>
		</noscript>
		<!-- Page Head -->
		<?php echo $content;?>
		<div id="footer"> <small>
			<!-- Remove this notice or replace it with whatever you want -->
			&#169; Copyright 2010 Your Company | Powered by <a href="http://www.chentu.info" target="_blank">chentu</a> </small> </div>
		<!-- End #footer -->
	</div>
	<!-- End #main-content -->
</div>
</body>
</html>
