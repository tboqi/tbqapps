<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#DDDDDD">
	<tr>
		<td bgcolor="#F8F8F8">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="30">
				<div align="center"><img src="<?php echo url::base(); ?>images/announce.gif" width="18" height="18"></div>
				</td>
				<td width="70">
				<div align="center"><?php echo $block_title; ?></div>
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="100">
		<div align="center">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<?php foreach ( $users as $user ) { ?>
				<td height="144" align="center">
				<table height="100" border="0" cellpadding="5" cellspacing="1">
					<tr>
						<td align="center">
						<a href="<?php echo url::site_space('?user_id=' . $user->id); ?>" target="_blank"><?php echo user::avatar($user, 120, 100, Image::NONE); ?></a>
						</td>
					</tr>
				</table>
				<table width="120" border="0" cellpadding="5" cellspacing="1">
					<tr>
						<td height="24" align="center" valign="top"><a href="<?php echo url::site_space('?user_id=' . $user->id); ?>" target="_blank"><?php echo $user->nickname; ?></a></td>
					</tr>
				</table>
				</td>
				<?php } ?>
			</tr>
		</table>
		</div>
		</td>
	</tr>
</table>