<h2>文章分类</h2>
<ul>
	<?php foreach($categories as $cate) {?>
	<li><a href="<?php echo url::site('article/category/' . $cate->id); ?>"><?php echo $cate->name; ?>(<?php echo intval($cate->num); ?>)</a></li>
	<?php } ?>
</ul>