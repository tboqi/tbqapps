<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#EBEBE9">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="30">
				<div align="center"><img src="<?php echo url::base (); ?>images/sgyxw_5_03.gif" width="4" height="15"></div>
				</td>
				<td width="1"><img src="<?php echo url::base (); ?>images/sgyxw_5_02.gif" width="6" height="22"></td>
				<td>
				<div align="center" class="style11">最新文章</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="250" bgcolor="#FFFFFF" valign="top">
		<?php if (isset($articles) && is_array($articles) && count($articles) > 0) { ?>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<?php foreach ( $articles as $article ) { ?>
		  <tr>
				<td height="25"><a href="<?php echo url::site ( 'article/view/' . $article->id ); ?>" target="_blank"><?php echo $article->title; ?></a></td>
			</tr>
		  <?php } ?>
		</table>
		<?php } else { echo '没有文章！'; } ?>
		</td>
	</tr>
</table>