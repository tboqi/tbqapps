<?php if (isset($friends) && is_array($friends) && count($friends) > 0) { ?>
<ul>
	<?php foreach ($friends as $friend)?>
	<li><a href="<?php echo url::site('?user_id=' . $friend->friend_id); ?>"><?php echo $friend->friend_nickname; ?></a></li>
</ul>
<?php } else { ?>
没有好友
<?php } ?>