<?php echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>
<?php echo '<?xml-stylesheet type="text/xsl" href="' . $domain . 'static/sitemap.xsl"?>'; ?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	<url>
		<loc><?php echo $domain; ?></loc>
		<lastmod><?php echo date('Y-m-d H:i:s+00:00'); ?></lastmod>
		<changefreq>daily</changefreq>
		<priority>1.0</priority>
	</url>
	<!-- Debug: Start Postings -->
	<?php foreach ($articles as $art) { ?>
	<url>
		<loc><?php echo $domain; ?>/article/detail/<?php echo $art->id; ?></loc>
		<lastmod><?php echo date('Y-m-d H:i:s+00:00', $art->create_time); ?></lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.2</priority>
	</url>
	<?php } ?>
	<!-- Debug: End Postings -->
<!-- Debug: Start Custom Pages -->
<!-- Debug: End Custom Pages -->
<!-- Debug: Start additional URLs -->
<!-- Debug: End additional URLs -->
</urlset>