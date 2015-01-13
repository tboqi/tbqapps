<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="28%" height="35">
		<div align="center"><img src="<?php echo url::base(); ?>images/denglu.gif" width="33"
			height="26"></div>
		</td>
		<td width="76%">
		<div align="center" class="style_1">会 员 登 陆</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<form method="post" action="<?php echo url::site ( 'user/login' ); ?>">
		<table width="170" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#CCCCCC">
			<tr>
				<td bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="18" colspan="2"></td>
					</tr>
					<tr>
						<td width="32%">
						<div align="center">用户名</div>
						</td>
						<td width="68%" height="32"><INPUT id="username" style="WIDTH: 100px; HEIGHT: 12px" size=15 name="username"></td>
					</tr>
					<tr>
						<td>
						<div align="center">密 &nbsp;码</div>
						</td>
						<td height="32"><INPUT id="password" style="WIDTH: 100px; HEIGHT: 13px" type=password size=15 name="password"></td>
					</tr>
					<tr>
						<td height="26" colspan="2">
						<div align="center">
							<input type="image" src="<?php echo url::base(); ?>images/login.gif" width="51" height="18" border="0">
							&nbsp;&nbsp;&nbsp;
							<a href="<?php echo url::site('user/regist');?>"><img src="<?php echo url::base(); ?>images/reg.gif" width="51" height="18" border="0"></a>
						</div>
						</td>
					</tr>
					<tr>
						<td height="10" colspan="2">&nbsp;</td>
					</tr>
				</table>
				</form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>