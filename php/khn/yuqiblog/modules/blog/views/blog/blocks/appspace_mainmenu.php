<ul>
  <li><a href="<?php echo url::site_index(); ?>">网站首页</a></li>
  <li><a href="<?php echo url::site_userid(); ?>"<?php if (url::current() == 'welcome') echo ' class="here"'; ?>>空间首页</a></li>
  <?php if (Auth::instance()->logged_in()) {?>
  <li><a href="<?php echo url::site_index('user/logout'); ?>">退出</a></li>
  <?php } ?>
</ul>