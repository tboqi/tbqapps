<?php echo $navigation; ?>
<table width="776" border="0" align="center" cellpadding="0"
	cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
		<td width="5">&nbsp;</td>
		<td width="180" valign="top">
		<?php echo new View('user/blocks/appindex_user_center'); ?>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
			<tr>
				<td bgcolor="#EEEEEE">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="middle">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="30">
								<div align="center"><img src="<?php echo url::base(); ?>images/sgyxw_5_03.gif" width="4" height="15"></div>
								</td>
								<td width="1"><img src="<?php echo url::base(); ?>images/sgyxw_5_02.gif" width="6" height="22"></td>
								<td>
								<div align="center" class="style11">站内搜索</div>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<form method=post name=form action="<?php echo url::site('search'); ?>">
					<tr>
						<td height="30" valign="top" class="LEFTTDBG1">
							<input name="keyword" type="text" size="20" value="<?php echo $_REQUEST['keyword']; ?>">
						</td>
					</tr>
					<tr>
						<td height="30" valign="top" class="LEFTTDBG1">
							<select name="select">
								<option value="article">文章搜索</option>
								<option value="user">用户搜索</option>
							</select> &nbsp; 
							<input type="submit" name="Submit" value="搜 索">
						</td>
					</tr>
					</form>
				</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
		<?php echo article_block::new_articles();?>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table>
      <?php echo user_block::online_users(10); ?>
		</td>
		<td width="8">&nbsp;</td>
		<td valign="top">
		<table width="100%" border="0" cellpadding="0" cellspacing="1"
			bgcolor="#DDDDDD">
			<tr>
				<td bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="10" height="26" background="<?php echo url::base(); ?>images/TH_BG.gif">
						<div align="center"><img src="<?php echo url::base(); ?>images/icon_lanse.gif" width="30"
							height="20"></div>
						</td>
						<td background="<?php echo url::base(); ?>images/TH_BG.gif" class="style14">
						<div align="left"><?php echo $subtitle; ?></div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="595" align="center" valign="top" bgcolor="#FFFFFF">
				<div align="center">
				<?php echo $content; ?>
				</div>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="10"></td>
			</tr>
		</table>
		</td>
		<td width="5">&nbsp;</td>
		<td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
	</tr>
</table>