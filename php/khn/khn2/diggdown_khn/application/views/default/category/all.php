<h1><?php echo $pageTitle; ?></h1>
<?php if(is_array($allCategories) && count($allCategories) > 0) { ?>
<ul>
	<?php foreach ($allCategories as $cate) { ?>
	<li>
		<a href="<?php echo url::site("download/downloadsOfCategory/{$cate->id}") ?>"><?php echo $cate->name; ?></a>
		<?php if ($cate->mycount <= 0) { ?>
		<a href="<?php echo url::site("category/addMyCategory/{$cate->id}") ?>">收藏</a>
		<?php } ?>
	</li>
	<?php } ?>
</ul>
<?php } else { ?>
没有分类
<?php } ?>