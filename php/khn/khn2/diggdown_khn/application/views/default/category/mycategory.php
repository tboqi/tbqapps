<?php if ($categories) { ?>
<ul>
	<?php foreach ($categories as $cate) { ?>
  <li><a href="<?php echo url::site("download/myDownloadsOfCategory/{$cate->id}") ?>"><?php echo $cate->name; ?></a>
  <a href="<?php echo url::site("category/delete/{$cate->id}") ?>">delete</a></li>
  <?php } ?>
</ul>
<?php } else { ?>
您还没有分类
<?php } ?>