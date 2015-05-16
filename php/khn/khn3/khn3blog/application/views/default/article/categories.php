<h1><?php echo $title; ?></h1>
<div><a href="<?php echo URL::site('article_category/create'); ?>">添加分类</a></div>
<ul>
	<?php foreach($categories as $category) { ?>
	<li>
		<a href="<?php echo URL::site('article/category/' . $category->id); ?>"><?php echo $category->name; ?></a>
		[<a href="<?php echo URL::site('article_category/edit/' . $category->id); ?>">编辑</a>]
		[<a href="<?php echo URL::site('article_category/del/' . $category->id); ?>">删除</a>]
	</li>
	<?php } ?>
</ul>
