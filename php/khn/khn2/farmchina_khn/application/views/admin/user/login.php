<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php new View("admin/meta"); ?>
<title>登录</title>
</head>

<body>
<?php 
if(isset($errors) && is_array($errors) && count($errors) > 0) {
	?>
	<ul>
	   <?php foreach ($errors as $e) { ?>
	   <li><?php echo $e; ?></li>
	   <?php } ?>
	</ul>
	<?php 
}
?>
<?php echo form::open ( 'admin/user/login', array ('id' => "userLogin" ) ); ?>
  <table width="200" border="1" align="center">
    <tr>
      <td colspan="2"><div align="center">登录</div></td>
    </tr>
    <tr>
      <td width="61">用户名</td>
      <td width="123"><input name="username" type="text" id="username" size="20" value='<?php echo $username; ?>' /></td>
    </tr>
    <tr>
      <td>密码</td>
      <td><input name="password" type="password" id="password" size="20" /></td>
    </tr>
    <tr>
      <td colspan="2">
      <input name="flag" type="hidden" id="flag" value="do" />
      <input type="submit" name="submit" id="submit" value="登录" /></td>
    </tr>
  </table>
</form>
</body>
</html>
