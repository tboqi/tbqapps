<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_1.gif">&nbsp;</td>
    <td width="30" height="26"><div align="center"><img src="<?php echo url::base(); ?>images/dian_1.gif" width="20" height="11"></div></td>
    <td>您现在的位置：<?php foreach ($nav as $n) { echo $n; ?> &gt;&gt; <?php } ?><span class="style8">正文</span></td>
    <td width="160"><div align="center"><?php echo date('Y年m月d日'); ?> <span class="style8"><?php echo date::weekday(); ?></span></div></td>
    <td width="7" background="<?php echo url::base(); ?>images/bg_all_2.gif">&nbsp;</td>
  </tr>
</table>