﻿<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>登录 - 后台管理</title>
        <!-- CSS -->
        <link rel="stylesheet" href="<?=$static_pre_url?>css/reset.css">
        <link rel="stylesheet" href="<?=$static_pre_url?>css/supersized.css">
        <link rel="stylesheet" href="<?=$static_pre_url?>css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="page-container">
            <h1>登录</h1>
            <form action="<?php echo URL::site('login/index');?>" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="submit">提交</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>

        <!-- Javascript -->
        <script src="<?=$static_pre_url?>js/jquery-1.8.2.min.js"></script>
        <script src="<?=$static_pre_url?>js/supersized.3.2.7.min.js"></script>
        <script src="<?=$static_pre_url?>js/supersized-init.js"></script>
        <script src="<?=$static_pre_url?>js/scripts.js"></script>
    </body>
</html>