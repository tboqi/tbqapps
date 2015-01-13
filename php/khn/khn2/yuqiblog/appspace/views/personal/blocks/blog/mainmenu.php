<div class="nav_bar">
	<a href="<?php echo url::site_index(); ?>">网站首页</a>
	<a href="<?php echo url::site_userid(); ?>">空间首页</a>
	<?php if (Auth::instance()->logged_in()) {?>
	<a href="<?php echo url::site_index('user/logout'); ?>">退出</a>
	<?php } ?>
</div>