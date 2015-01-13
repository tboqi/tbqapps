<h1>编辑信息</h1>
<form id="profile" name="profile" method="post" action="">
  <table border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td>帐号</td>
      <td><?php echo $this->logged_user->username; ?></td>
    </tr>
    <tr>
      <td>昵称</td>
      <td><input name="nickname" type="text" id="nickname" value="<?php echo $this->logged_user->nickname; ?>" size="20" /></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><?php echo $this->logged_user->email; ?></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="button" id="button" value="提交" /></td>
    </tr>
  </table>
</form>