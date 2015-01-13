<table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td bgcolor="#EEEEEE">
    <?php if (Auth::instance ()->logged_in ()) { ?>
    &nbsp;欢迎你，<?php echo Auth::instance ()->get_user ()->nickname; ?>！<br />
    <a href="<?php echo url::site_space (); ?>">我的空间</a><br />
    <a href="<?php echo url::site ( 'user/logout' ); ?>">退出</a>
    <?php } else { echo new View('user/blocks/appindex_login'); } ?>
    </td>
  </tr>
</table>