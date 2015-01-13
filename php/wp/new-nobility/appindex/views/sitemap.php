<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
	xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">
	<?php foreach($articles as $article) { ?>
	<url>
		<loc><?php echo url::site('article/view/' . $article->id); ?></loc>
	</url>
	<?php } ?>
</urlset>
