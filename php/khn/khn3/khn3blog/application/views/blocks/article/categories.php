<li>
	<h2>分类列表</h2>
	<ul>
		<?php foreach($categories as $category) { ?>
		<li>
			<a href="<?php echo URL::site('article/category/' . $category->id); ?>"><?php echo $category->name; ?></a>
		</li>
		<?php } ?>
	</ul>
</li>