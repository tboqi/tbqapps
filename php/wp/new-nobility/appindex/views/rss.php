<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
<channel>
	<title><![CDATA[新贵族]]></title>
	<description><![CDATA[一个21世纪贵族们的聚居地，一个豪华高尚的俱乐部]]></description>
	<link>http://chentu.info/</link>
	<language>zh-cn</language>
	<generator>chentu.info</generator>
	<ttl>60</ttl>
	<?php foreach ($articles as $article) { ?>
	<item>
		<title><![CDATA[<?php echo $article->title; ?>]]></title>
		<link><![CDATA[<?php echo url::site('article/view' . $article->id); ?>]]></link>
		<description><![CDATA[<?php echo empty($article->summary) ? $article->content : $article->summary; ?>]]></description>
		<pubDate><?php echo $article->create_time; ?></pubDate>
		<author><![CDATA[<?php echo $article->user->nickname; ?>]]></author>
		<guid><?php echo url::site('article/view' . $article->id); ?></guid>
	</item>
	<?php } ?>
</channel>
</rss>