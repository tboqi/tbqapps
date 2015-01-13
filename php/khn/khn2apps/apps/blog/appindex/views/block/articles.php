<h2><?php echo $title; ?></h2>
<ul>
	<?php foreach ( $articles as $article ) { ?>
	<li><a href="<?php echo url::site ( 'article/view/' . $article->id ); ?>"><?php echo $article->title; ?></a></li>
	<?php } ?>
</ul>
