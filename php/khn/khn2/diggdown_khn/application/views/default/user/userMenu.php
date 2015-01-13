<?php echo $my->nickname; ?>
<ul>
	<li><a href="<?php echo url::site("category/add"); ?>">添加分类</a></li>
	<li><a href="<?php echo url::site("category/myCategory"); ?>">我的分类</a></li>
	<li><a href="<?php echo url::site("download/add"); ?>">添加下载</a></li>
	<li><a href="<?php echo url::site("download/myDownloads"); ?>">我的下载</a></li>
	<li><a href="<?php echo url::site("user/editPassword"); ?>">修改密码</a></li>
	<li><a href="<?php echo url::site("user/edit"); ?>">编辑信息</a></li>
	<li><a href="<?php echo url::site("user/logout"); ?>">退出</a></li>
</ul>