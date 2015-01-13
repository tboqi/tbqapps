<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#EBEBE9">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="30">
				<div align="center"><img src="<?php echo url::base (); ?>images/sgyxw_5_03.gif" width="4" height="15"></div>
				</td>
				<td width="1"><img src="<?php echo url::base (); ?>images/sgyxw_5_02.gif" width="6"
					height="22"></td>
				<td>
				<div align="center"><span class="style11">在线用户</span></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="250" bgcolor="#FFFFFF" valign="top">
    <?php if (isset ( $online_users ) && is_array ( $online_users ) && count ( $online_users ) > 0) { ?>
    <?php foreach ( $online_users as $user ) { ?>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><a href="<?php url::site_space ( '?user_id=' . $user->id ); ?>" target="_blank"><?php echo $user->nickname; ?></a></td>
			</tr>
		</table>
    <?php } ?>
    <?php } else { echo '没有在线用户'; } ?>
    </td>
	</tr>
</table>