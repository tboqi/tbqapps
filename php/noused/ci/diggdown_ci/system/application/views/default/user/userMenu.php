<?php echo $my->nickname; ?>
<ul>
	<li><a href="<?php echo site_url("category/add"); ?>">添加分类</a></li>
	<li><a href="<?php echo site_url("category/myCategory"); ?>">我的分类</a></li>
	<li><a href="<?php echo site_url("download/add"); ?>">添加下载</a></li>
	<li><a href="<?php echo site_url("download/myDownloads"); ?>">我的下载</a></li>
	<li><a href="<?php echo site_url("user/editPassword"); ?>">修改密码</a></li>
	<li><a href="<?php echo site_url("user/edit"); ?>">编辑信息</a></li>
	<li><a href="<?php echo site_url("user/logout"); ?>">退出</a></li>
</ul>