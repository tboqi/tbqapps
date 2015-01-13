<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $page_title; ?>:<?php echo $website_title; ?></title>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<meta name="description" content="<?php echo $description; ?>" />
<?php /* for jquery start */?>
<script type="text/javascript" src="<?php echo url::base (); ?>js/jquery.js"></script>
<script type="text/javascript" src="<?php echo url::base (); ?>js/jquery.form.js"></script>
<?php /* for jquery end */?>
<script type="text/javascript" src="<?php echo url::base (); ?>js/yuqi_utils.js"></script>
<link href="<?php echo url::base (); ?>css/yilinweb.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-image: url(<?php echo url::base(); ?>images/bg.gif);
}
.MAINBORDER {	BACKGROUND-COLOR: #F8F8F8; BORDER-RIGHT: #E1E1E1 1PX SOLID; BORDER-TOP: #E1E1E1 1PX SOLID; BORDER-LEFT: #E1E1E1 1PX SOLID; COLOR: #037FA8; BORDER-BOTTOM: #E1E1E1 1PX SOLID; HEIGHT: 25px
}
-->
</style></head>

<body>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td width="200" background="<?php echo url::base(); ?>images/bg_top.gif">&nbsp;</td>
    <td width="19"><img src="<?php echo url::base(); ?>images/top_line_02.gif" width="32" height="19"></td>
    <td background="<?php echo url::base(); ?>images/bg_top_02.gif"> <div align="right"> <a href="javascript:window.external.AddFavorite('http://www.sgyxw.com','三国游戏网')">加为收藏</a> | <A href="#" target="_self" class="lianjie_hei" onclick='this.style.behavior="url(#default#homepage)";this.setHomePage("http://www.sgyxw.com")'>设为主页</a>&nbsp; </div></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td height="30" background="<?php echo url::base(); ?>images/topbg.gif"><?php echo appindex::mainmenu(); ?></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td height="100"><div align="center">banner</div></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td height="30" background="<?php echo url::base(); ?>images/top_nav_menu.gif"><?php echo appindex::mainmenu(); ?></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
<?php echo $content; ?>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td height="26"><div align="center">关于本站 - 版权声明 - 新闻发布 - 网站帮助 - 广告联系 - 友情连接 - 用户注册</div></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td height="50"><div align="center">Copyright &copy; 2007-2008 Yilinweb.Com , All Rights Reserved</div></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>
</body>
</html>
