<h1>修改密码</h1>
<?php if (!empty($msg)) { ?>
<div><?php echo $msg; ?></div>
<?php } ?>
<form id="form1" name="form1" method="post" action="">
  <table border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td>旧密码</td>
      <td><input name="oldpassword" type="password" id="oldpassword" size="20" /></td>
    </tr>
    <tr>
      <td>新密码</td>
      <td><input name="newpassword" type="password" id="newpassword" size="20" /></td>
    </tr>
    <tr>
      <td>确认</td>
      <td><input name="password_confirm" type="password" id="password_confirm" size="20" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="确定" /></td>
    </tr>
  </table>
</form>