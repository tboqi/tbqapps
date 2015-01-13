<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title><?php echo $pageTitle;?>::<?php echo $globalTitle;?>----<?php echo $slogan;?></title>
<link rel="stylesheet" href="<?php echo url::base(); ?>css/main.css" type="text/css" />
<script type="text/javascript" src="<?php echo url::base(); ?>js/jquery-1.2.3.pack.js"></script>
<script type="text/javascript" src="<?php echo url::base(); ?>js/jquery.form.js"></script>
<script type="text/javascript" src="<?php echo url::base(); ?>fck/fckeditor.js"></script>
<?php if(is_array($myjavascripts) && count($myjavascripts) > 0) {
	foreach ($myjavascripts as $js) {
	?>
	<script type="text/javascript" src="<?php echo url::base(); ?>js/<?php echo $js; ?>.js"></script>
	<?php 
	}
}
?>
</head>

<body>
<table width="800" height="109" border="0" align="center" cellpadding="0" cellspacing="0" 
background="<?php echo url::base(); ?>/images/header_bg.gif">
  <tr>
    <td height="75"><table width="100%" height="74" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="295"><img src="<?php echo url::base(); ?>/images/logo.gif" 
        width="295" height="74" /></td>
        <td width="33"><img src="<?php echo url::base(); ?>/images/index_02.gif" 
        width="33" height="74" /></td>
        <td>
        	<a href="<?php echo url::site(); ?>">首页</a>
        	<?php foreach ( $categoriesExceptGonggao as $category ) { ?>
        	|&nbsp;<a href="<?php echo url::site("article/findArticlesByCategory/<?php echo $category->id; ?>") ?>"><?php echo $category->name; ?></a>
        	<?php } ?>
        </td>
        <td width="21"><img src="<?php echo url::base(); ?>/images/index_05.gif" 
        width="21" height="74" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="32" valign="top"><img src="<?php echo url::base(); ?>/images/laba.gif"/></td>
        <td width="55"><span class="STYLE1">最新公告</span></td>
        <td width="713"><marquee direction="left" onmouseover="this.stop();" 
        onmouseout="this.start();" scrollamount="3">
          <a href="<?php echo url::site("article/detail/{$gonggao->id}"); ?>" target="_blank"><?php echo $gonggao->title; ?></a>[<?php echo $gonggao->nickname; ?>  <?php echo date("Y年m月d日", $gonggao->create_time); ?>]
        </marquee></td>
      </tr>
    </table></td>
  </tr>
</table>
<?php echo $content ?>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="34" align="center"><div align="center"><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.lyingo.com');" href="#">设为首页</a>?|?<a href="javascript:window.external.addFavorite('http://www.lyingo.com','中国农业致富网')">加入收藏</a>?|?<a href="mailto:sdlyingo@126.com">联系站长</a>?|?<a href="#" target="_blank">友情链接</a><img src="<?php echo url::base(); ?>/images/new9.gif" width="30" border="0" height="14" />?|?<a href="http://www.lyingo.com/Copyright.asp" target="_blank">版权申明</a> | <a href="http://www.lyingo.com/about.asp" target="_blank">关于我们</a> | <a href="http://www.lyingo.com/jiage.asp" target="_blank">广告投放</a> | <a href="http://www.lyingo.com/pay.asp" target="_blank">会员资费</a> | <a href="http://www.lyingo.com/so/" target="_blank">企业登录</a></div></td>
  </tr>
  <tr>
    <td height="30" align="center">与普通网站不同，中国农业致富网的内容都来自于正式发行的学术期刊，从而保证了内容的学术价值</td>
  </tr>
  <tr>
    <td align="center"><img src="<?php echo url::base(); ?>/images/2005_di_bj.gif" width="770" height="53" /></td>
  </tr>
</table>
</body>
</html>
