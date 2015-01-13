<?php if (isset($articles) && is_array($articles) && count($articles) > 0) { ?>
<ul>
	<?php foreach ($articles as $article) { ?>
	<li><a href="<?php echo url::site('article/view/' . $article->id); ?>"><?php echo $article->title; ?></a></li>
	<?php } ?>
</ul>
<?php } else { echo '没有找到文章'; } ?>