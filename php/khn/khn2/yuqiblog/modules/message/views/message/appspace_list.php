<?php
switch ($boxtype) {
	case 1 :
		echo '<h1>收件箱</h1> <a href="' . url::site('message/outbox') . '">发件箱</a> <a href="' . url::site('message/trashcan') . '">垃圾箱</a>';
		break;
	
	case 2 :
		echo '<a href="' . url::site('message/inbox') . '">收件箱</a> <h1>发件箱</h1> <a href="' . url::site('message/trashcan') . '">垃圾箱</a>';
		break;
	
	default :
		echo '<a href="' . url::site('message/inbox') . '">收件箱</a> <a href="' . url::site('message/outbox') . '">发件箱</a> <h1>垃圾箱</h1>';
		break;
}
?>

<table>
	<tr>
		<th><?php
		switch ($boxtype) {
			case 1 :
				echo '发件人';
				break;
			
			case 2 :
				echo '收件人';
				break;
			
			default :
				echo '发件人</th><th>收件人';
				break;
		}
		?></th>
		<th>标题</th>
		<th>时间</th>
		<th>删除</th>
	</tr>
	<?php if (isset($messages) && is_array($messages) && count($messages) > 0) { ?>
	<?php foreach ($messages as $msg) { ?>
	<tr>
		<td><?php
		switch ($boxtype) {
			case 1 :
				echo "<a href=\"" . url::site('?user_id=' . $msg->from_id) . "\" target=\"_blank\">{$msg->from_nickname}</a>";
				break;
			
			case 2 :
				echo "<a href=\"" . url::site('?user_id=' . $msg->to_id) . "\" target=\"_blank\">{$msg->to_nickname}</a>";
				break;
			
			default :
				echo "<a href=\"" . url::site('?user_id=' . $msg->from_id) . "\" target=\"_blank\">{$msg->from_nickname}</a></th><th><a href=\"" . url::site('?user_id=' . $msg->to_id) . "\" target=\"_blank\">{$msg->to_nickname}</a>";
				break;
		}
		?></td>
		<td><?php
		if ($msg->is_read == 0 && $boxtype == 1) {
			echo '<img src="' . url::base() . 'images/icon_mail_unread.gif" />';
		}
		echo "<a href=\"" . url::site('message/view/' . $msg->id) . "\">{$msg->title}</a>"; 
		?></td>
		<td><?php echo date('Y-m-d', $msg->create_time); ?></td>
		<td><?php
		switch ($boxtype) {
			case 1 :
				echo "<a href=\"" . url::site('message/remove/' . $msg->id) . "\">remove</a>";
				break;
			
			case 2 :
				echo "<a href=\"" . url::site('message/remove/' . $msg->id) . "\">remove</a>";
				break;
			
			default :
				echo "<a href=\"" . url::site('message/restore/' . $msg->id) . "\">restore</a>";
				break;
		}
		?></td>
	</tr>
	<?php } ?>
	<?php } else { ?>
	<tr>
		<td colspan="4">没有信息</td>
	</tr>
<?php } ?>
</table>