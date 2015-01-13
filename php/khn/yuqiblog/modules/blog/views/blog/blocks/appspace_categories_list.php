<h2>分类</h2>
<ul>
	<li><a href="<?php echo url::site_userid('article/manage');?>">全部文章</a></li>
	<?php if (isset($categories) && is_array($categories) && count($categories) > 0) { ?>
	<?php foreach ($categories as $cate) { ?>
	<li><a href="<?php echo url::site_userid('article/manage/' . $cate->id);?>"><?php echo $cate->name; ?>(<?php echo $cate->num; ?>)</a></li>
	<?php } ?>
	<?php } ?>
	<li><a href="<?php echo url::site_userid('article/manage/-1');?>">未分类(<?php echo $uncate; ?>)</a></li>
</ul>