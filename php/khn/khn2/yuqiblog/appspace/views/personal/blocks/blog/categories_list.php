<div class="left_menu_title">分类</div>
<a href="<?php echo url::site_userid('article/manage');?>">全部文章</a>
<?php if (isset($categories) && is_array($categories) && count($categories) > 0) { ?>
<?php foreach ($categories as $cate) { ?>
<a href="<?php echo url::site_userid('article/manage/' . $cate->id);?>"><?php echo $cate->name; ?>(<?php echo $cate->num; ?>)</a>
<?php } ?>
<?php } ?>
<a href="<?php echo url::site_userid('article/manage/-1');?>">未分类(<?php echo $uncate; ?>)</a>