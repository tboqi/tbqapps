<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="20">
				<div align="left"></div>
				</td>
				<td>
				<div align="left">作者: <a href="<?php echo url::site_space('?user_id=' . $article->user_id); ?>" target="_blank"><?php echo $article->nickname; ?></a> 日期: <?php echo date('Y-m-d', $article->create_time); ?> 点击次数: <?php echo $article->read_times; ?> 查看原文</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="center"><?php echo $article->title; ?></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="400" valign="top"><?php echo $article->content; ?></td>
	</tr>
	<tr>
		<td>
		<div align="center">评论</div>
		</td>
	</tr>
	<?php if (isset($comments) && is_array($comments) && count($comments) > 0) { ?>
  <?php foreach ($comments as $comment) { ?>
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
	<tr>
		<td>
		<div align="center">发表评论</div>
		</td>
	</tr>
	<tr>
		<td><?php if (Auth::instance()->logged_in()) { ?>
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
		</td>
	</tr>
</table>