<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>后台管理</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="<?php echo Resource::css('reset.css'); ?>" type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="<?php echo Resource::css('style.css'); ?>" type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="<?php echo Resource::css('invalid.css'); ?>" type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript" src="<?php echo Resource::js_common("jquery.js"); ?>"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="<?php echo Resource::js("jquery.wysiwyg.js"); ?>"></script>
<script type="text/javascript" src="<?php echo Resource::js_common('jquery.form.js'); ?>"></script>
<script type="text/javascript" src="<?php echo Resource::js_common('yuqi_utils.js'); ?>"></script>
</head>
<body id="login">
<div id="login-wrapper" class="png_bg">
  <div id="login-top">
    <h1>后台管理</h1>
    <!-- Logo (221px width) -->
    <a href="<?php echo URL::site(); ?>"><img id="logo" src="<?php echo Resource::image("logo.png"); ?>" alt="Simpla Admin logo" /></a> </div>
  <!-- End #logn-top -->
  <div id="login-content">
    <form id="userLoginForm" action="<?php echo URL::site('user/login_do'); ?>" method="post">
      <div class="notification information png_bg">
        <div> 请输入帐号和密码 </div>
      </div>
      <p>
        <label>帐号</label>
        <input class="text-input" name="username" type="text" />
      </p>
      <div class="clear"></div>
      <p>
        <label>密码</label>
        <input class="text-input" name="password" type="password" />
      </p>
      <div class="clear"></div>
      <p id="remember-password">
        <input type="checkbox" />
        记住我 </p>
      <div class="clear"></div>
      <p>
      	<button type="submit">登录</button>
      </p>
    </form>
  </div>
  <!-- End #login-content -->
</div>
<!-- End #login-wrapper -->
</body>
</html>
