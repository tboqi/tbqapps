<li>
	<h2>热门文章</h2>
	<ul>
		<?php foreach ($articles as $art) {?>
		<li><a href="<?php echo URL::site('article/detail/' . $art->id); ?>"><?php echo $art->title; ?></a></li>
		<?php } ?>
	</ul>
</li>