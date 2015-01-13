<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/">
  <channel>
    <title><?php echo $space->name; ?></title>
    <link>http://<?php echo $_SERVER['SERVER_NAME']; ?>/<?php echo url::site_space("?user_id={$space->id}"); ?></link>
    <description><?php echo $space->description; ?></description>
    <language>zh-cn</language>
    <pubDate><?php echo date(DATE_RSS); ?></pubDate>
    <lastBuildDate><?php echo date(DATE_RSS, time() - 10 * 60); ?></lastBuildDate>
    <generator>yuqiblog</generator>

		<?php foreach ($articles as $article) { ?>
    <item>
      <title><?php echo $article->title; ?></title>
      <link>http://<?php echo $_SERVER['SERVER_NAME']; ?>/<?php echo url::site_space('article/read/' . $article->id . '?user_id=' . $article->user_id ); ?></link>
      <description><?php echo article::summary($article->content); ?></description>
      <pubDate><?php echo date(DATE_RSS, $article->create_time); ?></pubDate>
      <guid>http://<?php echo $_SERVER['SERVER_NAME']; ?>/<?php echo url::site_space('article/read/' . $article->id . '?user_id=' . $article->user_id ); ?></guid>
    </item>
    <?php } ?>
  </channel>
</rss>
