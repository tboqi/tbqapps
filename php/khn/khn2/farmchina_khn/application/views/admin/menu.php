<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php new View("admin/meta"); ?>
<title>菜单</title>
</head>

<body>
<ul>
	<li><a href="<?php echo url::site("admin/article/add"); ?>" target="mainFrame">添加文章</a></li>
	<li><a href="<?php echo url::site("admin/article/articlelist"); ?>" target="mainFrame">文章列表</a></li>
	<li><a href="<?php echo url::site("admin/user/editPassword"); ?>" target="mainFrame">修改密码</a></li>
	<li><a href="<?php echo url::site("admin/user/logout"); ?>" target="_parent">退出</a></li>
</ul>
</body>
</html>
