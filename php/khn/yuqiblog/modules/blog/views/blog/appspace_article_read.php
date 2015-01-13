<h1><?php echo $article->title; ?></h1>
<table width="200" height="18" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80"><a href="<?php echo url::site('?user_id=' . $user->id); ?>" target="_blank"><?php echo $user->nickname; ?></a></td>
    <td><?php echo date('Y-m-d', $article->create_time); ?></td>
  </tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td><?php echo $article->content; ?></td>
  </tr>
</table>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
	<?php if ($previous_article) { ?>
  <tr>
    <td width="13%">上一篇</td>
    <td width="87%"><a href="<?php echo url::site_userid('article/read/' . $previous_article->id); ?>"><?php echo $previous_article->title; ?></a></td>
  </tr>
  <?php } ?>
  <?php if ($next_article) { ?>
  <tr>
    <td width="13%">下一篇</td>
    <td width="87%"><a href="<?php echo url::site_userid('article/read/' . $next_article->id); ?>"><?php echo $next_article->title; ?></a></td>
  </tr>
  <?php } ?>
</table>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#999999">
  <tr>
    <td><strong>文章评论</strong></td>
  </tr>
  <?php if (isset($comments) && is_array($comments) && count($comments) > 0) { ?>
  <?php foreach ($comments as $comment) {?>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="<?php echo url::site("?user_id={$comment->user_id}"); ?>" target="_blank"><?php echo $comment->nickname; ?> &nbsp;</a>&nbsp;<?php echo date('Y-m-d', $comment->create_time); ?></td>
      </tr>
      <tr>
        <td><?php echo $comment->content; ?></td>
      </tr>
    </table></td>
  </tr>
  <?php } ?>
  <?php } else {?>
  <tr>
    <td>没有评论</td>
  </tr>
  <?php } ?>
</table>
<?php if (Auth::instance()->logged_in()) { ?>
<form action="<?php echo url::site('comment/save'); ?>" method="post">
<table>
	<tr>
		<td><textarea id="content" name="content"></textarea></td>
	</tr>
	<tr>
		<td><input type="submit" value="评论" /></td>
	</tr>
</table>
<input type="hidden" name="article_id" value="<?php echo $article->id; ?>">
<input type="hidden" name="user_id" value="<?php echo $user->id; ?>">
</form>
<?php } else { ?>
<table>
	<tr>
		<td>您登录后可以进行评论</td>
	</tr>
</table>
<?php } ?>