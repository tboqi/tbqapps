<?php echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>"; ?>
<rss version="2.0">
<channel>
	<title><![CDATA[<?php echo Kohana::$config->load('site.web_title'); ?>]]></title>
	<description><![CDATA[<?php echo Kohana::$config->load('site.declaration'); ?>]]></description>
	<link>http://<?php echo Kohana::$config->load('site.domain'); ?>/</link>
	<language>zh-cn</language>
	<generator>chentu.info</generator>
	<ttl>60</ttl>
	<?php foreach ($articles as $article) { ?>
	<item>
		<title><![CDATA[<?php echo $article->title; ?>]]></title>
		<link><![CDATA[<?php echo url::site('article/view/' . $article->id); ?>]]></link>
		<description><![CDATA[<?php echo empty($article->summary) ? $article->content : $article->summary; ?>]]></description>
		<pubDate><?php echo $article->create_time; ?></pubDate>
		<?php //<author><![CDATA[ echo $article->user->nickname;]]></author> ?>
		<guid><?php echo url::site('article/view' . $article->id); ?></guid>
	</item>
	<?php } ?>
</channel>
</rss>